#include "timer0.h"

// SETAR O TIMER NA funcao init e PREENCHER AS MACROS ABAIXO
#define TIMER0_MODO_BITS 8
#define TIMER0_PREESCALER 64
#define TIMER0_OVERFLOW_SEC 1.3653E-3
#define TIMER0_TIME_DEFINED_SECONDS 1E-3
#define TIMER0_VALOR_DESEJADO_SECONDS(seg) ((1 << TIMER0_MODO_BITS) - (seg * (SYSTEM_FOSC_CPU >> 2) / TIMER0_PREESCALER))

#define TIMER0_IS_1MS   1
#define TIMER0_IS_2MS   2
#define TIMER0_IS_3MS   3
#define TIMER0_IS_10MS 10

struct
{
    bool is_finalizado[TIMER0_LENGTH];
} timer0;


static const uint16_t TIMER0_IS_FINALIZADO[TIMER0_LENGTH] = {
    TIMER0_IS_1MS,
    TIMER0_IS_2MS,
    TIMER0_IS_3MS,
    TIMER0_IS_10MS};

static uint8_t tmr0_value;
static uint16_t tmr0_ticks[TIMER0_LENGTH] = {
    0,
};

void TIMER0_init(double tempo_desejado)
{
    register i;
    bool *ptr = &timer0.is_finalizado[0];

    for (i = 0; i < TIMER0_LENGTH; ++i)
        *ptr++ = false;

    // CONFIGURACAO DO TIMER 0 EM 8 BITS, PREESCALER 64
    // OVERFLOW DE 0 À 256 A CADA 1,36 ms
    clr_bit(T0CON, TMR0ON);
    set_bit(T0CON, T08BIT);
    clr_bit(T0CON, T0CS);
    clr_bit(T0CON, T0SE);
    clr_bit(T0CON, PSA);
    set_bit(T0CON, T0PS2);
    clr_bit(T0CON, T0PS1);
    set_bit(T0CON, T0PS0);

    // Overflow a cada 1 ms
    tmr0_value = (uint8_t) TIMER0_VALOR_DESEJADO_SECONDS(tempo_desejado);
}

void TIMER0_start(bool isStart)
{
    // Inicia ou nao Interrupcao no Timer0
    if (isStart)
    {
        set_bit(INTCON, TMR0IE);
        set_bit(T0CON, TMR0ON);
    }
    else
    {
        clr_bit(INTCON, TMR0IE);
        clr_bit(T0CON, TMR0ON);
    }
}

void TIMER0_ISR()
{
    register i;
    uint16_t *ptr;

    for (i = 0, ptr = &tmr0_ticks[0]; i < TIMER0_LENGTH; ++i, ++ptr)
    {
        ++(*ptr);

        if (*ptr >= TIMER0_IS_FINALIZADO[i])
        {
            timer0.is_finalizado[i] = true;
            *ptr = 0;
        }
    }

    // Seta tempo especifico de overflow
    TMR0L = tmr0_value;
}
