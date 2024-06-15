#include "painel_comando.h"

//------------------------------------------------------------------------------
// ----- Enderecamento USB (VIDE MAPEAMENTO)
// --- Maquina 1
// - Inputs
#define Maq1_Input_sensPcAzul (readBuffer[0] & (1 << 0))
#define Maq1_Input_sensPcMetal (readBuffer[0] & (1 << 1))
#define Maq1_Input_sensPcVerde (readBuffer[0] & (1 << 2))
#define Maq1_Input_sensFinal (readBuffer[0] & (1 << 3))
// - Outputs
#define Maq1_Output_dropAzul_On (writeBuffer[0] |= (1 << 0))
#define Maq1_Output_dropAzul_Off (writeBuffer[0] &= ~(1 << 0))
#define Maq1_Output_dropMetal_On (writeBuffer[0] |= (1 << 1))
#define Maq1_Output_dropMetal_Off (writeBuffer[0] &= ~(1 << 1))
#define Maq1_Output_dropVerde_On (writeBuffer[0] |= (1 << 2))
#define Maq1_Output_dropVerde_Off (writeBuffer[0] &= ~(1 << 2))
#define Maq1_Output_esteira_On (writeBuffer[0] |= (1 << 3))
#define Maq1_Output_esteira_Off (writeBuffer[0] &= ~(1 << 3))
#define Maq1_Output_esteiraPcAzul_On (writeBuffer[17] |= (1 << 0))
#define Maq1_Output_esteiraPcAzul_Off (writeBuffer[17] &= ~(1 << 0))
#define Maq1_Output_esteiraPcCinza_On (writeBuffer[17] |= (1 << 1))
#define Maq1_Output_esteiraPcCinza_Off (writeBuffer[17] &= ~(1 << 1))
//------------------------------------------------------------------------------
// --- Maquina 2 ---
// - Inputs
#define Maq2_Input_sensCncPortaAberta (readBuffer[0] & (1 << 4))
#define Maq2_Input_sensUsinagemOperando (readBuffer[0] & (1 << 5))
#define Maq2_Input_sensCncPercentual (readeBuffer[3])
// - Outputs
#define Maq2_Output_btnReset_On (writeBuffer[0] |= (1 << 4))
#define Maq2_Output_btnReset_Off (writeBuffer[0] &= ~(1 << 4))
#define Maq2_Output_btnStart_On (writeBuffer[0] |= (1 << 5))
#define Maq2_Output_btnStart_Off (writeBuffer[0] &= ~(1 << 5))
#define Maq2_Output_btnStop_On (writeBuffer[0] |= (1 << 6))
#define Maq2_Output_btnStop_Off (writeBuffer[0] &= ~(1 << 6))
#define Maq2_Output_fazerTampa_On (writeBuffer[0] |= (1 << 7))
#define Maq2_Output_fazerTampa_Off (writeBuffer[0] &= ~(1 << 7))
//------------------------------------------------------------------------------
// ---  Maquina 3
// - Inputs
#define Maq3_Input_sensInicio (readBuffer[0] & (1 << 6))
#define Maq3_Input_sensTipoPeca (readBuffer[4])
// - Output
#define Maq3_Output_esteira_On (writeBuffer[1] |= (1 << 0))
#define Maq3_Output_esteira_Off (writeBuffer[1] &= ~(1 << 0))
//------------------------------------------------------------------------------
// --- Maquina 4
// - Inputs
#define Maq4_Input_sens1 (readBuffer[0] & (1 << 7))
#define Maq4_Input_cln1Recuado (readBuffer[1] & (1 << 0))
#define Maq4_Input_cln1Avancado (readBuffer[1] & (1 << 1))
#define Maq4_Input_sens2 (readBuffer[1] & (1 << 2))
#define Maq4_Input_cln2Recuado (readBuffer[1] & (1 << 3))
#define Maq4_Input_cln2Avancado (readBuffer[1] & (1 << 4))
// - Outputs
#define Maq4_Output_cln1_On (writeBuffer[1] |= (1 << 1))
#define Maq4_Output_cln1_Off (writeBuffer[1] &= ~(1 << 1))
#define Maq4_Output_cln2_On (writeBuffer[1] |= (1 << 2))
#define Maq4_Output_cln2_Off (writeBuffer[1] &= ~(1 << 2))
#define Maq4_Output_esteira_On (writeBuffer[1] |= (1 << 3))
#define Maq4_Output_esteira_Off (writeBuffer[1] &= ~(1 << 3))
//------------------------------------------------------------------------------
// --- Maquina 5
// - Inputs
#define Maq5_Input_sensPc1 (readBuffer[1] & (1 << 5))
#define Maq5_Input_cln1Baixo (readBuffer[1] & (1 << 6))
#define Maq5_Input_cln1Fechado (readBuffer[1] & (1 << 7))
#define Maq5_Input_sensPc2 (readBuffer[2] & (1 << 0))
#define Maq5_Input_cln2Baixo (readBuffer[2] & (1 << 1))
#define Maq5_Input_cln2Fechado (readBuffer[2] & (1 << 2))
#define Maq5_Input_MnpSensMovX (readBuffer[2] & (1 << 3))
#define Maq5_Input_MnpSensMovZ (readBuffer[2] & (1 << 4))
#define Maq5_Input_MnpSensPcDetec (readBuffer[2] & (1 << 5))
#define Maq5_Input_sensFinal (readBuffer[2] & (1 << 6))
// - Outputs
#define Maq5_Output_est1_On (writeBuffer[1] |= (1 << 4))
#define Maq5_Output_est1_Off (writeBuffer[1] &= ~(1 << 4))
#define Maq5_Output_cln1Subir_On (writeBuffer[1] |= (1 << 5))
#define Maq5_Output_cln1Subir_Off (writeBuffer[1] &= ~(1 << 5))
#define Maq5_Output_cln1Fechar_On (writeBuffer[1] |= (1 << 6))
#define Maq5_Output_cln1Fechar_Off (writeBuffer[1] &= ~(1 << 6))
#define Maq5_Output_est2_On (writeBuffer[1] |= (1 << 7))
#define Maq5_Output_est2_Off (writeBuffer[1] &= ~(1 << 7))
#define Maq5_Output_cln2Subir_On (writeBuffer[2] |= (1 << 0))
#define Maq5_Output_cln2Subir_Off (writeBuffer[2] &= ~(1 << 0))
#define Maq5_Output_cln2Fechar_On (writeBuffer[2] |= (1 << 1))
#define Maq5_Output_cln2Fechar_Off (writeBuffer[2] &= ~(1 << 1))
#define Maq5_Output_mnpX_On (writeBuffer[2] |= (1 << 2))
#define Maq5_Output_mnpX_Off (writeBuffer[2] &= ~(1 << 2))
#define Maq5_Output_mnpZ_On (writeBuffer[2] |= (1 << 3))
#define Maq5_Output_mnpZ_Off (writeBuffer[2] &= ~(1 << 3))
#define Maq5_Output_mnpVacuo_On (writeBuffer[2] |= (1 << 4))
#define Maq5_Output_mnpVacuo_Off (writeBuffer[2] &= ~(1 << 4))
//------------------------------------------------------------------------------
// ---  Painel
// - Outputs
#define Painel_Output_btnLedReset_On (writeBuffer[2] |= (1 << 5))
#define Painel_Output_btnLedReset_Off (writeBuffer[2] &= ~(1 << 5))
#define Painel_Output_btnLedStart_On (writeBuffer[2] |= (1 << 6))
#define Painel_Output_btnLedStart_Off (writeBuffer[2] &= ~(1 << 6))
#define Painel_Output_btnLedStop_On (writeBuffer[2] |= (1 << 7))
#define Painel_Output_btnLedStop_Off (writeBuffer[2] &= ~(1 << 7))
#define Painel_Output_ledAmarelo_On (writeBuffer[3] |= (1 << 0))
#define Painel_Output_ledAmarelo_Off (writeBuffer[3] &= ~(1 << 0))
#define Painel_Output_ledAmarelo_Blk (writeBuffer[3] ^= (1 << 0))
#define Painel_Output_ledVerde_On (writeBuffer[3] |= (1 << 1))
#define Painel_Output_ledVerde_Off (writeBuffer[3] &= ~(1 << 1))
#define Painel_Output_ledVermelho_On (writeBuffer[3] |= (1 << 2))
#define Painel_Output_ledVermelho_Off (writeBuffer[3] &= ~(1 << 2))
#define Painel_Output_ledVermelho_Blk (writeBuffer[3] ^= (1 << 2))
#define Painel_Evento_QtdeFeita_On (writeBuffer[4] |= (1 << 0))
#define Painel_Evento_QtdeFeita_Off (writeBuffer[4] &= ~(1 << 0))
//------------------------------------------------------------------------------
// --- Banco de Dados
#define MySql_Banco_On (readBuffer[9] & (1 << 0))
#define MySql_QtdePeca (readBuffer[7])
#define MySql_TipoPedido (readBuffer[6])
#define MySql_ReadQtdeFabricada (readBuffer[10])
#define MySql_WriteQtdeFabricada (writeBuffer[8])
//------------------------------------------------------------------------------
// --- Leitura das Botoeiras
#define btnEmergencia (PORTB & (1 << 0))
#define btnStop (PORTB & (1 << 1))
#define btnStart (PORTB & (1 << 2))
#define btnReset (PORTB & (1 << 3))
#define btnAutomatico (PORTB & (1 << 4))
#define ledBtnStart 5
#define ledBtnReset 6
#define ledBtnStop 7
#define ledSinalVerde 0
#define ledSinalAmarelo 1
#define ledSinalVermelho 2

