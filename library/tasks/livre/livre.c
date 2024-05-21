#include "livre.h"

void LIVRE_main()
{
    MODO_FUNCIONAMENTO_T = TASK_LIVRE;

    if (usb_available)
    {
        LATD = (PORTD ^ USB_PORTD);

        PWM_set_duty_cycle(USB_PWM_GET_DUTY());
    }

    
}