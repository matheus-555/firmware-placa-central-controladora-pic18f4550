#include "adc.h"

#define MEDIA 1

#define QTDE_LEITURA ((char)16)

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
    register char canal;

#if MEDIA == 0
    for (canal = 0; canal < ADC_QTDE_CH; ++canal)
        ADC_variable.an[canal] = ADC_LER_CANAL(canal);
#else
    register char i;
    float tmp_val;

    for (canal = 0; canal < ADC_QTDE_CH; ++canal)
    {
        tmp_val = 0;

        for (i = 0; i < QTDE_LEITURA; ++i)
            tmp_val += ADC_LER_CANAL(canal);

        ADC_variable.an[canal] = (tmp_val/QTDE_LEITURA);
    }
#endif
}
