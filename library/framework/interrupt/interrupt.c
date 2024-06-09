#include "interrupt.h"



void INTERRUPT_init()
{
    // Desabilita prioridade de interrupcao
    clr_bit(RCON, IPEN);

    // Habilita interrupcao geral e interrupcao por perifericos
    set_bit(INTCON, GIE);
    set_bit(INTCON, PEIE);
}

// ROTINA DE TRATAMENTO DE INTERRUPCAO GLOBAL
void interrupt()
{
    // Interrupcao Timer0 (a cada 1 ms)
    if (cmp_bit(INTCON, TMR0IF))
    {
        TASKS_main();

        // Trata interrupcao do Timer0
        TIMER0_ISR();

        // Limpa flag de interrupcao
        clr_bit(INTCON, TMR0IF);
    }

    // Interrucao USB
    if (cmp_bit(PIR2, USBIF))
    {
        // Trata interrupcao da USB
        USB_ISR();

        // Limpa flag de interrupcao
        clr_bit(PIR2, USBIF);
    }
}