#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/controle_pid/controle_pid.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/inc.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/adc/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/adc/../math/math.h"
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
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/adc/../math/math.h"
uint8_t MATH_get_exponte_base_2(uint16_t valor);
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 24 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/adc/adc.h"
extern struct {
 uint16_t an[ 3 ];
}ADC_variable;

void ADC_init();
uint16_t ADC_read_channel(uint8_t ch);
void ADC_read_all();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/usb/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/usb/../adc/adc.h"
#line 16 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 44 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/usb/usb.h"
void USB_init();
void USB_index_data();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/soft_timer/soft_timer.h"
typedef struct
{
 uint16_t temp_segundos;
 uint16_t temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, uint16_t delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, uint16_t delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/timer0/../../system/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/timer0/../../system/../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 9 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/timer0/timer0.h"
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
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/pwm/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 11 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/pwm/pwm.h"
void PWM_init(uint16_t freq_pwm);
void PWM1_set_duty_cycle(uint8_t duty_porcent);
void PWM2_set_duty_cycle(uint8_t duty_porcent);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../../tasks/tasks.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../livre/livre.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../livre/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../livre/livre.h"
void LIVRE_init();
void LIVRE_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../blink_portd/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../blink_portd/blink_portd.h"
void BLINK_PORTD_init();
void BLINK_PORTD_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../contagem_binaria/contagem_binaria.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../contagem_binaria/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../contagem_binaria/contagem_binaria.h"
void void CONTAGEM_BINARIA_init();
void CONTAGEM_BINARIA_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../painel_comando/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../painel_comando/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../painel_comando/../tasks.h"
#line 9 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../painel_comando/painel_comando.h"
void PAINEL_COMANDO_init();
void PAINEL_COMANDO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../semaforo/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../semaforo/semaforo.h"
void SEMAFORO_init();
void SEMAFORO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../controle_on_off/controle_on_off.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../controle_on_off/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../controle_on_off/controle_on_off.h"
void CONTROLE_ON_OFF_init();
void CONTROLE_ON_OFF_main();
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 14 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../tasks.h"
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
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/controle_pid.h"
void CONTROLE_PID_init();
void CONTROLE_PID_main();
#line 35 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/controle_pid/controle_pid.c"
static enum {
 T_PID = 0,
 T_TGL_STOP,
 T_LENGTH
};


static float calculate_PID(float setpoint, float nivel_tanque);
static void start();
static void stop();


static SOFT_TIMER_t timer[T_LENGTH];


static float setpoint;


static float tank_level;

static float control_output = 0;
static uint16_t value_pwm = 0;

static  _Bool  isStart =  0 ;

void CONTROLE_PID_init()
{
 isStart =  0 ;
 stop();
}

void CONTROLE_PID_main()
{
  (writeBuffer[6])  = TASK_CONTROLE_PID;

 if (! (PORTB & (1 << 2)) )
 isStart =  0 ;
 else if (! (PORTB & (1 << 0)) )
 {
 isStart =  1 ;
 start();
 }

 if (isStart)
 {
 if (SOFT_TIMER_delay_ms(&timer[T_PID], 1000))
 {
 tank_level =  (readBuffer[13] | (readBuffer[14] << 8)) ;
 setpoint =  ADC_variable.an[ RA1 ] ;

 control_output = calculate_PID(setpoint, tank_level);

 if (control_output > 0)
 {

  writeBuffer[20] = 0; writeBuffer[21] = (0 >> 8) ;
 PWM2_set_duty_cycle(0);


  writeBuffer[18] = (uint16_t)control_output; writeBuffer[19] = ((uint16_t)control_output >> 8) ;
 value_pwm =  (control_output * 0.1); ;
 PWM1_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
 }
 else
 {
 control_output = -control_output;

  writeBuffer[18] = 0; writeBuffer[19] = (0 >> 8) ;
 PWM1_set_duty_cycle(0);


  writeBuffer[20] = (uint16_t)control_output; writeBuffer[21] = ((uint16_t)control_output >> 8) ;
 value_pwm =  (control_output * 0.1); ;
 PWM2_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
 }
 }
 }
 else
 stop();
}

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

static float calculate_PID(float setpoint, float nivel_tanque)
{

 static const float KP = 5.0, KI = 0.5, KD = 0.2;


 static const float MAX_VAL_SAT_INTEGRAL = 10.0;
 static const float MIN_VAL_SAT_INTEGRAL = -10.0;

 static float integral = 0.0, erro_anterior = 0.0;

 float erro = setpoint - nivel_tanque;
 float derivada = erro - erro_anterior;

 integral += erro;


 if (integral > MAX_VAL_SAT_INTEGRAL)
 integral = MAX_VAL_SAT_INTEGRAL;
 else if (integral < MIN_VAL_SAT_INTEGRAL)
 integral = MIN_VAL_SAT_INTEGRAL;

 erro_anterior = erro;

 return (KP * erro) + (KI * integral) + (KD * derivada);
}