// Definicao da estrutura
typedef struct
{

    // --- Variaveis do Painel de Comando
    bool auxErro;                   // Auxiliar no erro da m�quina
    bool auxAuto;                   // Auxuliar no modo autom�tico
    bool auxManual;                 // Auxiliar no modo Manual
    bool auxStart;                  // Auxliar no start da produ��o
    unsigned char auxQtdeFabricada; // Auxiliar na contagem das pe�as fabricadas
    unsigned char auxContagemPeca;  // Auxiliar no par de produto
    SOFT_TIMER_t timerErro;
    SOFT_TIMER_t timerReset;
    SOFT_TIMER_t timerConexao;

    // --- Variaveis da Maquina 1
    unsigned char passoMaquina1;
    bool auxMaq1_bordaDescida;

    // --- Variaveis da Maquina 2
    unsigned char passoMaquina2;

    // --- Variaveis da Maquina 3
    unsigned char passoMaquina3;
    bool auxMaq3_bordaDescida;

    // ---- Variaveis da Maquina 4
    unsigned char passoMaquina4;
    bool auxMaq4_isTampa;

    // --- Variaveis da Maquina 5
    unsigned char passoMaquina5;
    bool auxMaq5_Est1_bordaDescida;
    bool auxMaq5_Est2_bordaDescida;
    bool auxMaq5_isMontagem;
    bool auxMaq5_isTampa;

} PAINEL_COMANDO_t;

