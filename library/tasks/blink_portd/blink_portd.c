#include "blink_portd.h"

void BLINK_PORTD_init()
{
    MODO_FUNCIONAMENTO_T = TASK_BLINK_PORTD;
}

void BLINK_PORTD_main()
{
    static uint16_t count = 0;

    if(++count >= 1000)
    {
        LATD = ~PORTD;
        count = 0;
    }
    
}