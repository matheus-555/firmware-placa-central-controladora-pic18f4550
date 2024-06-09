#include "controle_pid.h"

// -----------------------------------------------------------------
// -- Inputs Fisicas
#define PID_btn_start (PORTB & (1 << 0))
#define PID_btn_reset (PORTB & (1 << 1))
#define PID_btn_stop (PORTB & (1 << 2))
#define PID_setpoint ADC_variable.an[1]

// -- Inputs Logicas
#define PID_level_meter (readBuffer[13] | (readBuffer[14] << 8))
// #define PID_flow_meter (readBuffer[15] | (readBuffer[16] << 8))

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

// --- Parâmetros PID
// KP = 5.0
// KI = 0.5
// KD = 0.2
static const float KP = 5.0, KI = 0.5, KD = 0.2;

// Ponto de ajuste do nível do tanque
static float setpoint;

// Nível atual do tanque
static float tank_level;

// INTEGRAL
static float integral = 0.0, previous_error = 0.0;

// Limite para antiwindup
static const float MAX_VAL_INTEGRAL = 100.0;
static float previous_derivative = 0.0;

// Fator de filtragem derivativa
static const float ALPHA = 0.1;

static float control_output = 0;
static unsigned value_pwm = 0;

static bool isStart;

void CONTROLE_PID_init()
{
    isStart = false;
    stop();
}

void CONTROLE_PID_main()
{
    MODO_FUNCIONAMENTO_T = TASK_CONTROLE_PID;

    if (!PID_btn_stop)
        isStart = false;
    else if (!PID_btn_start)
    {
        isStart = true;
        start();
    }

    if (isStart)
    {
        if (SOFT_TIMER_delay_ms(&timer[T_PID], 100))
        {
            tank_level = PID_level_meter;
            setpoint = PID_setpoint;

            control_output = calculate_PID(setpoint, tank_level);

            if (control_output > 0)
            {
                // Seta duty cycle para a valvula de saida
                PID_discharge_valve(0);
                PWM2_set_duty_cycle(0);

                // Seta duty cycle para a valvula de entrada
                PID_fill_valve((unsigned)control_output);
                value_pwm = (control_output / 1023) * 100;
                PWM1_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
            }
            else
            {
                control_output = -control_output;
                // Seta duty cycle para a valvula de entrada
                PID_fill_valve(0);
                PWM1_set_duty_cycle(0);

                // Seta duty cycle para a valvula de saida
                PID_discharge_valve((unsigned)-control_output);
                value_pwm = (-control_output / 1023) * 100;
                PWM2_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
            }
        }
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
    float error = setpoint - nivel_tanque;
    float derivative;

    integral += error;

    if (integral > MAX_VAL_INTEGRAL)
        integral = MAX_VAL_INTEGRAL; // Limitar integral para antiwindup

    if (integral < -MAX_VAL_INTEGRAL)
        integral = -MAX_VAL_INTEGRAL; // Limitar integral para antiwindup

    derivative = (error - previous_error);

    // Filtragem derivativa
    derivative = ALPHA * derivative + (1 - ALPHA) * previous_derivative;
    previous_error = error;
    previous_derivative = derivative;

    return (KP * error) + (KI * integral) + (KD * derivative);
}