// Metodos privates
static void Painel_Init(PAINEL_COMANDO_t *p);
static bool Painel_isMontagem(unsigned char idPeca);
static bool Painel_isFazTampa(unsigned char qtdeAuxContagemPeca, unsigned char idPeca);
static bool Painel_isPecaBruta(unsigned char sensTipoPeca);
static unsigned char Painel_VerificaCor(unsigned char idPeca, unsigned char cont);
static void Painel_Emergencia(PAINEL_COMANDO_t *p);
static void Painel_VerificaConexao(PAINEL_COMANDO_t *p);
static void Painel_Erro(PAINEL_COMANDO_t *p);
static void Painel_Painel(PAINEL_COMANDO_t *p);
static void Painel_Maquina5(PAINEL_COMANDO_t *p);
static void Painel_Maquina4(PAINEL_COMANDO_t *p);
static void Painel_Maquina3(PAINEL_COMANDO_t *p);
static void Painel_Maquina2(PAINEL_COMANDO_t *p);
static void Painel_Maquina1(PAINEL_COMANDO_t *p);
static void Painel_Modo(PAINEL_COMANDO_t *p);

// Atributos private
static PAINEL_COMANDO_t painel;

void PAINEL_COMANDO_init()
{
    MODO_FUNCIONAMENTO_T = TASK_PAINEL_COMANDO;
    Painel_Init(&painel);
}

void PAINEL_COMANDO_main()
{
    Painel_Modo(&painel);
}

// --- OK
static void Painel_Init(PAINEL_COMANDO_t *p)
{

    // --- Zera os valores vindos do banco de dados
    MySql_WriteQtdeFabricada = 0;
    MySql_QtdePeca = 0;

    // --- Variaveis de Controle do Painel de Comando
    p->auxErro = true;
    p->auxAuto = false;
    p->auxManual = false;
    p->auxStart = false;
    p->auxQtdeFabricada = 0x00;
    p->auxContagemPeca = 0x00;

    // --- Maquina 1
    p->passoMaquina1 = 0x00;
    p->auxMaq1_bordaDescida = false;

    // --- Maquina 2
    p->passoMaquina2 = 0x00;

    // --- Maquina 3
    p->passoMaquina3 = 0x00;
    p->auxMaq3_bordaDescida = false;

    // --- Maquina 4
    p->passoMaquina4 = 0;
    p->auxMaq4_isTampa = false;

    // --- Maquina 5
    p->passoMaquina5 = 0;
    p->auxMaq5_isMontagem = false;
    p->auxMaq5_isTampa = false;
    p->auxMaq5_Est1_bordaDescida = false;
    p->auxMaq5_Est2_bordaDescida = false;

} // End static void Painel_Init(PAINEL_COMANDO_t *p)

// --- OK
static bool Painel_isMontagem(unsigned char idPeca)
{
    return (idPeca < 9);
}

// --- OK
static bool Painel_isFazTampa(unsigned char qtdeAuxContagemPeca, unsigned char idPeca)
{
    if (idPeca < 9)
        return (qtdeAuxContagemPeca % 2 == 0);

    return (idPeca < 12);
}

// --- OK
static bool Painel_isPecaBruta(unsigned char sensTipoPeca)
{

    if (sensTipoPeca == 1 || sensTipoPeca == 4 || sensTipoPeca == 7)
        return true;

    return false;

} // End void Painel_ValidaPeca(unsigned char sensTipoPeca)

