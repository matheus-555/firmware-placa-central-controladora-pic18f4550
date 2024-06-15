#include "tasks.h"

static struct
{
    TASK_function_t init[TASK_LENGTH];
    TASK_function_t main[TASK_LENGTH];
} task_kernel;


void TASKS_add(TASK_function_t init, TASK_function_t main, uint8_t id_task)
{
    task_kernel.init[id_task] = init;
    task_kernel.main[id_task] = main;
}

void TASKS_main()
{
    static uint8_t modo_anterior;

    // Habilita flag de comunicacao USB
    Flag_Usb_On;

    if (MODO_FUNCIONAMENTO_R != modo_anterior)
    {
        task_kernel.init[MODO_FUNCIONAMENTO_R]();
        modo_anterior = MODO_FUNCIONAMENTO_T;
    }

    // Executa tarefa selecionada
    task_kernel.main[MODO_FUNCIONAMENTO_R]();
}