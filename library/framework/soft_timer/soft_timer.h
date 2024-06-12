#ifndef __SOFT_TIMER_H__
#define __SOFT_TIMER_H__

#include <stdbool.h>
#include <stdint.h>

typedef struct
{
    uint16_t temp_segundos;
    uint16_t temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
bool SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, uint16_t delay_ms);
bool SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, uint16_t delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);

#endif