#include "soft_timer.h"

// VALORES CONSIDERANDO EXECUCOES A CADA 1MS
#define SOFT_TIMER_TEMPO_500MS 500U
#define SOFT_TIMER_TEMPO_1S 1000U
#define SOFT_TIMER_TEMPO_2S 2000U
#define SOFT_TIMER_TEMPO_3S 3000U
#define SOFT_TIMER_TEMPO_10S 10000U

void SOFT_TIMER_init(SOFT_TIMER_t *timer)
{
    timer->temp_mili_segundos = 0;
    timer->temp_segundos = 0;
}

bool SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms)
{
    if (++(timer->temp_mili_segundos) >= delay_ms)
    {
        timer->temp_mili_segundos = 0;
        return true;
    }
    return false;
}

bool SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s)
{
    static unsigned aux_temp_ms = 0;

    if (++aux_temp_ms >= SOFT_TIMER_TEMPO_1S)
    {
        aux_temp_ms = 0;

        if (++(timer->temp_segundos) >= delay_s)
        {
            timer->temp_segundos = 0;
            return true;
        }
    }

    return false;
}

void SOFT_TIMER_reset(SOFT_TIMER_t *timer)
{
    SOFT_TIMER_init(timer);
}