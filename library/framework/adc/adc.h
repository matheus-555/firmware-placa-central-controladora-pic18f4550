#ifndef __ADC_H__
#define __ADC_H__

#include "../macros/macros.h"

#define ADC_PIN_AD_CH_0 RA0
#define ADC_PIN_AD_CH_1 RA1
#define ADC_PIN_AD_CH_2 RA2
#define ADC_QTDE_CH 3

//#define ADC_LER_CANAL(canal) ADC_read(canal)

extern struct {
    unsigned an[ADC_QTDE_CH];
}ADC_variable;

void ADC_init();
unsigned ADC_read_channel(unsigned char ch);
void ADC_read_all();


#endif