// --- OK
static unsigned char Painel_VerificaCor(unsigned char idPeca, unsigned char cont)
{
    // Verifca se o pedido tem montagem
    if (Painel_isMontagem(idPeca))
    {
        switch (idPeca)
        {
        // Pecas com a mesma cor de base e tampa
        case 0:
            return 0; // Peca Azul
        case 3:
            return 1; // Peca Cinza
        case 6:
            return 2; // Peca Verde

        // Pecas com a cor de base e tampa diferente
        default:
            if (idPeca < 3)
                if (Painel_isFazTampa(cont, idPeca))
                    return 0; // Peca Azul
                else if (idPeca == 1)
                    return 2; // Peca Verde
                else
                    return 1; // Peca Cinza
            else if (idPeca < 6)
                if (Painel_isFazTampa(cont, idPeca))
                    return 1; // Peca Cinza
                else if (idPeca == 4)
                    return 0; // Peca Azul
                else
                    return 2; // Peca Verde
            else if (Painel_isFazTampa(cont, idPeca))
                return 2; // Peca Verde
            else if (idPeca == 7)
                return 0; // Peca Azul
            else
                return 1; // Peca Cinza
        } // End switch(idPeca)
    } // End if(Painel_isMontagem(idPeca))
    else
    {
        if (idPeca == 9 || idPeca == 12)
            return 0; // Peca Azul
        else if (idPeca == 10 || idPeca == 13)
            return 2; // Peca Verde
        else if (idPeca == 11 || idPeca == 14)
            return 1; // Peca Cinza
    }

    return 0xFF; // Erro

} // End static unsigned char Painel_VerificaCor(unsigned char idPeca, unsigned char cont)

// --- OK
static void Painel_Emergencia(PAINEL_COMANDO_t *p)
{

    // --- Variaveis de Controle do Painel
    p->auxErro = true;
    p->auxAuto = false;
    p->auxManual = false;
    p->auxStart = false;
    p->auxQtdeFabricada = 0x00;
    p->auxContagemPeca = 0x00;

    Painel_Evento_QtdeFeita_Off;

    // --- Maquina 1
    p->passoMaquina1 = 0x00;
    p->auxMaq1_bordaDescida = false;

    Maq1_Output_dropVerde_Off;
    Maq1_Output_dropAzul_Off;
    Maq1_Output_dropMetal_Off;
    Maq1_Output_esteira_Off;
    Maq1_Output_esteiraPcAzul_Off;
    Maq1_Output_esteiraPcCinza_Off;

    // --- Maquina 2
    p->passoMaquina2 = 0x00;

    Maq2_Output_btnStart_Off;
    Maq2_Output_btnReset_Off;
    Maq2_Output_btnStop_On;

    // --- Maquina 3
    p->passoMaquina3 = 0x00;
    p->auxMaq3_bordaDescida = false;

    Maq3_Output_esteira_Off;

    // --- Maquina 4
    p->passoMaquina4 = 0;
    p->auxMaq4_isTampa = false;

    Maq4_Output_esteira_Off;

    // --- Maquina 5
    p->passoMaquina5 = 0;
    p->auxMaq5_isMontagem = false;
    p->auxMaq5_isTampa = false;
    p->auxMaq5_Est1_bordaDescida = false;
    p->auxMaq5_Est2_bordaDescida = false;

    Maq5_Output_est1_Off;
    Maq5_Output_est2_Off;
    // auxMaq5_Tempo = 0;

    // ---- Painel
    // Liga sinaliza��o Amarela
    set_bit(PORTD, ledSinalAmarelo);

    // Liga Led Amarela do Painel Virtual
    Painel_Output_ledAmarelo_On;

    // Desliga sinaliza��o Verde
    clr_bit(PORTD, ledSinalVerde);

    // Desliga Led verde Painel
    Painel_Output_ledVerde_Off;

    if (btnEmergencia)
    {
        // Desliga sinaliza��o Vermelha
        clr_bit(PORTD, ledSinalVermelho);

        // Desliga Led Verm. do Painel Virtual
        Painel_Output_ledVermelho_Off;
    }

    // Deliga led btnStop
    clr_bit(PORTD, ledBtnStop);
    Painel_Output_btnLedStop_Off;

    // Deliga led btnStart
    clr_bit(PORTD, ledBtnStart);
    Painel_Output_btnLedStart_Off;

    // Deliga led btnReset
    clr_bit(PORTD, ledBtnReset);
    Painel_Output_btnLedReset_Off;
} // End static void Painel_Emergencia(PAINEL_Controle *p)

