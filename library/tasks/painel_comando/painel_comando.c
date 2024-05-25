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


void PAINEL_COMANDO_init()
{

}

void PAINEL_COMANDO_main()
{
    MODO_FUNCIONAMENTO_T = TASK_PAINEL_COMANDO;
}