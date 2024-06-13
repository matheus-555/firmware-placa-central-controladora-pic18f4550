#include "library/system/system.h"



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
          if (timer0.is_finalizado[TIMER0_1MS])
          {
               USB_READ_BUFF(); // Maximo de 7,40 us para executar
               timer0.is_finalizado[TIMER0_1MS] = false;
          }

          if (timer0.is_finalizado[TIMER0_3MS])
          {
               ADC_read_all();  // Maximo de 380 us para executar
               USB_index_data(); // Constante 3 us para executar
               timer0.is_finalizado[TIMER0_3MS] = false;
          }

          if (timer0.is_finalizado[TIMER0_10MS])
          {
               USB_SEND_DATA(); // Maximo de 5,68 ms para executar
               timer0.is_finalizado[TIMER0_10MS] = false;
          }
     }
}

void system_init()
{
     // ADC
     ADC_init();

     #if DEBUG == 1
          TRISC &= ~(1<<TRISC6);
          LATC  &= ~(1<<TRISC6);
     #endif

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

}