#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/timer0/timer0.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/inc.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_init();
unsigned ADC_read_channel(unsigned char ch);
void ADC_read_all();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/usb/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/usb/../adc/adc.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 43 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/usb/usb.h"
void USB_init();
void USB_index_data();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/soft_timer/soft_timer.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/soft_timer/soft_timer.h"
typedef struct
{
 unsigned temp_segundos;
 unsigned temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/pwm/../macros/macros.h"
#line 10 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/pwm/pwm.h"
void PWM_init(double freq_pwm);
void PWM1_set_duty_cycle(unsigned char duty_porcent);
void PWM2_set_duty_cycle(unsigned char duty_porcent);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/livre/livre.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/livre/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/livre/livre.h"
void LIVRE_init();
void LIVRE_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/blink_portd/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/blink_portd/blink_portd.h"
void BLINK_PORTD_init();
void BLINK_PORTD_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/contagem_binaria/contagem_binaria.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/contagem_binaria/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/contagem_binaria/contagem_binaria.h"
void void CONTAGEM_BINARIA_init();
void CONTAGEM_BINARIA_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/controle_pid/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/controle_pid/controle_pid.h"
void CONTROLE_PID_init();
void CONTROLE_PID_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/painel_comando/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/painel_comando/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/painel_comando/../tasks.h"
#line 9 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/painel_comando/painel_comando.h"
void PAINEL_COMANDO_init();
void PAINEL_COMANDO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/semaforo/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/semaforo/semaforo.h"
void SEMAFORO_init();
void SEMAFORO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/controle_on_off/controle_on_off.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/controle_on_off/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/controle_on_off/controle_on_off.h"
void CONTROLE_ON_OFF_init();
void CONTROLE_ON_OFF_main();
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/../../tasks/tasks.h"
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
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../../system/../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/timer0/timer0.h"
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
#line 15 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/timer0/timer0.c"
struct
{
  _Bool  is_finalizado[TIMER0_LENGTH];
} timer0;


static const unsigned int TIMER0_IS_FINALIZADO[TIMER0_LENGTH] = {
  1 ,
  2 ,
  3 ,
  5 };

static unsigned char tmr0_value;
static unsigned int tmr0_ticks[TIMER0_LENGTH] = {
 0,
};

void TIMER0_init(double tempo_desejado)
{
 register i;
  _Bool  *ptr = &timer0.is_finalizado[0];

 for (i = 0; i < TIMER0_LENGTH; ++i)
 *ptr++ =  0 ;



  (T0CON &= ~(1 << TMR0ON)) ;
  (T0CON |= (1 << T08BIT)) ;
  (T0CON &= ~(1 << T0CS)) ;
  (T0CON &= ~(1 << T0SE)) ;
  (T0CON &= ~(1 << PSA)) ;
  (T0CON |= (1 << T0PS2)) ;
  (T0CON &= ~(1 << T0PS1)) ;
  (T0CON |= (1 << T0PS0)) ;


 tmr0_value =  ((1 << 8 ) - (tempo_desejado * ( 48000000UL  >> 2) / 64 )) ;
}

void TIMER0_start( _Bool  isStart)
{

 if (isStart)
 {
  (INTCON |= (1 << TMR0IE)) ;
  (T0CON |= (1 << TMR0ON)) ;
 }
 else
 {
  (INTCON &= ~(1 << TMR0IE)) ;
  (T0CON &= ~(1 << TMR0ON)) ;
 }
}

void TIMER0_ISR()
{
 register i;
 unsigned int *ptr;

 for (i = 0, ptr = &tmr0_ticks[0]; i < TIMER0_LENGTH; ++i, ++ptr)
 {
 *ptr += 1;

 if (*ptr >= TIMER0_IS_FINALIZADO[i])
 {
 timer0.is_finalizado[i] =  1 ;
 *ptr = 0;
 }
 }


 TMR0L = tmr0_value;
}
