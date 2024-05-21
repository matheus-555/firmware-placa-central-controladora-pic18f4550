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

// -- Saidas Logicas
#define PID_fill_valve(val) \
    writeBuffer[18] = val;  \
    writeBuffer[19] = (val >> 8)

#define PID_discharge_valve(val) \
    writeBuffer[20] = val;       \
    writeBuffer[21] = (val >> 8)

static enum {
    T_10MS = 0,
    T_1S,
    T_LENGTH
};

// Metodos private
static float calculate_PID(float setpoint, float nivel_tanque);

// Atributos private
static SOFT_TIMER_t timer[T_LENGTH];

// --- Parâmetros PID
static float Kp = 5.0, Ki = 0.2, Kd = 0.1;

// Ponto de ajuste do nível do tanque
static float setpoint = 50.0;

// Nível atual do tanque
static float tank_level = 0.0;

static float integral = 0.0, previous_error = 0.0;

// Limite para antiwindup
static float max_integral = 100.0;
static float previous_derivative = 0.0;

// Fator de filtragem derivativa
static float alpha = 0.1;

static float control_output = 0;
static unsigned value_pwm = 0;

void CONTROLE_PID_main()
{
    MODO_FUNCIONAMENTO_T = TASK_CONTROLE_PID;

    if (SOFT_TIMER_delay_ms(&timer[T_10MS], 10))
    {
        tank_level = PID_level_meter;
        setpoint = PID_setpoint;

        control_output = calculate_PID(setpoint, tank_level);

        if (control_output > 0)
        {
            PID_discharge_valve(0);

            // Seta duty cycle para a valvula de entrada
            PID_fill_valve((unsigned)control_output);
            value_pwm = (control_output / 1023) * 100;
            PWM_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
        }
        else
        {
            PID_discharge_valve((unsigned)-control_output);

            // Seta duty cycle para a valvula de entrada
            PID_fill_valve(0);
            PWM_set_duty_cycle(0);
        }
    }
}

static float calculate_PID(float setpoint, float nivel_tanque)
{
    float error = setpoint - nivel_tanque;
    float derivative;

    integral += error;

    if (integral > max_integral)
        integral = max_integral; // Limitar integral para antiwindup

    if (integral < -max_integral)
        integral = -max_integral; // Limitar integral para antiwindup

    derivative = (error - previous_error);

    // Filtragem derivativa
    derivative = alpha * derivative + (1 - alpha) * previous_derivative;
    previous_error = error;
    previous_derivative = derivative;

    return (Kp * error) + (Ki * integral) + (Kd * derivative);
}