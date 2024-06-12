#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/pwm/pwm.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/inc.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/adc/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/adc/../math/math.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/adc/../math/math.h"
uint8_t MATH_get_exponte_base_2(uint16_t valor);
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 24 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/adc/adc.h"
extern struct {
 uint16_t an[ 3 ];
}ADC_variable;

void ADC_init();
uint16_t ADC_read_channel(uint8_t ch);
void ADC_read_all();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/usb/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/usb/../adc/adc.h"
#line 16 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 44 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/usb/usb.h"
void USB_init();
void USB_index_data();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/soft_timer/soft_timer.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/soft_timer/soft_timer.h"
typedef struct
{
 uint16_t temp_segundos;
 uint16_t temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, uint16_t delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, uint16_t delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 9 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/timer0/timer0.h"
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
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/livre/livre.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/livre/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/livre/livre.h"
void LIVRE_init();
void LIVRE_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/blink_portd/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/blink_portd/blink_portd.h"
void BLINK_PORTD_init();
void BLINK_PORTD_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/contagem_binaria/contagem_binaria.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/contagem_binaria/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/contagem_binaria/contagem_binaria.h"
void void CONTAGEM_BINARIA_init();
void CONTAGEM_BINARIA_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/controle_pid/../tasks.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/controle_pid/controle_pid.h"
void CONTROLE_PID_init();
void CONTROLE_PID_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/painel_comando/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/painel_comando/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/painel_comando/../tasks.h"
#line 9 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/painel_comando/painel_comando.h"
void PAINEL_COMANDO_init();
void PAINEL_COMANDO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/semaforo/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/semaforo/semaforo.h"
void SEMAFORO_init();
void SEMAFORO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/controle_on_off/controle_on_off.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/controle_on_off/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/controle_on_off/controle_on_off.h"
void CONTROLE_ON_OFF_init();
void CONTROLE_ON_OFF_main();
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 14 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/../../tasks/tasks.h"
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

void TASKS_add(TASK_function_t init, TASK_function_t main, uint8_t id_task);
void TASKS_main();
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../../system/../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 11 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/pwm/pwm.h"
void PWM_init(uint16_t freq_pwm);
void PWM1_set_duty_cycle(uint8_t duty_porcent);
void PWM2_set_duty_cycle(uint8_t duty_porcent);
#line 5 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/pwm/pwm.c"
static void PWM_SetFrequency(uint16_t freq);

void PWM_init(uint16_t freq_pwm)
{

  (TRISC &= ~(1 << TRISC1 )) ;
  (TRISC &= ~(1 << TRISC2 )) ;

 PWM_SetFrequency((uint16_t)freq_pwm);


 CCP1CON = 0b00001100;
 CCP2CON = 0b00001100;


 CCPR1L = 0;
 CCPR2L = 0;


 T2CON = 0b0000111;
}

void PWM1_set_duty_cycle(uint8_t duty_porcent)
{
 uint16_t duty =  (duty_porcent * 10.24) ;

 if (duty & 0x1)
  (CCP1CON |= (1 << DC1B0)) ;
 else
  (CCP1CON &= ~(1 << DC1B0)) ;

 if (duty & 0x2)
  (CCP1CON |= (1 << DC1B1)) ;
 else
  (CCP1CON &= ~(1 << DC1B1)) ;

 CCPR1L = duty>>2;
}

void PWM2_set_duty_cycle(uint8_t duty_porcent)
{
 uint16_t duty =  (duty_porcent * 10.24) ;

 if (duty & 0x1)
  (CCP2CON |= (1 << DC2B0)) ;
 else
  (CCP2CON &= ~(1 << DC2B0)) ;

 if (duty & 0x2)
  (CCP2CON |= (1 << DC2B1)) ;
 else
  (CCP2CON &= ~(1 << DC2B1)) ;

 CCPR2L = duty>>2;
}

static void PWM_SetFrequency(uint16_t freq)
{
 uint32_t pr2_val;


 pr2_val = ( 48000000UL  / (4UL * freq)) - 1;


 PR2 = pr2_val > 255 ? 255 : pr2_val;
}
