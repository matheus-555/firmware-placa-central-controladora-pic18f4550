#include "pwm.h"

void PWM_init(double freq_pwm)
{
    unsigned char ptr2_value;

    // Liga o Timer2 com prescaler 1:16
    T2CON = 0b00000111;

    ptr2_value = (unsigned char)((SYSTEM_FOSC_CPU / (4 * freq_pwm)) - 1);

    if (ptr2_value < 1 || ptr2_value > 255)
        return;

    PR2 = ptr2_value;

    // Define PC2 como saida pwm
    clr_bit(TRISC, PIN_PWM);

    // Configura CCP1 para modo PWM
    CCP1CON = 0b00001100;
    
    // Zera duty cycle
    CCPR1L  = 0;
}

void PWM_set_duty_cycle(unsigned char duty_porcent)
{
    unsigned char duty = ((unsigned char) duty_porcent * (PR2 + 1)) / 100;

    CCPR1L = duty;
}