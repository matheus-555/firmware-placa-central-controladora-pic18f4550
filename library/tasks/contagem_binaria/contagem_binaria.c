#include "contagem_binaria.h"

void void CONTAGEM_BINARIA_init()
{
    MODO_FUNCIONAMENTO_T = TASK_CONTAGEM_BINARIA;
}

void CONTAGEM_BINARIA_main()
{
    static uint16_t count = 0;

    if(++count == 2000)
    {
        LATD = ++PORTD;
        count = 0;
    }
}