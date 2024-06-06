#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/main.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/inc.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_inicia();
void ADC_read_all();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/usb/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/usb/../adc/adc.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 43 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/usb/usb.h"
void USB_init();
void USB_index_data();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/soft_timer/soft_timer.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/soft_timer/soft_timer.h"
typedef struct
{
 unsigned temp_segundos;
 unsigned temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/timer0/timer0.h"
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
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/pwm/../macros/macros.h"
#line 10 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/pwm/pwm.h"
void PWM_init(double freq_pwm);
void PWM1_set_duty_cycle(unsigned char duty_porcent);
void PWM2_set_duty_cycle(unsigned char duty_porcent);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/livre/livre.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/livre/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/livre/livre.h"
void LIVRE_init();
void LIVRE_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/blink_portd/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/blink_portd/blink_portd.h"
void BLINK_PORTD_init();
void BLINK_PORTD_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/contagem_binaria/contagem_binaria.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/contagem_binaria/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/contagem_binaria/contagem_binaria.h"
void void CONTAGEM_BINARIA_init();
void CONTAGEM_BINARIA_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/controle_pid/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/controle_pid/controle_pid.h"
void CONTROLE_PID_init();
void CONTROLE_PID_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/painel_comando/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/painel_comando/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/painel_comando/../tasks.h"
#line 9 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/painel_comando/painel_comando.h"
void PAINEL_COMANDO_init();
void PAINEL_COMANDO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/semaforo/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/semaforo/semaforo.h"
void SEMAFORO_init();
void SEMAFORO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/controle_on_off/controle_on_off.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/controle_on_off/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/controle_on_off/controle_on_off.h"
void CONTROLE_ON_OFF_init();
void CONTROLE_ON_OFF_main();
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../../tasks/tasks.h"
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
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../tasks/tasks.h"
#line 9 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/main.c"
void system_init();

void main()
{

 TASKS_add(&LIVRE_init, &LIVRE_main, TASK_LIVRE);
 TASKS_add(&BLINK_PORTD_init, &BLINK_PORTD_main, TASK_BLINK_PORTD);
 TASKS_add(&CONTAGEM_BINARIA_init, &CONTAGEM_BINARIA_main, TASK_CONTAGEM_BINARIA);
 TASKS_add(&CONTROLE_PID_init, &CONTROLE_PID_main, TASK_CONTROLE_PID);
 TASKS_add(&SEMAFORO_init, &SEMAFORO_main, TASK_SEMAFORO);
 TASKS_add(&PAINEL_COMANDO_init, &PAINEL_COMANDO_main, TASK_PAINEL_COMANDO);
 TASKS_add(&CONTROLE_ON_OFF_init, &CONTROLE_ON_OFF_main, TASK_CONTROLE_ON_OFF);


 system_init();


  (readBuffer[5])  = TASK_LIVRE;

 for (;;)
 {

 if (timer0.is_finalizado[TIMER0_1MS])
 {
  usb_available = HID_Read() ;
 ADC_read_all();
 timer0.is_finalizado[TIMER0_1MS] =  0 ;
 }


 if (timer0.is_finalizado[TIMER0_3MS])
 {
 USB_index_data();
  HID_Write(&writeBuffer, 64) ;
 timer0.is_finalizado[TIMER0_3MS] =  0 ;
 }
 }
}

void system_init()
{


 ADC_init();


 GPIO_init();
 PWM_init(3E3);


 USB_init();


 TIMER0_init(1E-3);
 TIMER0_start( 1 );


 INTERRUPT_init();
#line 71 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/main.c"
}
