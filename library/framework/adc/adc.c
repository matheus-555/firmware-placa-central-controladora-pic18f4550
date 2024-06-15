#include "adc.h"


#if ADC_MEDIA_MOVEL == 1
static uint8_t ADC_QTDE_LEITURA_BINARIO = 0;
#endif

struct
{
    uint16_t an[ADC_QTDE_CH];
} ADC_variable;




// --- OK
// ATENÇÃO: TEMPO MINIMO PARA CARGA DO CAPACITOR = 2,45 us
//
// CONFIGURAÇÕES DO ADC
//
//
// freq_adc           = (SYSTEM_FOSC/4)/ADCS -> (48MHz/4)/4 -> 12MHz/4 -> 3MHz -> 0,333 us
// freq_conv          = freq_adc/ACQT    ->  3MHz/4 -> 750 KHz -> 1,333 us
void ADC_init()
{
    register i;

    #if ADC_MEDIA_MOVEL == 1
        ADC_QTDE_LEITURA_BINARIO = MATH_get_exponte_base_2((uint16_t) ADC_QTDE_LEITURA);
    #endif

    // Seta pinos como entrada
    set_bit(TRISA, ADC_PIN_AD_CH_0);
    set_bit(TRISA, ADC_PIN_AD_CH_1);
    set_bit(TRISA, ADC_PIN_AD_CH_2);

    // Habilita AN0, AN1 e AN2 e ajusta tensoes de referencia para +(VDD), -(VSS)
    ADCON1 = 0x0C;

    for (i = 0; i < ADC_QTDE_CH; ++i)
        ADC_variable.an[i] = 0;

    // --- Configura o A/D Acquisition Time e o A/D Conversion Clock
    // Alinha conersao dos bits a direita no registrador
    set_bit(ADCON2, ADFM);

    // Define 4 ciclos de clock do ADC para realizar uma conversao
    clr_bit(ADCON2, ACQT2);
    set_bit(ADCON2, ACQT1);
    clr_bit(ADCON2, ACQT0);

    // Define clock de trabalho do ADC como (SYSTEM_FOSC/4) / 4 -> (48E6/4) / 4 -> 3 MHz
    set_bit(ADCON2, ADCS2);
    clr_bit(ADCON2, ADCS1);
    clr_bit(ADCON2, ADCS0);

    // Liga ADC
    set_bit(ADCON0, ADON);
}


// --- OK
// Gasta aproximadamente 6,52 us para executar (~ 153,374 KHz)
uint16_t ADC_read_channel(uint8_t ch)
{
    // Define o canal ADC que sera utilizado
    ADCON0 |= (ch << 2);

    // Aguarda tempo de aquisicao(2,5us)
    asm {
        // CICLO            = 83,33ns
        // QTDE_CICLO       = 2,5us / CICLO =~ 30 CICLOS
        // DELAY_LOOP       = 5 CICLOS
        #define __ASM_REG_AUX    0x20
        #define __ASM_QTDE_CICLO 6
        MOVLW __ASM_QTDE_CICLO            //Carrega o literal 10 em WREG (1 ciclo)
        MOVWF __ASM_REG_AUX //Move WREG para o registrador __ASM_REG_AUX (1 ciclo)
        DELAY_LOOP:
        NOP                     //No Operation (1 ciclo)
        DECFSZ __ASM_REG_AUX, 1 //Decrementa __ASM_REG_AUX e salta se zero (2 ciclos se não saltar, 1 ciclo se saltar)
        GOTO DELAY_LOOP         //Vai para DELAY_LOOP (2 ciclos)
        NOP                     //No Operation (1 ciclo)
        NOP                     //No Operation (1 ciclo)
        NOP                     //No Operation (1 ciclo)
        #undef __ASM_REG_AUX
        #undef __ASM_QTDE_CICLO
    }

    // Inicia conversao
    set_bit(ADCON0, GO_DONE);

    // Aguarda conclusao da conversao
    while (cmp_bit(ADCON0, GO_DONE));

    // Limpa canais selecionados e mantem o restante das configuracoes
    ADCON0 &= 0x03;

    // Retorna digitalizacao em 10 bits
    return (ADRESH << 8) | ADRESL;
}




void ADC_read_all()
{
    register canal;

#if ADC_MEDIA_MOVEL == 0
    for (canal = 0; canal < ADC_QTDE_CH; ++canal)
        ADC_variable.an[canal] = ADC_read_channel(canal);
#else
    register i;
    uint16_t tmp_val;

    for (canal = 0; canal < ADC_QTDE_CH; ++canal)
    {
        tmp_val = 0;

        for (i = 0; i < ADC_QTDE_LEITURA; ++i)
            tmp_val += ADC_read_channel(canal);

        ADC_variable.an[canal] = (tmp_val >> ADC_QTDE_LEITURA_BINARIO);
    }
#endif
}
