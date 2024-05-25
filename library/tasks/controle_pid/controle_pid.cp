#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/controle_pid/controle_pid.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/inc.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_inicia();
void ADC_read_all();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/usb/../inc.h"
#line 11 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 41 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/usb/usb.h"
void USB_init();
void USB_index_data();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../timer0/../../system/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../timer0/../../system/../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../timer0/timer0.h"
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
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/../../tasks/tasks.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/pwm/../macros/macros.h"
#line 10 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/pwm/pwm.h"
void PWM_init(double freq_pwm);
void PWM1_set_duty_cycle(unsigned char duty_porcent);
void PWM2_set_duty_cycle(unsigned char duty_porcent);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/soft_timer/../inc.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../../framework/soft_timer/soft_timer.h"
typedef struct
{
 unsigned temp_segundos;
 unsigned temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../livre/livre.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../livre/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../livre/livre.h"
void LIVRE_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../blink_portd/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../blink_portd/blink_portd.h"
void BLINK_PORTD_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../contagem_binaria/contagem_binaria.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../contagem_binaria/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../contagem_binaria/contagem_binaria.h"
void CONTAGEM_BINARIA_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../painel_comando/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../painel_comando/painel_comando.h"
void PAINEL_COMANDO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../semaforo/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../semaforo/semaforo.h"
void SEMAFORO_main();
#line 12 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/../tasks.h"
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
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/controle_pid/controle_pid.h"
void CONTROLE_PID_main();
#line 31 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/controle_pid/controle_pid.c"
static enum {
 T_10MS = 0,
 T_1S,
 T_LENGTH
};


static float calculate_PID(float setpoint, float nivel_tanque);


static SOFT_TIMER_t timer[T_LENGTH];


static float Kp = 10.0, Ki = 0.5, Kd = 0.2;


static float setpoint = 50.0;


static float tank_level = 0.0;

static float integral = 0.0, previous_error = 0.0;


static float max_integral = 100.0;
static float previous_derivative = 0.0;


static float alpha = 0.1;

static float control_output = 0;
static unsigned value_pwm = 0;

void CONTROLE_PID_main()
{
  (writeBuffer[6])  = TASK_CONTROLE_PID;

 if (SOFT_TIMER_delay_ms(&timer[T_10MS], 10))
 {
 tank_level =  (readBuffer[13] | (readBuffer[14] << 8)) ;
 setpoint =  ADC_variable.an[1] ;

 control_output = calculate_PID(setpoint, tank_level);

 if (control_output > 0)
 {

  writeBuffer[20] = 0; writeBuffer[21] = (0 >> 8) ;
 PWM2_set_duty_cycle(0);


  writeBuffer[18] = (unsigned)control_output; writeBuffer[19] = ((unsigned)control_output >> 8) ;
 value_pwm = (control_output / 1023) * 100;
 PWM1_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
 }
 else
 {

  writeBuffer[18] = 0; writeBuffer[19] = (0 >> 8) ;
 PWM1_set_duty_cycle(0);


  writeBuffer[20] = (unsigned)-control_output; writeBuffer[21] = ((unsigned)-control_output >> 8) ;
 value_pwm = (-control_output / 1023) * 100;
 PWM2_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
 }
 }
}

static float calculate_PID(float setpoint, float nivel_tanque)
{
 float error = setpoint - nivel_tanque;
 float derivative;

 integral += error;

 if (integral > max_integral)
 integral = max_integral;

 if (integral < -max_integral)
 integral = -max_integral;

 derivative = (error - previous_error);


 derivative = alpha * derivative + (1 - alpha) * previous_derivative;
 previous_error = error;
 previous_derivative = derivative;

 return (Kp * error) + (Ki * integral) + (Kd * derivative);
}
