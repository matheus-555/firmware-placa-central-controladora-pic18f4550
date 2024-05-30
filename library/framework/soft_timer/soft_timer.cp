#line 1 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/soft_timer/soft_timer.c"
#line 1 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/soft_timer/soft_timer.h"
#line 1 "d:/programfiles/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 7 "d:/area de trabalho/projeto sistema central de controle/firmware_pic18f4550/library/framework/soft_timer/soft_timer.h"
typedef struct
{
 unsigned temp_segundos;
 unsigned temp_mili_segundos;
} SOFT_TIMER_t;

void SOFT_TIMER_init(SOFT_TIMER_t *timer);
 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms);
 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s);
void SOFT_TIMER_reset(SOFT_TIMER_t *timer);
#line 10 "D:/Area de Trabalho/Projeto Sistema Central de Controle/Firmware_PIC18F4550/library/framework/soft_timer/soft_timer.c"
void SOFT_TIMER_init(SOFT_TIMER_t *timer)
{
 timer->temp_mili_segundos = 0;
 timer->temp_segundos = 0;
}

 _Bool  SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms)
{
 if (++(timer->temp_mili_segundos) >= delay_ms)
 {
 timer->temp_mili_segundos = 0;
 return  1 ;
 }
 return  0 ;
}

 _Bool  SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s)
{
 static unsigned aux_temp_ms = 0;

 if (++aux_temp_ms >=  1000U )
 {
 aux_temp_ms = 0;

 if (++(timer->temp_segundos) >= delay_s)
 {
 timer->temp_segundos = 0;
 return  1 ;
 }
 }

 return  0 ;
}

void SOFT_TIMER_reset(SOFT_TIMER_t *timer)
{
 SOFT_TIMER_init(timer);
}
