#ifndef __SOFT_TIMER_H__
#define __SOFT_TIMER_H__

#include <stdbool.h>


typedef struct
{
    unsigned temp_segundos;
    unsigned temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
bool SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms);
bool SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);

#endif