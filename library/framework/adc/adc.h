#ifndef __ADC_H__
#define __ADC_H__

#include "../../system/system.h"
#include "../macros/macros.h"
#include "../math/math.h"
#include <stdint.h>


// --- Ios analogicas
#define ADC_PIN_AD_CH_0 TRISA0
#define ADC_PIN_AD_CH_1 TRISA1
#define ADC_PIN_AD_CH_2 TRISA2
#define ADC_QTDE_CH 3

// --- Parametrizacao
// 1 = Sim
// 2 = Nao
#define ADC_MEDIA_MOVEL 1


// Colocar um valor que esteja na base 2
#define ADC_QTDE_LEITURA (16)

extern struct {
    uint16_t an[ADC_QTDE_CH];
}ADC_variable;

void ADC_init();
uint16_t ADC_read_channel(uint8_t ch);
void ADC_read_all();


#endif