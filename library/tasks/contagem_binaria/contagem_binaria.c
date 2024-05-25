#include "contagem_binaria.h"

void void CONTAGEM_BINARIA_init()
{
    
}

void CONTAGEM_BINARIA_main()
{
    static unsigned count = 0;
    MODO_FUNCIONAMENTO_T = TASK_CONTAGEM_BINARIA;

    if(++count == 2000)
    {
        LATD = ++PORTD;
        count = 0;
    }
}