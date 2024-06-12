#ifndef __TIMER0_H__
#define __TIMER0_H__

#include "../../system/system.h"
#include "../macros/macros.h"
#include <stdbool.h>
#include <stdint.h>

enum
{
    TIMER0_1MS = 0,
    TIMER0_2MS,
    TIMER0_3MS,
    TIMER0_10MS,
    TIMER0_LENGTH
};

extern struct {
    bool is_finalizado[TIMER0_LENGTH];
}timer0;

void TIMER0_init(double tempo_desejado);
void TIMER0_start(bool val);
void TIMER0_ISR();

#endif