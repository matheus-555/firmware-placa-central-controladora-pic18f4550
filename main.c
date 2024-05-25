#include "library/system/system.h"

#if DEBUG == 1
#define SET_BIT set_bit(LATC, 2)
#define CLR_BIT clr_bit(LATC, 2)
#define TOOGLE_BIT tgl_bit(LATC, 2)
#endif

TIMER0_t timer0;

void system_init();

void main()
{
     // Adiciona tarefas ao sistema
     TASKS_add(&LIVRE_main, TASK_LIVRE);
     TASKS_add(&BLINK_PORTD_main, TASK_BLINK_PORTD);
     TASKS_add(&CONTAGEM_BINARIA_main, TASK_CONTAGEM_BINARIA);
     TASKS_add(&CONTROLE_PID_main, TASK_CONTROLE_PID);
     TASKS_add(&SEMAFORO_main, TASK_SEMAFORO);
     TASKS_add(&PAINEL_COMANDO_main, TASK_PAINEL_COMANDO);

     // Inicializa o hardware
     system_init();

     // Define tarefa que sera escalonada
     MODO_FUNCIONAMENTO_R = TASK_LIVRE;

     for (;;)
     {
          // 2,2ms foi o tempo de execucao maximo para esse bloco
          if (timer0.is_finalizado[TIMER0_1MS])
          {
               usb_available = USB_READ();
               timer0.is_finalizado[TIMER0_1MS] = false;
          }

          // x ms foi o tempo de execucao maximo para esse bloco
          if (timer0.is_finalizado[TIMER0_3MS])
          {
               ADC_read_all();
               USB_index_data();
               USB_SEND_DATA();
               timer0.is_finalizado[TIMER0_3MS] = false;
          }
     }
}

void system_init()
{
     // ADC
     ADC_init();

     // Gpio
     GPIO_init();

#if DEBUG == 0
     PWM_init(3E3);
#else
     TRISC &= ~(1 << TRISC2);
     LATC &= ~(1 << TRISC2);
#endif

     // USB
     USB_init();

     // Timers
     TIMER0_init(&timer0, 1E-3);
     TIMER0_start(true);

     // Interrupcoes
     INTERRUPT_init();
}