#include "adc.h"

struct
{
    unsigned an[ADC_QTDE_CH];
} ADC_variable;

void ADC_inicia()
{
    register i;
    // Seta pinos como entrada
    set_bit(TRISA, ADC_PIN_AD_CH_0);
    set_bit(TRISA, ADC_PIN_AD_CH_1);
    set_bit(TRISA, ADC_PIN_AD_CH_2);

    // Habilita AN0, AN1 e AN2 e ajusta tensoes de referencia para +(VDD), -(VSS)
    ADCON1 = 0x0C;

    for (i = 0; i < ADC_QTDE_CH; ++i)
        ADC_variable.an[i] = 0;

    // TEMPO DE CONVERSAO = FOSC/2
    // TEMPO DE AQUISICAO = 20 TAD
    // BITS ALINHADOS A DIREITA
    // ADCON2 = 0b10111000;

    ADC_init();
}

void ADC_read_all()
{
    register char i;

    for(i=0; i < ADC_QTDE_CH; ++i)
        ADC_variable.an[i] = ADC_LER_CANAL(i);
}
