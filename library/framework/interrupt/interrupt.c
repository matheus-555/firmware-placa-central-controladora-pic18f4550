#include "interrupt.h"

// Variavel encontra-se no main()
extern TIMER0_t timer0;

void INTERRUPT_init()
{
    // Desabilita prioridade de interrupcao
    RCON &= ~(1 << IPEN);

    // Habilita interrupcao geral e interrupcao por perifericos
    INTCON |= (1 << GIE) | (1 << PEIE);
}

// ROTINA DE TRATAMENTO DE INTERRUPCAO GLOBAL
void interrupt()
{
    // Interrupcao Timer0 (a cada 1 ms)
    if (INTCON & (1 << TMR0IF))
    {
        TASKS_main();

        // Trata interrupcao do Timer0
        TIMER0_ISR(&timer0);

        // Limpa flag de interrupcao
        INTCON &= ~(1 << TMR0IF);
    }

    // Interrucao USB
    if (PIR2 & (1 << USBIF))
    {
        // Trata interrupcao da USB
        USB_ISR();

        // Limpa flag de interrupcao
        PIR2 &= ~(1 << USBIF);
    }
}