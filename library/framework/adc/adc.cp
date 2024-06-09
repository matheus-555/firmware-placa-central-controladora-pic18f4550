#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/adc/adc.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/../macros/macros.h"
#line 13 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/adc.h"
extern struct {
 unsigned an[ 3 ];
}ADC_variable;

void ADC_init();
unsigned ADC_read_channel(unsigned char ch);
void ADC_read_all();
#line 7 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/adc/adc.c"
struct
{
 unsigned an[ 3 ];
} ADC_variable;










void ADC_init()
{
 register i;


  (TRISA |= (1 << RA0 )) ;
  (TRISA |= (1 << RA1 )) ;
  (TRISA |= (1 << RA2 )) ;

 for (i = 0; i <  3 ; ++i)
 ADC_variable.an[i] = 0;


 ADCON1 = 0x0C;



  (ADCON2 |= (1 << ADFM)) ;


  (ADCON2 |= (1 << ACQT2)) ;
  (ADCON2 |= (1 << ACQT1)) ;
  (ADCON2 &= ~(1 << ACQT0)) ;


  (ADCON2 &= ~(1 << ADCS2)) ;
  (ADCON2 &= ~(1 << ADCS1)) ;
  (ADCON2 |= (1 << ADCS0)) ;


  (ADCON0 |= (1 << ADON)) ;


}


unsigned ADC_read_channel(unsigned char ch)
{

 ADCON0 |= (ch << 2);


 asm {


 MOVLW 14
 MOVWF  0x20 

 DELAY_LOOP:
 NOP
 DECFSZ  0x20 , 1
 GOTO DELAY_LOOP

 }


  (ADCON0 |= (1 << GO_DONE)) ;


 while ( (ADCON0 & (1 << GO_DONE)) );


 ADCON0 &= 0x03;


 return ((ADRESH << 8) + ADRESL);
}

void ADC_read_all()
{
 register char canal;





 register char i;
 float tmp_val;

 for (canal = 0; canal <  3 ; ++canal)
 {
 tmp_val = 0;

 for (i = 0; i <  ((char)16) ; ++i)
 tmp_val += ADC_read_channel(canal);

 ADC_variable.an[canal] = (tmp_val /  ((char)16) );
 }

}