// --- OK
static void Painel_VerificaConexao(PAINEL_COMANDO_t *p)
{

    // Conexao com o banco de dados
    if (!MySql_Banco_On)
    {

        Painel_Emergencia(p);

        if (SOFT_TIMER_delay_s(&p->timerConexao, 1))
        {
            Painel_Output_ledVermelho_Blk;
            tgl_bit(PORTD, ledSinalVermelho);
        }
    }
    else if (p->auxErro)
        p->auxQtdeFabricada = MySql_ReadQtdeFabricada;
} // End void verificaConexao()

// --- OK
static void Painel_Erro(PAINEL_COMANDO_t *p)
{
    set_bit(PORTD, ledBtnReset);
    Painel_Output_btnLedReset_On;

    Maq2_Output_btnStop_Off;

    if (SOFT_TIMER_delay_s(&p->timerErro, 1))
    {
        tgl_bit(PORTD, ledSinalAmarelo);
        Painel_Output_ledAmarelo_Blk;
    }

    // Verifica estado do reset para tirar m�quina do estado de erro
    if (!btnReset)
    {
        // Reseta M�quina 2
        Maq2_Output_btnReset_On;

        // Reseta M�quina 4
        Maq4_Output_cln1_Off;
        Maq4_Output_cln2_Off;

        // Resta M�quina 5
        Maq5_Output_cln1Fechar_Off;
        Maq5_Output_cln1Subir_Off;
        Maq5_Output_cln2Fechar_Off;
        Maq5_Output_cln2Subir_Off;
        Maq5_Output_mnpVacuo_Off;
        Maq5_Output_mnpZ_Off;
        Maq5_Output_mnpX_Off;

        if (SOFT_TIMER_delay_s(&p->timerReset, 1))
            p->auxErro = 0;
    } // End if(!btnReset)
    else
        SOFT_TIMER_reset(&p->timerReset);
} // End Painel_Erro(PAINEL_Controle* p)

// --- OK
static void Painel_Painel(PAINEL_COMANDO_t *p)
{
    clr_bit(PORTD, ledSinalAmarelo);
    Painel_Output_ledAmarelo_Off;

    clr_bit(PORTD, ledBtnReset);
    Painel_Output_btnLedReset_Off;

    // Verifica funcionamento autom�tico / manual
    if (!btnStop)
    {
        p->auxAuto = 0;
        clr_bit(PORTD, ledBtnStop);
        Painel_Output_btnLedStop_Off;
    }
    else if (!btnStart)
    {
        if (!btnAutomatico)
        {
            p->auxAuto = 1;
            p->auxManual = 0;
            set_bit(PORTD, ledBtnStop);
            Painel_Output_btnLedStop_On;
        }
        else
        {
            p->auxManual = 1;
            p->auxAuto = 0;
            clr_bit(PORTD, ledBtnStop);
            Painel_Output_btnLedStop_Off;
        }
    } // End Verifica funcionamento autom�tico / manual

    // Verifica Processo parado
    if (!(p->auxStart))
    {
        if (MySql_Banco_On)
        {
            Painel_Output_ledVermelho_On;
            set_bit(PORTD, ledSinalVermelho);
        }

        clr_bit(PORTD, ledSinalVerde);
        Painel_Output_ledVerde_Off;

        set_bit(PORTD, ledBtnStart);
        Painel_Output_btnLedStart_On;
    }
    else
    {
        if (MySql_Banco_On)
        {
            clr_bit(PORTD, ledSinalVermelho);
            Painel_Output_ledVermelho_Off;
        }

        set_bit(PORTD, ledSinalVerde);
        Painel_Output_ledVerde_On;

        clr_bit(PORTD, ledBtnStart);
        Painel_Output_btnLedStart_Off;
    }
} // End Painel_Painel(PAINEL_Controle* p)

