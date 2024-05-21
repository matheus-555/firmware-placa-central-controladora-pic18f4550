#include "gpio.h"


void GPIO_init() 
{
    // Define PA0 - PA2 como entrada, PA3-PA7 como saida
    TRISA    = 0xB7;

    // Define PORTB como entrada
    TRISB    = 0xFF;

    // Habilita resistores de pull-up do PORTB
    clr_bit(INTCON2, RBPU);

    // Define PORTD como saida
    TRISD    = 0x00;

    // Define nivel logico 0 no PORTD
    LATD     = 0x00;
}