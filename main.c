#include "library/system/system.h"

#if DEBUG == 1
#define SET_BIT set_bit(LATC, 2)
#define CLR_BIT clr_bit(LATC, 2)
#define TOOGLE_BIT tgl_bit(LATC, 2)
#endif

void system_init();

void main()
{
     // Adiciona tarefas ao sistema
     TASKS_add(&LIVRE_init, &LIVRE_main, TASK_LIVRE);
     TASKS_add(&BLINK_PORTD_init, &BLINK_PORTD_main, TASK_BLINK_PORTD);
     TASKS_add(&CONTAGEM_BINARIA_init, &CONTAGEM_BINARIA_main, TASK_CONTAGEM_BINARIA);
     TASKS_add(&CONTROLE_PID_init, &CONTROLE_PID_main, TASK_CONTROLE_PID);
     TASKS_add(&SEMAFORO_init, &SEMAFORO_main, TASK_SEMAFORO);
     TASKS_add(&PAINEL_COMANDO_init, &PAINEL_COMANDO_main, TASK_PAINEL_COMANDO);
     TASKS_add(&CONTROLE_ON_OFF_init, &CONTROLE_ON_OFF_main, TASK_CONTROLE_ON_OFF);

     // Inicializa o hardware
     system_init();

     // Define tarefa que sera escalonada
     MODO_FUNCIONAMENTO_R = TASK_LIVRE;

     for (;;)
     {
          // x ms foi o tempo de execucao maximo para esse bloco
          if (timer0.is_finalizado[TIMER0_1MS])
          {
               USB_READ_BUFF();
               ADC_read_all();
               timer0.is_finalizado[TIMER0_1MS] = false;
          }

          // x ms foi o tempo de execucao maximo para esse bloco
          if (timer0.is_finalizado[TIMER0_3MS])
          {
               USB_index_data();
               USB_SEND_DATA();
               timer0.is_finalizado[TIMER0_3MS] = false;
          }
     }
}

void system_init()
{
#if DEBUG == 0
     // ADC
     ADC_init();

     // Gpio
     GPIO_init();
     PWM_init(3E3);

     // USB
     USB_init();

     // Timers
     TIMER0_init(1E-3);
     TIMER0_start(true);

     // Interrupcoes
     INTERRUPT_init();
#else
     TRISC &= ~(1 << TRISC2);
     LATC &= ~(1 << TRISC2);
#endif
}