#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/controle_on_off/controle_on_off.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/controle_on_off.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/inc.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_init();
unsigned ADC_read_channel(unsigned char ch);
void ADC_read_all();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/usb/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/usb/../adc/adc.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 43 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/usb/usb.h"
void USB_init();
void USB_index_data();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/soft_timer/soft_timer.h"
typedef struct
{
 unsigned temp_segundos;
 unsigned temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/timer0/../../system/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/timer0/../../system/../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/timer0/timer0.h"
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
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/pwm/../macros/macros.h"
#line 10 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/pwm/pwm.h"
void PWM_init(double freq_pwm);
void PWM1_set_duty_cycle(unsigned char duty_porcent);
void PWM2_set_duty_cycle(unsigned char duty_porcent);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/interrupt/../../tasks/tasks.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../../framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../livre/livre.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../livre/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../livre/livre.h"
void LIVRE_init();
void LIVRE_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../blink_portd/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../blink_portd/blink_portd.h"
void BLINK_PORTD_init();
void BLINK_PORTD_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../contagem_binaria/contagem_binaria.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../contagem_binaria/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../contagem_binaria/contagem_binaria.h"
void void CONTAGEM_BINARIA_init();
void CONTAGEM_BINARIA_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../controle_pid/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../controle_pid/controle_pid.h"
void CONTROLE_PID_init();
void CONTROLE_PID_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../painel_comando/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../painel_comando/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../painel_comando/../tasks.h"
#line 9 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../painel_comando/painel_comando.h"
void PAINEL_COMANDO_init();
void PAINEL_COMANDO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../semaforo/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../semaforo/semaforo.h"
void SEMAFORO_init();
void SEMAFORO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../controle_on_off/controle_on_off.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/../tasks.h"
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
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_on_off/controle_on_off.h"
void CONTROLE_ON_OFF_init();
void CONTROLE_ON_OFF_main();
#line 32 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/controle_on_off/controle_on_off.c"
static enum {
 T_ON_OFF = 0,
 T_TGL_STOP,
 T_LENGTH
};


static void start();
static void stop();


static SOFT_TIMER_t timer[T_LENGTH];
static  _Bool  isStart;

static void stop()
{

  writeBuffer[20] = 0; writeBuffer[21] = (0 >> 8) ;
 PWM2_set_duty_cycle(0);

  writeBuffer[18] = 0; writeBuffer[19] = (0 >> 8) ;
 PWM1_set_duty_cycle(0);


  ( (LATD &= ~(1 << 0)) ) ;


 if (SOFT_TIMER_delay_ms(&timer[T_TGL_STOP], 500))
  ( (LATD ^= (1 << 2)) ) ;
}

static void start()
{
  ( (LATD &= ~(1 << 2)) ) ;
  ( (LATD |= (1 << 0)) ) ;
}

void CONTROLE_ON_OFF_init()
{
 isStart =  0 ;
 stop();
}

void CONTROLE_ON_OFF_main()
{
  (writeBuffer[6])  = TASK_CONTROLE_ON_OFF;

 if (! (PORTB & (1 << 2)) )
 isStart =  0 ;
 else if (! (PORTB & (1 << 0)) )
 {
 isStart =  1 ;
 start();
 }

 if (isStart)
 {
 if (SOFT_TIMER_delay_ms(&timer[T_ON_OFF], 1000))
 {
 if ( ADC_variable.an[1]  !=  (readBuffer[13] | (readBuffer[14] << 8)) )
 {
 if ( (readBuffer[13] | (readBuffer[14] << 8))  <  ADC_variable.an[1] )
 {

  writeBuffer[20] = 0; writeBuffer[21] = (0 >> 8) ;
 PWM2_set_duty_cycle(0);


  writeBuffer[18] = 1000; writeBuffer[19] = (1000 >> 8) ;
 PWM1_set_duty_cycle(100);
 }
 else if ( (readBuffer[13] | (readBuffer[14] << 8))  >  ADC_variable.an[1] )
 {

  writeBuffer[18] = 0; writeBuffer[19] = (0 >> 8) ;
 PWM1_set_duty_cycle(0);


  writeBuffer[20] = 1000; writeBuffer[21] = (1000 >> 8) ;
 PWM2_set_duty_cycle(100);
 }
 }
 else
 {

  writeBuffer[18] = 0; writeBuffer[19] = (0 >> 8) ;
 PWM1_set_duty_cycle(0);


  writeBuffer[20] = 0; writeBuffer[21] = (0 >> 8) ;
 PWM2_set_duty_cycle(0);
 }
 }
 }
 else
 stop();
}
