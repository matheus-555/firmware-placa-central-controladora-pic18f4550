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
    static unsigned char tmp_modo = MODO_FUNCIONAMENTO_R;

    // Habilita flag de comunicacao USB
    Flag_Usb_On;

    if (tmp_modo != MODO_FUNCIONAMENTO_R)
    {
        task_kernel.init[MODO_FUNCIONAMENTO_R]();
        tmp_modo = MODO_FUNCIONAMENTO_R;
    }

    #if DEBUG == 1
        DEBUG_LIGA_PIN();
    #endif

    // Executa tarefa selecionada
    task_kernel.main[MODO_FUNCIONAMENTO_R]();

    #if DEBUG == 1
        DEBUG_DESLIGA_PIN();
    #endif
}