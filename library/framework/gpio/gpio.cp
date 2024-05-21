#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/gpio/gpio.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/gpio/gpio.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/gpio/../macros/macros.h"
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/gpio/gpio.h"
void GPIO_init();
#line 4 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/gpio/gpio.c"
void GPIO_init()
{

 TRISA = 0xB7;


 TRISB = 0xFF;


  (INTCON2 &= ~(1 << RBPU)) ;


 TRISD = 0x00;


 LATD = 0x00;
}