// --- OK
static void Painel_Maquina5(PAINEL_COMANDO_t *p)
{

    switch (p->passoMaquina5)
    {

    case 0:

        Maq5_Output_cln1Fechar_Off;
        Maq5_Output_cln1Subir_Off;
        Maq5_Output_cln2Fechar_Off;
        Maq5_Output_cln2Subir_Off;
        Maq5_Output_est1_Off;
        Maq5_Output_est2_Off;
        Maq5_Output_mnpVacuo_Off;
        Maq5_Output_mnpX_Off;
        Maq5_Output_mnpZ_Off;

        break;

    case 5:

        if (p->auxMaq5_isTampa)
            p->passoMaquina5 = 10;
        else
            p->passoMaquina5 = 100;

        break;

    // TAMPA
    case 10:

        Maq5_Output_est1_On;

        if (p->auxMaq5_isMontagem)
            p->passoMaquina5 = 30;
        else
            p->passoMaquina5 = 15;

        break;

    // TAMPA SEM MONTAGEM
    case 15:

        Maq5_Output_cln1Subir_On;

        if (Maq5_Input_sensPc1)
            p->auxMaq5_Est1_bordaDescida = true;
        else if (p->auxMaq5_Est1_bordaDescida)
        {
            p->auxMaq5_Est1_bordaDescida = false;
            p->passoMaquina5 = 200;
        }

        break;

    // TAMPA COM MONTAGEM
    case 30:

        if (Maq5_Input_sensPc1)
            p->auxMaq5_Est1_bordaDescida = true;
        else if (p->auxMaq5_Est1_bordaDescida)
        {
            p->auxMaq5_Est1_bordaDescida = false;
            p->passoMaquina5 = 35;
        }

        break;

    // --- ROTINA CILINDRO 1 (TAMPA)
    case 35:

        Maq5_Output_est1_Off;
        Maq5_Output_cln1Fechar_On;

        if (Maq5_Input_cln1Fechado)
            p->passoMaquina5 = 130;

        break;

    // BASE
    case 100:

        Maq5_Output_est2_On;

        if (p->auxMaq5_isMontagem)
            p->passoMaquina5 = 120;
        else
            p->passoMaquina5 = 105;

        break;

    // BASE SEM MONTAGEM
    case 105:

        Maq5_Output_cln2Subir_On;

        if (Maq5_Input_sensPc2)
            p->auxMaq5_Est2_bordaDescida = true;
        else if (p->auxMaq5_Est2_bordaDescida)
        {
            p->auxMaq5_Est2_bordaDescida = false;
            p->passoMaquina5 = 200;
        }

        break;

    // --- ROTINA CILINDRO 2 (BASE)
    case 120:

        //
        if (Maq5_Input_sensPc2)
            p->auxMaq5_Est2_bordaDescida = true;
        else if (p->auxMaq5_Est2_bordaDescida)
        {
            p->auxMaq5_Est2_bordaDescida = false;
            p->passoMaquina5 = 121;
        }

        break;

    case 121:

        Maq5_Output_est2_Off;
        Maq5_Output_cln2Fechar_On;

        if (Maq5_Input_cln2Fechado)
            p->passoMaquina5 = 130;

        break;

    // ROTINA MANIPULADOR
    case 130:

        //
        if (Maq5_Input_cln1Fechado && Maq5_Input_cln2Fechado)
            p->passoMaquina5 = 135;

        break;

    case 135:

        Maq5_Output_mnpZ_On;

        if (Maq5_Input_MnpSensMovZ)
            p->auxMaq5_Est1_bordaDescida = true;
        else if (p->auxMaq5_Est1_bordaDescida)
        {

            p->auxMaq5_Est1_bordaDescida = false;
            p->passoMaquina5 = 140;
        }

        break;

    case 140:

        Maq5_Output_mnpVacuo_On;

        if (Maq5_Input_MnpSensPcDetec)
            p->passoMaquina5 = 145;

        break;

    case 145:

        Maq5_Output_cln1Fechar_Off;

        if (!Maq5_Input_cln1Fechado)
            p->passoMaquina5 = 150;

        break;

    case 150:

        Maq5_Output_mnpZ_Off;

        if (Maq5_Input_MnpSensMovZ)
            p->auxMaq5_Est1_bordaDescida = true;
        else if (p->auxMaq5_Est1_bordaDescida)
        {

            p->auxMaq5_Est1_bordaDescida = false;
            p->passoMaquina5 = 155;
        }

        break;

    case 155:

        Maq5_Output_mnpX_On;

        if (Maq5_Input_MnpSensMovX)
            p->auxMaq5_Est2_bordaDescida = true;
        else if (p->auxMaq5_Est2_bordaDescida)
        {

            p->auxMaq5_Est2_bordaDescida = false;
            p->passoMaquina5 = 160;
        }

        break;

    case 160:

        Maq5_Output_mnpZ_On;
        Maq5_Output_cln2Fechar_Off;

        if (Maq5_Input_MnpSensMovZ)
            p->auxMaq5_Est2_bordaDescida = true;
        else if (p->auxMaq5_Est2_bordaDescida)
        {

            p->auxMaq5_Est2_bordaDescida = 0;
            p->passoMaquina5 = 165;
        }

        break;

    case 165:

        Maq5_Output_mnpVacuo_Off;

        p->passoMaquina5 = 170;

        break;

    case 170:

        Maq5_Output_mnpZ_Off;

        if (Maq5_Input_MnpSensMovZ)
            p->auxMaq5_Est2_bordaDescida = true;
        else if (p->auxMaq5_Est2_bordaDescida)
        {

            p->auxMaq5_Est2_bordaDescida = false;
            p->passoMaquina5 = 175;
        }

        break;

    case 175:

        //
        Maq5_Output_cln2Subir_On;
        Maq5_Output_est2_On;
        Maq5_Output_mnpX_Off;
        p->passoMaquina5 = 200;

        break;

    // PASSO FINAL 1 -> VERIFICAR SENSOR FINAL
    case 200:

        if (!Maq5_Input_sensFinal)
            p->passoMaquina5 = 205;

        break;

    // PASSO FINAL 2 -> GRAVACAO NO BANCO DE DADOS
    case 205:

        MySql_WriteQtdeFabricada = p->auxQtdeFabricada;

        if (p->auxQtdeFabricada >= MySql_QtdePeca)
        {
            Painel_Evento_QtdeFeita_On;
            p->passoMaquina5 = 210;
        }
        else
            p->passoMaquina5 = 0;

        break;

    // PASSO FINAL
    case 210:

        if (MySql_QtdePeca == 0)
        {
            Painel_Evento_QtdeFeita_Off;
            p->auxQtdeFabricada = 0;
            p->auxStart = false;
            MySql_WriteQtdeFabricada = 0;

            if (p->auxManual)
                p->auxManual = 0;

            p->passoMaquina5 = 0;
        }

        break;

    default:
        break;

    } // End switch(p->passoMaquina5)
} // End void Painel_Maquina5(PAINEL_Controle* p)

