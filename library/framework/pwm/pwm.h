#ifndef __PWM_H__
#define __PWM_H__

#include "../../system/system.h"
#include "../macros/macros.h"
#include <stdint.h>

#define PIN_PWM1 TRISC1
#define PIN_PWM2 TRISC2

void PWM_init(uint16_t freq_pwm);
void PWM1_set_duty_cycle(uint8_t duty_porcent);
void PWM2_set_duty_cycle(uint8_t duty_porcent);

#endif