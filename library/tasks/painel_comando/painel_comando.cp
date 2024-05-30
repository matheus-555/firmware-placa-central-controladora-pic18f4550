#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/painel_comando/painel_comando.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/soft_timer/soft_timer.h"
typedef struct
{
 unsigned temp_segundos;
 unsigned temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/usb/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/usb/../adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/usb/../adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/usb/../adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_inicia();
void ADC_read_all();
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 43 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/usb/usb.h"
void USB_init();
void USB_index_data();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/inc.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/soft_timer/soft_timer.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/timer0/../../system/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/timer0/../../system/../tasks/tasks.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/timer0/timer0.h"
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
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/pwm/../macros/macros.h"
#line 10 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/pwm/pwm.h"
void PWM_init(double freq_pwm);
void PWM1_set_duty_cycle(unsigned char duty_porcent);
void PWM2_set_duty_cycle(unsigned char duty_porcent);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/interrupt/../../tasks/tasks.h"
#line 8 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../../framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../livre/livre.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../livre/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../livre/livre.h"
void LIVRE_init();
void LIVRE_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../blink_portd/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../blink_portd/blink_portd.h"
void BLINK_PORTD_init();
void BLINK_PORTD_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../contagem_binaria/contagem_binaria.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../contagem_binaria/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../contagem_binaria/contagem_binaria.h"
void void CONTAGEM_BINARIA_init();
void CONTAGEM_BINARIA_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../controle_pid/controle_pid.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../controle_pid/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../controle_pid/controle_pid.h"
void CONTROLE_PID_init();
void CONTROLE_PID_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../painel_comando/painel_comando.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../semaforo/semaforo.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../semaforo/../tasks.h"
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../semaforo/semaforo.h"
void SEMAFORO_init();
void SEMAFORO_main();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../controle_on_off/controle_on_off.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../controle_on_off/../tasks.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../controle_on_off/controle_on_off.h"
void CONTROLE_ON_OFF_init();
void CONTROLE_ON_OFF_main();
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/../tasks.h"
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
#line 9 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/tasks/painel_comando/painel_comando.h"
void PAINEL_COMANDO_init();
void PAINEL_COMANDO_main();
#line 136 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/tasks/painel_comando/painel_comando.c"
typedef struct
{


  _Bool  auxErro;
  _Bool  auxAuto;
  _Bool  auxManual;
  _Bool  auxStart;
 unsigned char auxQtdeFabricada;
 unsigned char auxContagemPeca;
 SOFT_TIMER_t timerErro;
 SOFT_TIMER_t timerReset;
 SOFT_TIMER_t timerConexao;


 unsigned char passoMaquina1;
  _Bool  auxMaq1_bordaDescida;


 unsigned char passoMaquina2;


 unsigned char passoMaquina3;
  _Bool  auxMaq3_bordaDescida;


 unsigned char passoMaquina4;
  _Bool  auxMaq4_isTampa;


 unsigned char passoMaquina5;
  _Bool  auxMaq5_Est1_bordaDescida;
  _Bool  auxMaq5_Est2_bordaDescida;
  _Bool  auxMaq5_isMontagem;
  _Bool  auxMaq5_isTampa;

} PAINEL_COMANDO_t;


static void Painel_Init(PAINEL_COMANDO_t *p);
static  _Bool  Painel_isMontagem(unsigned char idPeca);
static  _Bool  Painel_isFazTampa(unsigned char qtdeAuxContagemPeca, unsigned char idPeca);
static  _Bool  Painel_isPecaBruta(unsigned char sensTipoPeca);
static unsigned char Painel_VerificaCor(unsigned char idPeca, unsigned char cont);
static void Painel_Emergencia(PAINEL_COMANDO_t *p);
static void Painel_VerificaConexao(PAINEL_COMANDO_t *p);
static void Painel_Erro(PAINEL_COMANDO_t *p);
static void Painel_Painel(PAINEL_COMANDO_t *p);
static void Painel_Maquina5(PAINEL_COMANDO_t *p);
static void Painel_Maquina4(PAINEL_COMANDO_t *p);
static void Painel_Maquina3(PAINEL_COMANDO_t *p);
static void Painel_Maquina2(PAINEL_COMANDO_t *p);
static void Painel_Maquina1(PAINEL_COMANDO_t *p);
static void Painel_Modo(PAINEL_COMANDO_t *p);


static PAINEL_COMANDO_t painel;

void PAINEL_COMANDO_init()
{
 Painel_Init(&painel);
}

void PAINEL_COMANDO_main()
{
  (writeBuffer[6])  = TASK_PAINEL_COMANDO;

 Painel_Modo(&painel);
}


static void Painel_Init(PAINEL_COMANDO_t *p)
{


  (writeBuffer[8])  = 0;
  (readBuffer[7])  = 0;


 p->auxErro =  1 ;
 p->auxAuto =  0 ;
 p->auxManual =  0 ;
 p->auxStart =  0 ;
 p->auxQtdeFabricada = 0x00;
 p->auxContagemPeca = 0x00;


 p->passoMaquina1 = 0x00;
 p->auxMaq1_bordaDescida =  0 ;


 p->passoMaquina2 = 0x00;


 p->passoMaquina3 = 0x00;
 p->auxMaq3_bordaDescida =  0 ;


 p->passoMaquina4 = 0;
 p->auxMaq4_isTampa =  0 ;


 p->passoMaquina5 = 0;
 p->auxMaq5_isMontagem =  0 ;
 p->auxMaq5_isTampa =  0 ;
 p->auxMaq5_Est1_bordaDescida =  0 ;
 p->auxMaq5_Est2_bordaDescida =  0 ;

}


static  _Bool  Painel_isMontagem(unsigned char idPeca)
{
 return (idPeca < 9);
}


static  _Bool  Painel_isFazTampa(unsigned char qtdeAuxContagemPeca, unsigned char idPeca)
{
 if (idPeca < 9)
 return (qtdeAuxContagemPeca % 2 == 0);

 return (idPeca < 12);
}


static  _Bool  Painel_isPecaBruta(unsigned char sensTipoPeca)
{

 if (sensTipoPeca == 1 || sensTipoPeca == 4 || sensTipoPeca == 7)
 return  1 ;

 return  0 ;

}


static unsigned char Painel_VerificaCor(unsigned char idPeca, unsigned char cont)
{

 if (Painel_isMontagem(idPeca))
 {
 switch (idPeca)
 {

 case 0:
 return 0;
 case 3:
 return 1;
 case 6:
 return 2;


 default:
 if (idPeca < 3)
 if (Painel_isFazTampa(cont, idPeca))
 return 0;
 else if (idPeca == 1)
 return 2;
 else
 return 1;
 else if (idPeca < 6)
 if (Painel_isFazTampa(cont, idPeca))
 return 1;
 else if (idPeca == 4)
 return 0;
 else
 return 2;
 else if (Painel_isFazTampa(cont, idPeca))
 return 2;
 else if (idPeca == 7)
 return 0;
 else
 return 1;
 }
 }
 else
 {
 if (idPeca == 9 || idPeca == 12)
 return 0;
 else if (idPeca == 10 || idPeca == 13)
 return 2;
 else if (idPeca == 11 || idPeca == 14)
 return 1;
 }

 return 0xFF;

}


static void Painel_Emergencia(PAINEL_COMANDO_t *p)
{


 p->auxErro =  1 ;
 p->auxAuto =  0 ;
 p->auxManual =  0 ;
 p->auxStart =  0 ;
 p->auxQtdeFabricada = 0x00;
 p->auxContagemPeca = 0x00;

  (writeBuffer[4] &= ~(1 << 0)) ;


 p->passoMaquina1 = 0x00;
 p->auxMaq1_bordaDescida =  0 ;

  (writeBuffer[0] &= ~(1 << 2)) ;
  (writeBuffer[0] &= ~(1 << 0)) ;
  (writeBuffer[0] &= ~(1 << 1)) ;
  (writeBuffer[0] &= ~(1 << 3)) ;
  (writeBuffer[17] &= ~(1 << 0)) ;
  (writeBuffer[17] &= ~(1 << 1)) ;


 p->passoMaquina2 = 0x00;

  (writeBuffer[0] &= ~(1 << 5)) ;
  (writeBuffer[0] &= ~(1 << 4)) ;
  (writeBuffer[0] |= (1 << 6)) ;


 p->passoMaquina3 = 0x00;
 p->auxMaq3_bordaDescida =  0 ;

  (writeBuffer[1] &= ~(1 << 0)) ;


 p->passoMaquina4 = 0;
 p->auxMaq4_isTampa =  0 ;

  (writeBuffer[1] &= ~(1 << 3)) ;


 p->passoMaquina5 = 0;
 p->auxMaq5_isMontagem =  0 ;
 p->auxMaq5_isTampa =  0 ;
 p->auxMaq5_Est1_bordaDescida =  0 ;
 p->auxMaq5_Est2_bordaDescida =  0 ;

  (writeBuffer[1] &= ~(1 << 4)) ;
  (writeBuffer[1] &= ~(1 << 7)) ;




  (PORTD |= (1 << 1 )) ;


  (writeBuffer[3] |= (1 << 0)) ;


  (PORTD &= ~(1 << 0 )) ;


  (writeBuffer[3] &= ~(1 << 1)) ;

 if ( (PORTB & (1 << 0)) )
 {

  (PORTD &= ~(1 << 2 )) ;


  (writeBuffer[3] &= ~(1 << 2)) ;
 }


  (PORTD &= ~(1 << 7 )) ;
  (writeBuffer[2] &= ~(1 << 7)) ;


  (PORTD &= ~(1 << 5 )) ;
  (writeBuffer[2] &= ~(1 << 6)) ;


  (PORTD &= ~(1 << 6 )) ;
  (writeBuffer[2] &= ~(1 << 5)) ;
}


static void Painel_VerificaConexao(PAINEL_COMANDO_t *p)
{


 if (! (readBuffer[9] & (1 << 0)) )
 {

 Painel_Emergencia(p);

 if (SOFT_TIMER_delay_s(&p->timerConexao, 1))
 {
  (writeBuffer[3] ^= (1 << 2)) ;
  (PORTD ^= (1 << 2 )) ;
 }
 }
 else if (p->auxErro)
 p->auxQtdeFabricada =  (readBuffer[10]) ;
}


static void Painel_Erro(PAINEL_COMANDO_t *p)
{
  (PORTD |= (1 << 6 )) ;
  (writeBuffer[2] |= (1 << 5)) ;

  (writeBuffer[0] &= ~(1 << 6)) ;

 if (SOFT_TIMER_delay_s(&p->timerErro, 1))
 {
  (PORTD ^= (1 << 1 )) ;
  (writeBuffer[3] ^= (1 << 0)) ;
 }


 if (! (PORTB & (1 << 3)) )
 {

  (writeBuffer[0] |= (1 << 4)) ;


  (writeBuffer[1] &= ~(1 << 1)) ;
  (writeBuffer[1] &= ~(1 << 2)) ;


  (writeBuffer[1] &= ~(1 << 6)) ;
  (writeBuffer[1] &= ~(1 << 5)) ;
  (writeBuffer[2] &= ~(1 << 1)) ;
  (writeBuffer[2] &= ~(1 << 0)) ;
  (writeBuffer[2] &= ~(1 << 4)) ;
  (writeBuffer[2] &= ~(1 << 3)) ;
  (writeBuffer[2] &= ~(1 << 2)) ;

 if (SOFT_TIMER_delay_s(&p->timerReset, 1))
 p->auxErro = 0;
 }
 else
 SOFT_TIMER_reset(&p->timerReset);
}


static void Painel_Painel(PAINEL_COMANDO_t *p)
{
  (PORTD &= ~(1 << 1 )) ;
  (writeBuffer[3] &= ~(1 << 0)) ;

  (PORTD &= ~(1 << 6 )) ;
  (writeBuffer[2] &= ~(1 << 5)) ;


 if (! (PORTB & (1 << 1)) )
 {
 p->auxAuto = 0;
  (PORTD &= ~(1 << 7 )) ;
  (writeBuffer[2] &= ~(1 << 7)) ;
 }
 else if (! (PORTB & (1 << 2)) )
 {
 if (! (PORTB & (1 << 4)) )
 {
 p->auxAuto = 1;
 p->auxManual = 0;
  (PORTD |= (1 << 7 )) ;
  (writeBuffer[2] |= (1 << 7)) ;
 }
 else
 {
 p->auxManual = 1;
 p->auxAuto = 0;
  (PORTD &= ~(1 << 7 )) ;
  (writeBuffer[2] &= ~(1 << 7)) ;
 }
 }


 if (!(p->auxStart))
 {
 if ( (readBuffer[9] & (1 << 0)) )
 {
  (writeBuffer[3] |= (1 << 2)) ;
  (PORTD |= (1 << 2 )) ;
 }

  (PORTD &= ~(1 << 0 )) ;
  (writeBuffer[3] &= ~(1 << 1)) ;

  (PORTD |= (1 << 5 )) ;
  (writeBuffer[2] |= (1 << 6)) ;
 }
 else
 {
 if ( (readBuffer[9] & (1 << 0)) )
 {
  (PORTD &= ~(1 << 2 )) ;
  (writeBuffer[3] &= ~(1 << 2)) ;
 }

  (PORTD |= (1 << 0 )) ;
  (writeBuffer[3] |= (1 << 1)) ;

  (PORTD &= ~(1 << 5 )) ;
  (writeBuffer[2] &= ~(1 << 6)) ;
 }
}


static void Painel_Maquina5(PAINEL_COMANDO_t *p)
{

 switch (p->passoMaquina5)
 {

 case 0:

  (writeBuffer[1] &= ~(1 << 6)) ;
  (writeBuffer[1] &= ~(1 << 5)) ;
  (writeBuffer[2] &= ~(1 << 1)) ;
  (writeBuffer[2] &= ~(1 << 0)) ;
  (writeBuffer[1] &= ~(1 << 4)) ;
  (writeBuffer[1] &= ~(1 << 7)) ;
  (writeBuffer[2] &= ~(1 << 4)) ;
  (writeBuffer[2] &= ~(1 << 2)) ;
  (writeBuffer[2] &= ~(1 << 3)) ;

 break;

 case 5:

 if (p->auxMaq5_isTampa)
 p->passoMaquina5 = 10;
 else
 p->passoMaquina5 = 100;

 break;


 case 10:

  (writeBuffer[1] |= (1 << 4)) ;

 if (p->auxMaq5_isMontagem)
 p->passoMaquina5 = 30;
 else
 p->passoMaquina5 = 15;

 break;


 case 15:

  (writeBuffer[1] |= (1 << 5)) ;

 if ( (readBuffer[1] & (1 << 5)) )
 p->auxMaq5_Est1_bordaDescida =  1 ;
 else if (p->auxMaq5_Est1_bordaDescida)
 {
 p->auxMaq5_Est1_bordaDescida =  0 ;
 p->passoMaquina5 = 200;
 }

 break;


 case 30:

 if ( (readBuffer[1] & (1 << 5)) )
 p->auxMaq5_Est1_bordaDescida =  1 ;
 else if (p->auxMaq5_Est1_bordaDescida)
 {
 p->auxMaq5_Est1_bordaDescida =  0 ;
 p->passoMaquina5 = 35;
 }

 break;


 case 35:

  (writeBuffer[1] &= ~(1 << 4)) ;
  (writeBuffer[1] |= (1 << 6)) ;

 if ( (readBuffer[1] & (1 << 7)) )
 p->passoMaquina5 = 130;

 break;


 case 100:

  (writeBuffer[1] |= (1 << 7)) ;

 if (p->auxMaq5_isMontagem)
 p->passoMaquina5 = 120;
 else
 p->passoMaquina5 = 105;

 break;


 case 105:

  (writeBuffer[2] |= (1 << 0)) ;

 if ( (readBuffer[2] & (1 << 0)) )
 p->auxMaq5_Est2_bordaDescida =  1 ;
 else if (p->auxMaq5_Est2_bordaDescida)
 {
 p->auxMaq5_Est2_bordaDescida =  0 ;
 p->passoMaquina5 = 200;
 }

 break;


 case 120:


 if ( (readBuffer[2] & (1 << 0)) )
 p->auxMaq5_Est2_bordaDescida =  1 ;
 else if (p->auxMaq5_Est2_bordaDescida)
 {
 p->auxMaq5_Est2_bordaDescida =  0 ;
 p->passoMaquina5 = 121;
 }

 break;

 case 121:

  (writeBuffer[1] &= ~(1 << 7)) ;
  (writeBuffer[2] |= (1 << 1)) ;

 if ( (readBuffer[2] & (1 << 2)) )
 p->passoMaquina5 = 130;

 break;


 case 130:


 if ( (readBuffer[1] & (1 << 7))  &&  (readBuffer[2] & (1 << 2)) )
 p->passoMaquina5 = 135;

 break;

 case 135:

  (writeBuffer[2] |= (1 << 3)) ;

 if ( (readBuffer[2] & (1 << 4)) )
 p->auxMaq5_Est1_bordaDescida =  1 ;
 else if (p->auxMaq5_Est1_bordaDescida)
 {

 p->auxMaq5_Est1_bordaDescida =  0 ;
 p->passoMaquina5 = 140;
 }

 break;

 case 140:

  (writeBuffer[2] |= (1 << 4)) ;

 if ( (readBuffer[2] & (1 << 5)) )
 p->passoMaquina5 = 145;

 break;

 case 145:

  (writeBuffer[1] &= ~(1 << 6)) ;

 if (! (readBuffer[1] & (1 << 7)) )
 p->passoMaquina5 = 150;

 break;

 case 150:

  (writeBuffer[2] &= ~(1 << 3)) ;

 if ( (readBuffer[2] & (1 << 4)) )
 p->auxMaq5_Est1_bordaDescida =  1 ;
 else if (p->auxMaq5_Est1_bordaDescida)
 {

 p->auxMaq5_Est1_bordaDescida =  0 ;
 p->passoMaquina5 = 155;
 }

 break;

 case 155:

  (writeBuffer[2] |= (1 << 2)) ;

 if ( (readBuffer[2] & (1 << 3)) )
 p->auxMaq5_Est2_bordaDescida =  1 ;
 else if (p->auxMaq5_Est2_bordaDescida)
 {

 p->auxMaq5_Est2_bordaDescida =  0 ;
 p->passoMaquina5 = 160;
 }

 break;

 case 160:

  (writeBuffer[2] |= (1 << 3)) ;
  (writeBuffer[2] &= ~(1 << 1)) ;

 if ( (readBuffer[2] & (1 << 4)) )
 p->auxMaq5_Est2_bordaDescida =  1 ;
 else if (p->auxMaq5_Est2_bordaDescida)
 {

 p->auxMaq5_Est2_bordaDescida = 0;
 p->passoMaquina5 = 165;
 }

 break;

 case 165:

  (writeBuffer[2] &= ~(1 << 4)) ;

 p->passoMaquina5 = 170;

 break;

 case 170:

  (writeBuffer[2] &= ~(1 << 3)) ;

 if ( (readBuffer[2] & (1 << 4)) )
 p->auxMaq5_Est2_bordaDescida =  1 ;
 else if (p->auxMaq5_Est2_bordaDescida)
 {

 p->auxMaq5_Est2_bordaDescida =  0 ;
 p->passoMaquina5 = 175;
 }

 break;

 case 175:


  (writeBuffer[2] |= (1 << 0)) ;
  (writeBuffer[1] |= (1 << 7)) ;
  (writeBuffer[2] &= ~(1 << 2)) ;
 p->passoMaquina5 = 200;

 break;


 case 200:

 if (! (readBuffer[2] & (1 << 6)) )
 p->passoMaquina5 = 205;

 break;


 case 205:

  (writeBuffer[8])  = p->auxQtdeFabricada;

 if (p->auxQtdeFabricada >=  (readBuffer[7]) )
 {
  (writeBuffer[4] |= (1 << 0)) ;
 p->passoMaquina5 = 210;
 }
 else
 p->passoMaquina5 = 0;

 break;


 case 210:

 if ( (readBuffer[7])  == 0)
 {
  (writeBuffer[4] &= ~(1 << 0)) ;
 p->auxQtdeFabricada = 0;
 p->auxStart =  0 ;
  (writeBuffer[8])  = 0;

 if (p->auxManual)
 p->auxManual = 0;

 p->passoMaquina5 = 0;
 }

 break;

 default:
 break;

 }
}


static void Painel_Maquina4(PAINEL_COMANDO_t *p)
{

 switch (p->passoMaquina4)
 {

 case 0:

  (writeBuffer[1] &= ~(1 << 1)) ;
  (writeBuffer[1] &= ~(1 << 2)) ;
  (writeBuffer[1] &= ~(1 << 3)) ;

 break;

 case 5:

  (writeBuffer[1] |= (1 << 3)) ;

 p->passoMaquina4 = 10;

 break;

 case 10:

 if (p->auxMaq4_isTampa)
 {
 if ( (readBuffer[0] & (1 << 7)) )
 p->passoMaquina4 = 15;
 }
 else if ( (readBuffer[1] & (1 << 2)) )
 p->passoMaquina4 = 25;

 break;


 case 15:

  (writeBuffer[1] &= ~(1 << 3)) ;
  (writeBuffer[1] |= (1 << 1)) ;

 if ( (readBuffer[1] & (1 << 1)) )
 p->passoMaquina4 = 20;

 break;

 case 20:

  (writeBuffer[1] &= ~(1 << 1)) ;
 p->passoMaquina4 = 35;

 break;


 case 25:

  (writeBuffer[1] &= ~(1 << 3)) ;
  (writeBuffer[1] |= (1 << 2)) ;

 if ( (readBuffer[1] & (1 << 4)) )
 p->passoMaquina4 = 30;

 break;

 case 30:

  (writeBuffer[1] &= ~(1 << 2)) ;
 p->passoMaquina4 = 35;

 break;

 case 35:

 p->passoMaquina4 = 0;
 p->passoMaquina5 = 5;

 break;

 default:
 break;

 }

}


static void Painel_Maquina3(PAINEL_COMANDO_t *p)
{

 switch (p->passoMaquina3)
 {

 case 0:

  (writeBuffer[1] &= ~(1 << 0)) ;
 p->auxMaq3_bordaDescida =  0 ;


 if ( (readBuffer[4])  > 0 && p->passoMaquina2 == 25)
 p->passoMaquina3 = 3;

 break;

 case 3:


 if (!Painel_isPecaBruta( (readBuffer[4]) ))
 {

 if (Painel_isMontagem( (readBuffer[6]) ))
 {
 if (++(p->auxContagemPeca) >= 2)
 {
 p->auxQtdeFabricada += 1;
 p->auxContagemPeca = 0;
 }

 p->auxMaq5_isMontagem =  1 ;
 }
 else
 {
 p->auxQtdeFabricada += 1;
 p->auxMaq5_isMontagem =  0 ;
 }


 if ( (readBuffer[4])  == 2 ||
  (readBuffer[4])  == 5 ||
  (readBuffer[4])  == 8)
 {
 p->auxMaq4_isTampa =  1 ;
 p->auxMaq5_isTampa =  1 ;
 }
 else
 {
 p->auxMaq4_isTampa =  0 ;
 p->auxMaq5_isTampa =  0 ;
 }

 p->passoMaquina1 = 0;
 p->passoMaquina2 = 0;
 p->passoMaquina3 = 5;
 }


 else
 p->passoMaquina3 = 15;

 break;

 case 5:

  (writeBuffer[1] |= (1 << 0)) ;

 if ( (readBuffer[0] & (1 << 6)) )
 {
 p->auxMaq3_bordaDescida =  1 ;
 p->passoMaquina4 = 5;
 }
 else if (p->auxMaq3_bordaDescida)
 {
 p->auxMaq3_bordaDescida =  0 ;
 p->passoMaquina3 = 10;
 }

 break;

 case 10:

  (writeBuffer[1] &= ~(1 << 0)) ;

 p->passoMaquina3 = 0;

 break;


 case 15:

 break;

 default:
 break;

 }

}


static void Painel_Maquina2(PAINEL_COMANDO_t *p)
{

 switch (p->passoMaquina2)
 {

 case 0:


  (writeBuffer[0] &= ~(1 << 4)) ;
  (writeBuffer[0] &= ~(1 << 5)) ;
  (writeBuffer[0] &= ~(1 << 6)) ;

 if (p->passoMaquina1 == 25)
 p->passoMaquina2 = 5;

 break;

 case 5:

 if (Painel_isFazTampa(p->auxContagemPeca,  (readBuffer[6]) ))
  (writeBuffer[0] |= (1 << 7)) ;
 else
  (writeBuffer[0] &= ~(1 << 7)) ;

 p->passoMaquina2 = 10;

 break;

 case 10:

  (writeBuffer[0] |= (1 << 5)) ;

 if ( (readBuffer[0] & (1 << 5)) )
 p->passoMaquina2 = 15;

 break;

 case 15:

 if (! (readBuffer[0] & (1 << 4)) )
 p->passoMaquina2 = 20;

 break;

 case 20:

 if ( (readBuffer[0] & (1 << 4)) )
 p->passoMaquina2 = 25;

 break;

 default:
 break;

 }
}


static void Painel_Maquina1(PAINEL_COMANDO_t *p)
{

 unsigned char auxVerificaCor;

 switch (p->passoMaquina1)
 {

 case 0:

  (writeBuffer[0] &= ~(1 << 2)) ;
  (writeBuffer[0] &= ~(1 << 0)) ;
  (writeBuffer[0] &= ~(1 << 1)) ;
  (writeBuffer[0] &= ~(1 << 3)) ;
  (writeBuffer[17] &= ~(1 << 0)) ;
  (writeBuffer[17] &= ~(1 << 1)) ;


 if (p->auxAuto || p->auxManual || p->auxStart)
 {
 p->auxStart =  1 ;

 p->passoMaquina1 = 5;
 }
 break;

 case 5:


 if (p->auxQtdeFabricada <  (readBuffer[7]) )
 p->passoMaquina1 = 10;
 else
 p->passoMaquina1 = 0;

 break;

 case 10:



 auxVerificaCor = Painel_VerificaCor( (readBuffer[6]) , p->auxContagemPeca);


 if (auxVerificaCor != 0xFF)
 {

 if (auxVerificaCor == 0)
 {
  (writeBuffer[0] |= (1 << 0)) ;

 if ( (readBuffer[0] & (1 << 0)) )
 {
  (writeBuffer[0] &= ~(1 << 0)) ;
  (writeBuffer[17] |= (1 << 0)) ;
 p->passoMaquina1 = 15;
 }
 }


 else if (auxVerificaCor == 1)
 {
  (writeBuffer[0] |= (1 << 1)) ;

 if ( (readBuffer[0] & (1 << 1)) )
 {
  (writeBuffer[0] &= ~(1 << 1)) ;
  (writeBuffer[17] |= (1 << 1)) ;
 p->passoMaquina1 = 15;
 }
 }


 else
 {
  (writeBuffer[0] |= (1 << 2)) ;

 if ( (readBuffer[0] & (1 << 2)) )
 {
  (writeBuffer[0] &= ~(1 << 2)) ;
 p->passoMaquina1 = 15;
 }
 }

 }

 break;

 case 15:

  (writeBuffer[0] |= (1 << 3)) ;

 if ( (readBuffer[0] & (1 << 3)) )
 p->auxMaq1_bordaDescida =  1 ;
 else if (p->auxMaq1_bordaDescida)
 {
 p->auxMaq1_bordaDescida =  0 ;
 p->passoMaquina1 = 20;
 }

 break;

 case 20:

  (writeBuffer[0] &= ~(1 << 3)) ;
  (writeBuffer[17] &= ~(1 << 0)) ;
  (writeBuffer[17] &= ~(1 << 1)) ;

 p->passoMaquina1 = 25;

 break;

 default:
 break;

 }

}


static void Painel_Modo(PAINEL_COMANDO_t *p)
{


 LATD = (PORTD & 0xE7);

 PAINEL_VerificaConexao(p);


 if ( (PORTB & (1 << 0)) )
 Painel_Emergencia(p);
 else if (p->auxErro)
 Painel_Erro(p);
 else
 {
 Painel_Painel(p);
 Painel_Maquina1(p);
 Painel_Maquina2(p);
 Painel_Maquina3(p);
 Painel_Maquina4(p);
 Painel_Maquina5(p);
 }
}
