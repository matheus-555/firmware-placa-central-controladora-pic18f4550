#include "pwm.h"

static void PWM_SetFrequency(unsigned int freq);

void PWM_init(double freq_pwm)
{
    // Define PC2 como saida pwm
    clr_bit(TRISC, PIN_PWM1);
    clr_bit(TRISC, PIN_PWM2);

    PWM_SetFrequency((unsigned int)freq_pwm);

    // Configura CCP1 para modo PWM1 CCP2 para modo PWM2
    CCP1CON = 0b00001100;
    CCP2CON = 0b00001100;

    // Zera duty cycle
    CCPR1L = 0;
    CCPR2L = 0;

    // Liga o Timer2 com prescaler 1:x vide datasheet
    T2CON = 0b0000111;
}

void PWM1_set_duty_cycle(unsigned char duty_porcent)
{
    unsigned int duty = ((unsigned int)duty_porcent * (PR2 + 1)) / 100;

    if (duty > 255)
        duty = 255;

    if (duty & 0x1)
        set_bit(CCP1CON, DC1B0);
    else
        clr_bit(CCP1CON, DC1B0);

    if (duty & 0x2)
        set_bit(CCP1CON, DC1B1);
    else
        clr_bit(CCP1CON, DC1B1);

    CCPR1L = duty;
}

void PWM2_set_duty_cycle(unsigned char duty_porcent)
{
    unsigned int duty = ((unsigned int)duty_porcent * (PR2 + 1)) / 100;

    if (duty > 255)
        duty = 255;

    if (duty & 0x1)
        set_bit(CCP2CON, DC2B0);
    else
        clr_bit(CCP2CON, DC2B0);

    if (duty & 0x2)
        set_bit(CCP2CON, DC2B1);
    else
        clr_bit(CCP2CON, DC2B1);

    CCPR2L = duty;
}

static void PWM_SetFrequency(unsigned int freq)
{
    unsigned long pr2_val;

    // Calcula o valor de PR2 com base na frequência desejada
    pr2_val = (SYSTEM_FOSC_CPU / (4UL * freq)) - 1;

    // Configura PR2
    PR2 = pr2_val > 255 ? 255 : pr2_val;
}