// --- OK
static void Painel_Maquina4(PAINEL_COMANDO_t *p)
{

    switch (p->passoMaquina4)
    {

    case 0:

        Maq4_Output_cln1_Off;
        Maq4_Output_cln2_Off;
        Maq4_Output_esteira_Off;

        break;

    case 5:

        Maq4_Output_esteira_On;

        p->passoMaquina4 = 10;

        break;

    case 10:

        if (p->auxMaq4_isTampa)
        {
            if (Maq4_Input_sens1)
                p->passoMaquina4 = 15;
        }
        else if (Maq4_Input_sens2)
            p->passoMaquina4 = 25;

        break;

    // Separa TAMPA
    case 15:

        Maq4_Output_esteira_Off;
        Maq4_Output_cln1_On;

        if (Maq4_Input_cln1Avancado)
            p->passoMaquina4 = 20;

        break;

    case 20:

        Maq4_Output_cln1_Off;
        p->passoMaquina4 = 35;

        break;

    // Separa BASE
    case 25:

        Maq4_Output_esteira_Off;
        Maq4_Output_cln2_On;

        if (Maq4_Input_cln2Avancado)
            p->passoMaquina4 = 30;

        break;

    case 30:

        Maq4_Output_cln2_Off;
        p->passoMaquina4 = 35;

        break;

    case 35:

        p->passoMaquina4 = 0;
        p->passoMaquina5 = 5;

        break;

    default:
        break;

    } // End switch(p->passoMaquina4)

} // End void Painel_Maquina4(PAINEL_Controle* p)

// --- POSSIVEL MUDANCA
static void Painel_Maquina3(PAINEL_COMANDO_t *p)
{

    switch (p->passoMaquina3)
    {

    case 0:

        Maq3_Output_esteira_Off;
        p->auxMaq3_bordaDescida = false;

        // Verifica se tem peca na esteira
        if (Maq3_Input_sensTipoPeca > 0 && p->passoMaquina2 == 25)
            p->passoMaquina3 = 3;

        break;

    case 3:

        // Verifica se a peca esta acabada
        if (!Painel_isPecaBruta(Maq3_Input_sensTipoPeca))
        {

            if (Painel_isMontagem(MySql_TipoPedido))
            {
                if (++(p->auxContagemPeca) >= 2)
                {
                    p->auxQtdeFabricada += 1;
                    p->auxContagemPeca = 0;
                }

                p->auxMaq5_isMontagem = true;
            }
            else
            {
                p->auxQtdeFabricada += 1;
                p->auxMaq5_isMontagem = false;
            }

            // Verifica se a peca e uma tampa
            if (Maq3_Input_sensTipoPeca == 2 ||
                Maq3_Input_sensTipoPeca == 5 ||
                Maq3_Input_sensTipoPeca == 8)
            {
                p->auxMaq4_isTampa = true;
                p->auxMaq5_isTampa = true;
            }
            else
            {
                p->auxMaq4_isTampa = false;
                p->auxMaq5_isTampa = false;
            }

            p->passoMaquina1 = 0;
            p->passoMaquina2 = 0;
            p->passoMaquina3 = 5;
        } // End if(!Painel_isPecaBruta(Maq3_Input_sensTipoPeca)

        // Verifica se a peca NAO ESTA ACABADA
        else
            p->passoMaquina3 = 15;

        break;

    case 5:

        Maq3_Output_esteira_On;

        if (Maq3_Input_sensInicio)
        {
            p->auxMaq3_bordaDescida = true;
            p->passoMaquina4 = 5;
        }
        else if (p->auxMaq3_bordaDescida)
        {
            p->auxMaq3_bordaDescida = false;
            p->passoMaquina3 = 10;
        }

        break;

    case 10:

        Maq3_Output_esteira_Off;

        p->passoMaquina3 = 0;

        break;

    // PECA BRUTA
    case 15:

        break;

    default:
        break;

    } // End switch(p->passoMaquina3)

} // End void Painel_Maquina3(PAINEL_Controle* p)

