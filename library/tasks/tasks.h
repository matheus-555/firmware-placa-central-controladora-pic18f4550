#ifndef __TASKS_H__
#define __TASKS_H__

#include "../framework/inc.h"
#include "livre/livre.h"
#include "blink_portd/blink_portd.h"
#include "contagem_binaria/contagem_binaria.h"
#include "controle_pid/controle_pid.h"
#include "painel_comando/painel_comando.h"
#include "semaforo/semaforo.h"

typedef enum TASKS_id
{
    TASK_LIVRE = 0,
    TASK_BLINK_PORTD,
    TASK_PAINEL_COMANDO,
    TASK_SEMAFORO,
    TASK_CONTAGEM_BINARIA,
    TASK_CONTROLE_PID,
    TASK_LENGTH
};

typedef void (*TASK_function_t)(void);

void TASKS_add(TASK_function_t init, TASK_function_t main, unsigned id_task);
void TASKS_main();


#endif