#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/semaforo/semaforo.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/inc.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_inicia();
void ADC_read_all();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/usb/../inc.h"
#line 12 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 42 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/usb/usb.h"
void USB_init();
void USB_index_data();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/../timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/../timer0/../../system/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/../timer0/../../system/../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/../timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/../timer0/timer0.h"
enum
{
 TIMER0_1MS = 0,
 TIMER0_2MS,
 TIMER0_3MS,
 TIMER0_5MS,
 TIMER0_LENGTH
};

extern struct {
  _Bool  is_finalizado[TIMER0_LENGTH];
}timer0;

void TIMER0_init(double tempo_desejado);
void TIMER0_start( _Bool  val);
void TIMER0_ISR();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/../../tasks/tasks.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/pwm/../macros/macros.h"
#line 10 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/pwm/pwm.h"
void PWM_init(double freq_pwm);
void PWM1_set_duty_cycle(unsigned char duty_porcent);
void PWM2_set_duty_cycle(unsigned char duty_porcent);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/soft_timer/../inc.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../../framework/soft_timer/soft_timer.h"
typedef struct
{
 unsigned temp_segundos;
 unsigned temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../livre/livre.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../livre/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../livre/livre.h"
void LIVRE_init();
void LIVRE_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../blink_portd/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../blink_portd/blink_portd.h"
void BLINK_PORTD_init();
void BLINK_PORTD_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../contagem_binaria/contagem_binaria.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../contagem_binaria/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../contagem_binaria/contagem_binaria.h"
void void CONTAGEM_BINARIA_init();
void CONTAGEM_BINARIA_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../controle_pid/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../controle_pid/controle_pid.h"
void CONTROLE_PID_init();
void CONTROLE_PID_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../painel_comando/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../painel_comando/painel_comando.h"
void PAINEL_COMANDO_init();
void PAINEL_COMANDO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../controle_on_off/controle_on_off.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../controle_on_off/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../controle_on_off/controle_on_off.h"
void CONTROLE_ON_OFF_init();
void CONTROLE_ON_OFF_main();
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/../tasks.h"
typedef enum TASKS_id
{
 TASK_LIVRE = 0,
 TASK_BLINK_PORTD,
 TASK_PAINEL_COMANDO,
 TASK_SEMAFORO,
 TASK_CONTAGEM_BINARIA,
 TASK_CONTROLE_PID,
 TASK_CONTROLE_ON_OFF,
 TASK_LENGTH
};

typedef void (*TASK_function_t)(void);

void TASKS_add(TASK_function_t init, TASK_function_t main, unsigned id_task);
void TASKS_main();
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/semaforo/semaforo.h"
void SEMAFORO_init();
void SEMAFORO_main();
#line 11 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/semaforo/semaforo.c"
static void SEMAFORO_todos_vermelho();
static void SEMAFORO_fase1();
static void SEMAFORO_fase2();
static void SEMAFORO_fase3();

static SOFT_TIMER_t timer_s;
static SOFT_TIMER_t timer_ms;
static unsigned char estado = 0;

void SEMAFORO_init()
{

}

void SEMAFORO_main()
{
  (writeBuffer[6])  = TASK_SEMAFORO;

 switch (estado)
 {





 case 0:
  (LATD |= (1 << 0)) ;
  (LATD &= ~(1 << 1)) ;
  (LATD &= ~(1 << 2)) ;

 SEMAFORO_Fase1();

 if (SOFT_TIMER_delay_s(&timer_s,  8 ))
 estado = 1;

 break;






 case 1:

  (LATD &= ~(1 << 0)) ;
  (LATD |= (1 << 1)) ;
  (LATD &= ~(1 << 2)) ;

 SEMAFORO_fase1();

 if (SOFT_TIMER_delay_s(&timer_s,  3 ))
 estado = 2;

 break;






 case 2:
 SEMAFORO_todos_vermelho();

 if (SOFT_TIMER_delay_s(&timer_s,  1 ))
 estado = 3;

 break;






 case 3:

  (LATD |= (1 << 5)) ;
  (LATD &= ~(1 << 6)) ;
  (LATD &= ~(1 << 7)) ;

 SEMAFORO_fase2();

 if (SOFT_TIMER_delay_s(&timer_s,  8 ))
 estado = 4;

 break;







 case 4:

  (LATD &= ~(1 << 5)) ;
  (LATD |= (1 << 6)) ;
  (LATD &= ~(1 << 7)) ;

 SEMAFORO_fase2();

 if (SOFT_TIMER_delay_s(&timer_s,  3 ))
 estado = 5;

 break;






 case 5:
 SEMAFORO_todos_vermelho();

 if (SOFT_TIMER_delay_s(&timer_s,  1 ))
 estado = 6;

 break;






 case 6:

  (LATD |= (1 << 3)) ;
  (LATD &= ~(1 << 4)) ;

 SEMAFORO_fase3();

 if (SOFT_TIMER_delay_s(&timer_s,  5 ))
 estado = 7;

 break;






 case 7:

  (LATD &= ~(1 << 3)) ;

 if (SOFT_TIMER_delay_ms(&timer_ms,  500 ))
  (LATD ^= (1 << 4)) ;

 SEMAFORO_fase3();

 if (SOFT_TIMER_delay_s(&timer_s,  3 ))
 estado = 8;

 break;






 case 8:
 SEMAFORO_todos_vermelho();

 if (SOFT_TIMER_delay_s(&timer_s,  1 ))
 estado = 0;

 break;

 default:
 break;
 }
}

static void SEMAFORO_todos_vermelho()
{

  (LATD &= ~(1 << 0)) ;
  (LATD &= ~(1 << 1)) ;
  (LATD |= (1 << 2)) ;


  (LATD &= ~(1 << 5)) ;
  (LATD &= ~(1 << 6)) ;
  (LATD |= (1 << 7)) ;


  (LATD &= ~(1 << 3)) ;
  (LATD |= (1 << 4)) ;
}

static void SEMAFORO_fase1()
{
#line 214 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/semaforo/semaforo.c"
 LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 3));
 LATD = (PORTD | (1 << 7) | (1 << 4));
}

static void SEMAFORO_fase2()
{
#line 232 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/semaforo/semaforo.c"
 LATD = (PORTD & ~(1 << 0) & ~(1 << 1) & ~(1 << 3));
 LATD = (PORTD | (1 << 2) | (1 << 4));
}

static void SEMAFORO_fase3()
{
#line 251 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/semaforo/semaforo.c"
 LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 1) & ~(1 << 0));
 LATD = (PORTD | (1 << 7) | (1 << 2));
}
