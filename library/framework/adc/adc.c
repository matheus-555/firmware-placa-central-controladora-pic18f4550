#include "adc.h"

#define MEDIA_MOVEL 1

#define QTDE_LEITURA ((char)16)

struct
{
    unsigned an[ADC_QTDE_CH];
} ADC_variable;

// ATENÇÃO: TEMPO MINIMO DE AQUISICAO RECOMENDADO = 2,45 us
//
// CONFIGURAÇÕES DO ADC
//
//
// clock_adc        = 48E6/8             -> 6 MHz
// tempo_conv       = 16 * clock_adc     -> 2,66 us
// tempo_amostragem = 2,5us + tempo_conv -> 5,66 us
// freq_simple      = 1/tempo_amostragem -> ~193,798 KHz
void ADC_init()
{
    register i;

    // Seta pinos como entrada
    set_bit(TRISA, ADC_PIN_AD_CH_0);
    set_bit(TRISA, ADC_PIN_AD_CH_1);
    set_bit(TRISA, ADC_PIN_AD_CH_2);

    for (i = 0; i < ADC_QTDE_CH; ++i)
        ADC_variable.an[i] = 0;

    // Habilita AN0, AN1 e AN2 e ajusta tensoes de referencia para +(VDD), -(VSS)
    ADCON1 = 0x0C;

    // --- Configura o A/D Acquisition Time e o A/D Conversion Clock
    // Alinha conersao dos bits a direita no registrador
    set_bit(ADCON2, ADFM);

    // Define 16 ciclos de clock do ADC para realizar uma conversao
    set_bit(ADCON2, ACQT2);
    set_bit(ADCON2, ACQT1);
    clr_bit(ADCON2, ACQT0);

    // Define clock de trabalho do ADC em (FOSC/8) -> 48E6/8 -> 6 MHz
    clr_bit(ADCON2, ADCS2);
    clr_bit(ADCON2, ADCS1);
    set_bit(ADCON2, ADCS0);

    // Liga ADC
    set_bit(ADCON0, ADON);

    // ADC_init();
}

// Gasta aproximadamente 18,181 KHz (55 us) para executar
unsigned ADC_read_channel(unsigned char ch)
{
    // Define o canal ADC que sera utilizado
    ADCON0 |= (ch << 2);

    // Aguarda tempo de aquisicao(2,5us)
    asm {
        #define __ASM_CICLOS 0x20

        MOVLW 14                //Carrega o literal 10 em WREG (1 ciclo)
        MOVWF __ASM_CICLOS      //Move WREG para o registrador __ASM_CICLOS (1 ciclo)
    
        DELAY_LOOP:
        NOP                     //No Operation (1 ciclo)
        DECFSZ __ASM_CICLOS, 1  //Decrementa __ASM_CICLOS e salta se zero (2 ciclos se não saltar, 1 ciclo se saltar)
        GOTO DELAY_LOOP         //Vai para DELAY_LOOP (2 ciclos)
        #undef __ASM_CICLOS
    }

    // Inicia conversao
    set_bit(ADCON0, GO_DONE);

    // Aguarda conclusao da conversao
    while (cmp_bit(ADCON0, GO_DONE));

    // Limpa canais selecionados e mantem o restante das configuracoes
    ADCON0 &= 0x03;

    // Retorna digitalizacao
    return ((ADRESH << 8) + ADRESL);
}

void ADC_read_all()
{
    register char canal;

#if MEDIA_MOVEL == 0
    for (canal = 0; canal < ADC_QTDE_CH; ++canal)
        ADC_variable.an[canal] = ADC_read_channel(canal);
#else
    register char i;
    float tmp_val;

    for (canal = 0; canal < ADC_QTDE_CH; ++canal)
    {
        tmp_val = 0;

        for (i = 0; i < QTDE_LEITURA; ++i)
            tmp_val += ADC_read_channel(canal);

        ADC_variable.an[canal] = (tmp_val / QTDE_LEITURA);
    }
#endif
}
