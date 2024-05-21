#include "blink_portd.h"

void BLINK_PORTD_main()
{
    static unsigned count = 0;
    MODO_FUNCIONAMENTO_T = TASK_BLINK_PORTD;

    if(++count >= 1000)
    {
        LATD = ~PORTD;
        count = 0;
    }
    
}