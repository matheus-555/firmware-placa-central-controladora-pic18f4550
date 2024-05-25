#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/interrupt/interrupt.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../inc.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_inicia();
void ADC_read_all();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/livre/livre.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/livre/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/livre/livre.h"
void LIVRE_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/blink_portd/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/blink_portd/blink_portd.h"
void BLINK_PORTD_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/contagem_binaria/contagem_binaria.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/contagem_binaria/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/contagem_binaria/contagem_binaria.h"
void CONTAGEM_BINARIA_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/controle_pid/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/controle_pid/controle_pid.h"
void CONTROLE_PID_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/painel_comando/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/painel_comando/painel_comando.h"
void PAINEL_COMANDO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/semaforo/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/semaforo/semaforo.h"
void SEMAFORO_main();
#line 12 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../../system/../tasks/tasks.h"
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

void TASKS_add(TASK_function_t func, unsigned id_task);
void TASKS_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../timer0/timer0.h"
enum
{
 TIMER0_1MS = 0,
 TIMER0_2MS,
 TIMER0_3MS,
 TIMER0_5MS,
 TIMER0_LENGTH
};

typedef struct
{
  _Bool  is_finalizado[TIMER0_LENGTH];
} TIMER0_t;

void TIMER0_init(Timer0_t *timer, double tempo_desejado);
void TIMER0_start( _Bool  val);
void TIMER0_ISR(Timer0_t *timer);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../pwm/../macros/macros.h"
#line 10 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../pwm/pwm.h"
void PWM_init(double freq_pwm);
void PWM1_set_duty_cycle(unsigned char duty_porcent);
void PWM2_set_duty_cycle(unsigned char duty_porcent);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../soft_timer/soft_timer.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../soft_timer/../inc.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/../soft_timer/soft_timer.h"
typedef struct
{
 unsigned temp_segundos;
 unsigned temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 11 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 41 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../usb/usb.h"
void USB_init();
void USB_index_data();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/../../tasks/tasks.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 4 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/interrupt/interrupt.c"
extern TIMER0_t timer0;

void INTERRUPT_init()
{

 RCON &= ~(1 << IPEN);


 INTCON |= (1 << GIE) | (1 << PEIE);
}


void interrupt()
{

 if (INTCON & (1 << TMR0IF))
 {

 TASKS_main();
#line 28 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/interrupt/interrupt.c"
 TIMER0_ISR(&timer0);


 INTCON &= ~(1 << TMR0IF);
 }


 if (PIR2 & (1 << USBIF))
 {

  USB_Interrupt_Proc() ;


 PIR2 &= ~(1 << USBIF);
 }
}
