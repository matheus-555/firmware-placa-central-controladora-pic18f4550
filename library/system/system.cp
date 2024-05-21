#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/system/system.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/usb/usb.h"






extern unsigned char readBuffer [64] ;
extern unsigned char writeBuffer[64] ;

void USB_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/interrupt.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../timer0/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../timer0/../macros/macros.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 10 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/../timer0/timer0.h"
void TIMER0_init();
void TIMER0_start( _Bool  val);
void TIMER0_ISR();
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/interrupt/interrupt.h"
void INTERRUPT_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/timer0/timer0.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/gpio/gpio.h"
void GPIO_init();
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/pwm/pwm.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/pwm/../../system/system.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/pwm/../macros/macros.h"
#line 9 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../framework/pwm/pwm.h"
void PWM_init(double freq_pwm);
void PWM_duty_cycle(unsigned char duty_porcent);
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../tasks/inc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/../tasks/blink_portd/blink_portd.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/kernel/kernel.h"





void KERNEL_loop();
#line 81 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/system/system.h"
void SYSTEM_init();
#line 3 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/system/system.c"
void SYSTEM_init()
{

 GPIO_init();


 PWM_init(5E3);


 USB_init();


 TIMER0_init();
 TIMER0_start( 1 );


 INTERRUPT_init();
}
