#include "livre.h"


void LIVRE_init()
{
    LATD = 0x00;

    #if DEBUG == 0
    PWM1_set_duty_cycle(0);
    PWM2_set_duty_cycle(0);
    #endif
}   

void LIVRE_main()
{
    MODO_FUNCIONAMENTO_T = TASK_LIVRE;

    if (usb_available)
    {
        LATD = (PORTD ^ USB_PORTD);

        #if DEBUG == 0
        PWM1_set_duty_cycle(USB_PWM1_GET_DUTY());
        PWM2_set_duty_cycle(USB_PWM2_GET_DUTY());
        #endif
    }

    
}