#include "tasks.h"

static TASK_function_t task_function[TASK_LENGTH];

void TASKS_init()
{
    task_function[TASK_LIVRE] = LIVRE_main;
    task_function[TASK_BLINK_PORTD] = BLINK_PORTD_main;
    task_function[TASK_CONTAGEM_BINARIA] = CONTAGEM_BINARIA_main;
    task_function[TASK_CONTROLE_PID] = CONTROLE_PID_main;
    task_function[TASK_SEMAFORO] = SEMAFORO_main;
    task_function[TASK_PAINEL_COMANDO] = PAINEL_COMANDO_main;
}

void TASKS_add(TASK_function_t func, unsigned id_task)
{
    task_function[id_task] = func;
}

void TASKS_main()
{
    // Habilita flag de comunicacao USB
    Flag_Usb_On;

    // Executa tarefa selecionada
    task_function[MODO_FUNCIONAMENTO_R]();
}