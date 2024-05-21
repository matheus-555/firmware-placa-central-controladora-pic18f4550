#ifndef __PWM_H__
#define __PWM_H__

#include "../../system/system.h"
#include "../macros/macros.h"

#define PIN_PWM TRISC2

void PWM_init(double freq_pwm);
void PWM_set_duty_cycle(unsigned char duty_porcent);

#endif