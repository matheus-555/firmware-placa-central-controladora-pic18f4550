#include "controle_pid.h"

// -----------------------------------------------------------------
// -- Inputs Fisicas
#define PID_btn_start (PORTB & (1 << 0))
#define PID_btn_reset (PORTB & (1 << 1))
#define PID_btn_stop (PORTB & (1 << 2))
#define PID_setpoint ADC_variable.an[ADC_PIN_AD_CH_1]

// -- Inputs Logicas
#define PID_level_meter (readBuffer[13] | (readBuffer[14] << 8))


// -- Saidas Fisicas
#define PID_start_light_on (set_bit(LATD, 0))
#define PID_start_light_off (clr_bit(LATD, 0))
#define PID_reset_light_on (set_bit(LATD, 1))
#define PID_reset_light_off (clr_bit(LATD, 1))
#define PID_stop_light_on (set_bit(LATD, 2))
#define PID_stop_light_off (clr_bit(LATD, 2))
#define PID_stop_tgl (tgl_bit(LATD, 2))

// -- Saidas Logicas
#define PID_fill_valve(val) \
    writeBuffer[18] = val;  \
    writeBuffer[19] = (val >> 8)

#define PID_discharge_valve(val) \
    writeBuffer[20] = val;       \
    writeBuffer[21] = (val >> 8)

// Define tempo de escalonamento do PID
#define CONTROLE_PID_START_CALC_MS 500

#define CONTROLE_PID_CONVERT_TO_PWM_DUTY_PORCENT(val) (val * 0.1);
#define CONTROLE_PID_MS_TO_SEG(val) (val/1000.0)

static enum {
    T_PID = 0,
    T_TGL_STOP,
    T_LENGTH
};

// Metodos private
static float calculate_PID(float setpoint, float nivel_tanque);
static void start();
static void stop();

// Atributos private
static SOFT_TIMER_t timer[T_LENGTH];

// Ponto de ajuste do nível do tanque
static float setpoint;

// Nível atual do tanque
static float tank_level;

static float control_output = 0;
static uint16_t value_pwm = 0;

static bool isStart = false;

void CONTROLE_PID_init()
{
    MODO_FUNCIONAMENTO_T = TASK_CONTROLE_PID;
    isStart = false;
    stop();
}

void CONTROLE_PID_main()
{
    if (!PID_btn_stop)
        isStart = false;
    else if (!PID_btn_start)
    {
        isStart = true;
        start();
    }

    if (isStart)
    {
        if (SOFT_TIMER_delay_ms(&timer[T_PID], CONTROLE_PID_START_CALC_MS))
        {
            tank_level = PID_level_meter;
            setpoint   = PID_setpoint;

            control_output = calculate_PID(setpoint, tank_level);

            if (control_output > 0)
            {
                // Seta duty cycle para a valvula de saida
                PID_discharge_valve(0);
                PWM2_set_duty_cycle(0);

                // Seta duty cycle para a valvula de entrada
                PID_fill_valve((uint16_t) (control_output > 1000 ? 1000 : control_output));
                value_pwm = CONTROLE_PID_CONVERT_TO_PWM_DUTY_PORCENT(control_output);
                PWM1_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
            }
            else if (control_output < 0)
            {
                control_output = -control_output;
                // Seta duty cycle para a valvula de entrada
                PID_fill_valve(0);
                PWM1_set_duty_cycle(0);

                // Seta duty cycle para a valvula de saida
                PID_discharge_valve((uint16_t) (control_output > 1000 ? 1000 : control_output));
                value_pwm = CONTROLE_PID_CONVERT_TO_PWM_DUTY_PORCENT(control_output);
                PWM2_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
            }
            else 
            {
                // Seta duty cycle para a valvula de entrada
                PID_fill_valve(0);
                PWM1_set_duty_cycle(0);

                // Seta duty cycle para a valvula de saida
                PID_discharge_valve(0);
                PWM2_set_duty_cycle(0);
            }   
        } // SoftTimer()
    } // end start
    else
        stop();
}

static void stop()
{
    // Desliga valvulas
    PID_discharge_valve(0);
    PWM2_set_duty_cycle(0);

    PID_fill_valve(0);
    PWM1_set_duty_cycle(0);

    // Desliga sinalizacao de start
    PID_start_light_off;

    // Pisca sinalizacao de stop a cada
    if (SOFT_TIMER_delay_ms(&timer[T_TGL_STOP], 500))
        PID_stop_tgl;
}

static void start()
{
    PID_stop_light_off;
    PID_start_light_on;
}

static float calculate_PID(float setpoint, float nivel_tanque)
{
    // KP = 5.0, KI = 0.5, KD = 0.2
    static const float KP = 5.0, KI = 0.5, KD = 0.2;
    static const float DT = CONTROLE_PID_MS_TO_SEG(CONTROLE_PID_START_CALC_MS);

    // Limite para antiwindup
    static const float MAX_VAL_SAT_INTEGRAL = 10.0;
    static const float MIN_VAL_SAT_INTEGRAL = -10.0;

    static float integral = 0.0, erro_anterior = 0.0;

    float        erro          = setpoint - nivel_tanque;
    float        derivada      = (erro - erro_anterior) / DT;

    integral = integral + (erro * DT);

    // Limitar integral para antiwindup
    if (integral > MAX_VAL_SAT_INTEGRAL)
        integral = MAX_VAL_SAT_INTEGRAL; 
    else if (integral < MIN_VAL_SAT_INTEGRAL)
        integral = MIN_VAL_SAT_INTEGRAL; 

    erro_anterior = erro;

    return (KP * erro) + (KI * integral) + (KD * derivada);
}