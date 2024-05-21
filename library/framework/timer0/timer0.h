#ifndef __TIMER0_H__
#define __TIMER0_H__

#include "../../system/system.h"
#include "../macros/macros.h"
#include <stdbool.h>

enum
{
    TIMER0_1MS = 0,
    TIMER0_2MS,
    TIMER0_3MS,
    TIMER0_5MS,
    TIMER0_LENGTH
};

typedef struct
{
    bool is_finalizado[TIMER0_LENGTH];
} TIMER0_t;

void TIMER0_init(Timer0_t *timer, double tempo_desejado);
void TIMER0_start(bool val);
void TIMER0_ISR(Timer0_t *timer);

#endif