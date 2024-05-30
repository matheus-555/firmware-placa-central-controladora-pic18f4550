#include "controle_on_off.h"

// -----------------------------------------------------------------
// -- Inputs Fisicas
#define ON_OFF_btn_start (PORTB & (1 << 0))
#define ON_OFF_btn_reset (PORTB & (1 << 1))
#define ON_OFF_btn_stop (PORTB & (1 << 2))
#define ON_OFF_setpoint ADC_variable.an[1]

// -- Inputs Logicas
#define ON_OFF_level_meter (readBuffer[13] | (readBuffer[14] << 8))
// #define ON_OFF_flow_meter (readBuffer[15] | (readBuffer[16] << 8))

// -- Saidas Fisicas
#define ON_OFF_start_light_on (set_bit(LATD, 0))
#define ON_OFF_start_light_off (clr_bit(LATD, 0))
#define ON_OFF_reset_light_on (set_bit(LATD, 1))
#define ON_OFF_reset_light_off (clr_bit(LATD, 1))
#define ON_OFF_stop_light_on (set_bit(LATD, 2))
#define ON_OFF_stop_light_off (clr_bit(LATD, 2))
#define ON_OFF_stop_tgl (tgl_bit(LATD, 2))

// -- Saidas Logicas
#define ON_OFF_fill_valve(val) \
    writeBuffer[18] = val;     \
    writeBuffer[19] = (val >> 8)

#define ON_OFF_discharge_valve(val) \
    writeBuffer[20] = val;          \
    writeBuffer[21] = (val >> 8)

static enum {
    T_ON_OFF = 0,
    T_TGL_STOP,
    T_LENGTH
};

// Metodos private
static void start();
static void stop();

// Atributos private
static SOFT_TIMER_t timer[T_LENGTH];
static bool isStart;

static void stop()
{
    // Desliga valvulas
    ON_OFF_discharge_valve(0);
    PWM2_set_duty_cycle(0);

    ON_OFF_fill_valve(0);
    PWM1_set_duty_cycle(0);

    // Desliga sinalizacao de start
    ON_OFF_start_light_off;

    // Pisca sinalizacao de stop a cada
    if (SOFT_TIMER_delay_ms(&timer[T_TGL_STOP], 500))
        ON_OFF_stop_tgl;
}

static void start()
{
    ON_OFF_stop_light_off;
    ON_OFF_start_light_on;
}

void CONTROLE_ON_OFF_init()
{
    isStart = false;
    stop();
}

void CONTROLE_ON_OFF_main()
{
    MODO_FUNCIONAMENTO_T = TASK_CONTROLE_ON_OFF;

    if (!ON_OFF_btn_stop)
        isStart = false;
    else if (!ON_OFF_btn_start)
    {
        isStart = true;
        start();
    }

    if (isStart)
    {
        if (SOFT_TIMER_delay_ms(&timer[T_ON_OFF], 10))
        {
            if (ON_OFF_setpoint != ON_OFF_level_meter)
            {
                if (ON_OFF_level_meter < ON_OFF_setpoint)
                {
                    // Seta duty cycle para a valvula de saida
                    ON_OFF_discharge_valve(0);
                    PWM2_set_duty_cycle(0);

                    // Seta duty cycle para a valvula de entrada
                    ON_OFF_fill_valve(1000);
                    PWM1_set_duty_cycle(20);
                }
                else
                {
                    // Seta duty cycle para a valvula de entrada
                    ON_OFF_fill_valve(0);
                    PWM1_set_duty_cycle(0);

                    // Seta duty cycle para a valvula de saida
                    ON_OFF_discharge_valve(1000);
                    PWM2_set_duty_cycle(20);
                }
            }
        }
    } // end start
    else
        stop();
}