// ---- OK
static void Painel_Maquina2(PAINEL_COMANDO_t *p)
{

    switch (p->passoMaquina2)
    {

    case 0:

        // Home da maquina
        Maq2_Output_btnReset_Off;
        Maq2_Output_btnStart_Off;
        Maq2_Output_btnStop_Off;

        if (p->passoMaquina1 == 25)
            p->passoMaquina2 = 5;

        break;

    case 5:

        if (Painel_isFazTampa(p->auxContagemPeca, MySql_TipoPedido))
            Maq2_Output_fazerTampa_On;
        else
            Maq2_Output_fazerTampa_Off;

        p->passoMaquina2 = 10;

        break;

    case 10:

        Maq2_Output_btnStart_On;

        if (Maq2_Input_sensUsinagemOperando)
            p->passoMaquina2 = 15;

        break;

    case 15:

        if (!Maq2_Input_sensCncPortaAberta)
            p->passoMaquina2 = 20;

        break;

    case 20:

        if (Maq2_Input_sensCncPortaAberta)
            p->passoMaquina2 = 25;

        break;

    default:
        break;

    } // End switch(p->passoMaquina2)
} // End Painel_Maquina2(PAINEL_Controle* p)

// --- OK
static void Painel_Maquina1(PAINEL_COMANDO_t *p)
{

    unsigned char auxVerificaCor;

    switch (p->passoMaquina1)
    {

    case 0:
        // Home da M�quina 1
        Maq1_Output_dropVerde_Off;
        Maq1_Output_dropAzul_Off;
        Maq1_Output_dropMetal_Off;
        Maq1_Output_esteira_Off;
        Maq1_Output_esteiraPcAzul_Off;
        Maq1_Output_esteiraPcCinza_Off;

        // Verifica start da m�quina
        if (p->auxAuto || p->auxManual || p->auxStart)
        {
            p->auxStart = true; // Flag de M�quina operando

            p->passoMaquina1 = 5;
        }
        break; // End case 0

    case 5:

        // Verifica ordem de pedido
        if (p->auxQtdeFabricada < MySql_QtdePeca)
            p->passoMaquina1 = 10;
        else
            p->passoMaquina1 = 0;

        break; // End case 5

    case 10:

        // Verifica Cor da peca

        auxVerificaCor = Painel_VerificaCor(MySql_TipoPedido, p->auxContagemPeca);

        // Verifica se nao houve erro de leitura
        if (auxVerificaCor != 0xFF)
        {
            // Peca Azul
            if (auxVerificaCor == 0)
            {
                Maq1_Output_dropAzul_On;

                if (Maq1_Input_sensPcAzul)
                {
                    Maq1_Output_dropAzul_Off;
                    Maq1_Output_esteiraPcAzul_On;
                    p->passoMaquina1 = 15;
                }
            }

            // Peca Cinza
            else if (auxVerificaCor == 1)
            {
                Maq1_Output_dropMetal_On;

                if (Maq1_Input_sensPcMetal)
                {
                    Maq1_Output_dropMetal_Off;
                    Maq1_Output_esteiraPcCinza_On;
                    p->passoMaquina1 = 15;
                }
            }

            // Peca Verde
            else
            {
                Maq1_Output_dropVerde_On;

                if (Maq1_Input_sensPcVerde)
                {
                    Maq1_Output_dropVerde_Off;
                    p->passoMaquina1 = 15;
                }
            }

        } // End  if(auxVerificaCor != 0xFF)

        break; // End case 10

    case 15:

        Maq1_Output_esteira_On;

        if (Maq1_Input_sensFinal)
            p->auxMaq1_bordaDescida = true;
        else if (p->auxMaq1_bordaDescida)
        {
            p->auxMaq1_bordaDescida = false;
            p->passoMaquina1 = 20;
        }

        break; // End case 15

    case 20:

        Maq1_Output_esteira_Off;
        Maq1_Output_esteiraPcAzul_Off;
        Maq1_Output_esteiraPcCinza_Off;

        p->passoMaquina1 = 25;

        break;

    default:
        break;

    } // End switch(p->passoMaquina1)

} // End Painel_Maquina1(PAINEL_Controle* p)

// --- OK
static void Painel_Modo(PAINEL_COMANDO_t *p)
{

    // Desliga bits sem utilidade neste modo
    LATD = (PORTD & 0xE7);

    PAINEL_VerificaConexao(p);

    // Verifica bot�o de emerg�ncia
    if (btnEmergencia)
        Painel_Emergencia(p);
    else if (p->auxErro)
        Painel_Erro(p);
    else
    {
        Painel_Painel(p);
        Painel_Maquina1(p);
        Painel_Maquina2(p);
        Painel_Maquina3(p);
        Painel_Maquina4(p);
        Painel_Maquina5(p);
    }
} // End Painel_Modo(PAINEL_Controle *p)
