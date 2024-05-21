#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/adc/adc.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_inicia();
void ADC_read_all();
#line 3 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/adc/adc.c"
struct
{
 unsigned an[ 3 ];
} ADC_variable;

void ADC_inicia()
{
 register i;

  (TRISA |= (1 << RA0 )) ;
  (TRISA |= (1 << RA1 )) ;
  (TRISA |= (1 << RA2 )) ;


 ADCON1 = 0x0C;

 for (i = 0; i <  3 ; ++i)
 ADC_variable.an[i] = 0;






 ADC_init();
}

void ADC_read_all()
{
 register char i;

 for(i=0; i <  3 ; ++i)
 ADC_variable.an[i] =  ADC_read(i) ;
}
