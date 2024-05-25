#ifndef __PWM_H__
#define __PWM_H__

#include "../../system/system.h"
#include "../macros/macros.h"

#define PIN_PWM1 TRISC1
#define PIN_PWM2 TRISC2

void PWM_init(double freq_pwm);
void PWM1_set_duty_cycle(unsigned char duty_porcent);
void PWM2_set_duty_cycle(unsigned char duty_porcent);

#endif