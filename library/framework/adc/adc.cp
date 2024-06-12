#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/adc/adc.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/adc.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/../macros/macros.h"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/../math/math.h"
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
#line 6 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/../math/math.h"
uint8_t MATH_get_exponte_base_2(uint16_t valor);
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 24 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/adc/adc.h"
extern struct {
 uint16_t an[ 3 ];
}ADC_variable;

void ADC_init();
uint16_t ADC_read_channel(uint8_t ch);
void ADC_read_all();
#line 5 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/adc/adc.c"
static uint8_t ADC_QTDE_LEITURA_BINARIO = 0;


struct
{
 uint16_t an[ 3 ];
} ADC_variable;










void ADC_init()
{
 register i;


 ADC_QTDE_LEITURA_BINARIO = MATH_get_exponte_base_2((uint16_t)  (16) );



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


uint16_t ADC_read_channel(uint8_t ch)
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


 return ((ADRESH << 8) | ADRESL);
}

void ADC_read_all()
{
 register canal;





 register i;
 uint16_t tmp_val;

 for (canal = 0; canal <  3 ; ++canal)
 {
 tmp_val = 0;

 for (i = 0; i <  (16) ; ++i)
 tmp_val += ADC_read_channel(canal);

 ADC_variable.an[canal] = (tmp_val >> ADC_QTDE_LEITURA_BINARIO);
 }

}
