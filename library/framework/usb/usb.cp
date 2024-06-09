#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/usb/usb.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/usb/usb.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/usb/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/usb/../adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/usb/../adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/usb/../adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_init();
unsigned ADC_read_channel(unsigned char ch);
void ADC_read_all();
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/usb/usb.h"
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;
#line 43 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/usb/usb.h"
void USB_init();
void USB_index_data();
#line 3 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/usb/usb.c"
unsigned char readBuffer[64] absolute 0x500;
unsigned char writeBuffer[64] absolute 0x540;
unsigned char usb_available = 0;

void USB_init()
{

 HID_Enable(&readBuffer, &writeBuffer);
}

void USB_index_data()
{

 writeBuffer[13] = PORTB;


 writeBuffer[14] = PORTD;


 writeBuffer[10] = ADC_variable.an[0];
 writeBuffer[11] = (ADC_variable.an[0] >> 8);


 writeBuffer[11] |= (ADC_variable.an[1] << 2);
 writeBuffer[12] = (ADC_variable.an[1] >> 6);


 writeBuffer[15] = ADC_variable.an[2];
 writeBuffer[16] = (ADC_variable.an[2] >> 8);
}
