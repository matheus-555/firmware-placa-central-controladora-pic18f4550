#include "semaforo.h"

#define SEMAFORO_TEMPO_AUTOMOVEL_VERDE_ON 8
#define SEMAFORO_TEMPO_AUTOMOVEL_AMARELO_ON 3
#define SEMAFORO_TEMPO_AUTOMOVEL_VERMELHO_ON 8
#define SEMAFORO_TEMPO_PEDESTRE_VERDE_ON 5
#define SEMAFORO_TEMPO_PEDESTRE_ALERTA 3
#define SEMAFORO_TEMPO_PEDESTRE_BLINK_MS 500
#define SEMAFORO_TEMPO_TODOS_VERMELHO 1

static void SEMAFORO_todos_vermelho();
static void SEMAFORO_fase1();
static void SEMAFORO_fase2();
static void SEMAFORO_fase3();

static SOFT_TIMER_t timer_s;
static SOFT_TIMER_t timer_ms;
static unsigned char estado = 0;

void SEMAFORO_main()
{
    MODO_FUNCIONAMENTO_T = TASK_SEMAFORO;

    switch (estado)
    {
    //  ESTADO 0 (FASE 1)
    //
    //  FA1 -> VERDE
    //  FA2 -> VERMELHO
    //  FP1 -> VERMELHO
    case 0:
        set_bit(LATD, 0); // verde
        clr_bit(LATD, 1); // amarelo
        clr_bit(LATD, 2); // vermelho

        SEMAFORO_Fase1();

        if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_VERDE_ON))
            estado = 1;

        break;

    //  ESTADO 1 (FASE 1)
    //
    //  FA1 -> AMARELO
    //  FA2 -> VERMELHO
    //  FP1 -> VERMELHO
    case 1:
        // FA1
        clr_bit(LATD, 0); // verde
        set_bit(LATD, 1); // amarelo
        clr_bit(LATD, 2); // vermelho

        SEMAFORO_fase1();

        if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_AMARELO_ON))
            estado = 2;

        break;

    //  ESTADO 2
    //
    //  FA1 -> VERMELHO
    //  FA2 -> VERMELHO
    //  FP1 -> VERMELHO
    case 2:
        SEMAFORO_todos_vermelho();

        if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
            estado = 3;

        break;

    //  ESTADO 3 (FASE 2)
    //
    //  FA1 -> VERMELHO
    //  FA2 -> VERDE
    //  FP1 -> VERMELHO
    case 3:
        // FA2
        set_bit(LATD, 5); // verde
        clr_bit(LATD, 6); // amarelo
        clr_bit(LATD, 7); // vermelho

        SEMAFORO_fase2();

        if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_VERDE_ON))
            estado = 4;

        break;

    //
    //  ESTADO 4 (FASE 2)
    //
    //  FA1 -> VERMELHO
    //  FA2 -> AMARELO
    //  FP1 -> VERMELHO
    case 4:
        // FA2
        clr_bit(LATD, 5); // verde
        set_bit(LATD, 6); // amarelo
        clr_bit(LATD, 7); // vermelho

        SEMAFORO_fase2();

        if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_AMARELO_ON))
            estado = 5;

        break;

    //  ESTADO 5 (FASE 2)
    //
    //  FA1 -> VERMELHO
    //  FA2 -> VERMELHO
    //  FP1 -> VERMELHO
    case 5:
        SEMAFORO_todos_vermelho();

        if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
            estado = 6;

        break;

    //  ESTADO 6 (FASE 3)
    //
    //  FA1 -> VERMELHO
    //  FA2 -> VERMELHO
    //  FP1 -> VERDE
    case 6:
        // FP1
        set_bit(LATD, 3); // verde
        clr_bit(LATD, 4); // vermelho

        SEMAFORO_fase3();

        if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_PEDESTRE_VERDE_ON))
            estado = 7;

        break;

    //  ESTADO 7 (FASE 3)
    //
    //  FA1 -> VERMELHO
    //  FA2 -> VERMELHO
    //  FP1 -> PISCA VERMELHO
    case 7:
        // FP1
        clr_bit(LATD, 3); // verde

        if (SOFT_TIMER_delay_ms(&timer_ms, SEMAFORO_TEMPO_PEDESTRE_BLINK_MS))
            tgl_bit(LATD, 4); // vermelho

        SEMAFORO_fase3();

        if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_PEDESTRE_ALERTA))
            estado = 8;

        break;

    //  ESTADO 8
    //
    //  FA1 -> VERMELHO
    //  FA2 -> VERMELHO
    //  FP1 -> VERMELHO
    case 8:
        SEMAFORO_todos_vermelho();

        if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
            estado = 0;

        break;

    default:
        break;
    }
}

static void SEMAFORO_todos_vermelho()
{
    // FA1
    clr_bit(LATD, 0); // verde
    clr_bit(LATD, 1); // amarelo
    set_bit(LATD, 2); // vermelho

    // FA2
    clr_bit(LATD, 5); // verde
    clr_bit(LATD, 6); // amarelo
    set_bit(LATD, 7); // vermelho

    // FP1
    clr_bit(LATD, 3); // verde
    set_bit(LATD, 4); // vermelho
}

static void SEMAFORO_fase1()
{
    /*
    //FA2
    clrBit(LATD,5); //verde
    clrBit(LATD,6); //amarelo
    setBit(LATD,7); //vermelho

    //FP1
    clrBit(LATD,3); //verde
    setBit(LATD,4); //vermelho
    */

    // 1001 0xxx
    LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 3));
    LATD = (PORTD | (1 << 7) | (1 << 4));
}

static void SEMAFORO_fase2()
{
    /*
    //FA1
    clrBit(LATD,0); //verde
    clrBit(LATD,1); //amarelo
    setBit(LATD,2); //vermelho

    //FP1
    clrBit(LATD,3); //verde
    setBit(LATD,4); //vermelho
    */

    // xxx1 0100
    LATD = (PORTD & ~(1 << 0) & ~(1 << 1) & ~(1 << 3));
    LATD = (PORTD | (1 << 2) | (1 << 4));
}

static void SEMAFORO_fase3()
{
    /*
    //FA1
    clrBit(LATD,0); //verde
    clrBit(LATD,1); //amarelo
    setBit(LATD,2); //vermelho

    //FA2
    clrBit(LATD,5); //verde
    clrBit(LATD,6); //amarelo
    setBit(LATD,7); //vermelho
    */

    // 100x x100
    LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 1) & ~(1 << 0));
    LATD = (PORTD | (1 << 7) | (1 << 2));
}