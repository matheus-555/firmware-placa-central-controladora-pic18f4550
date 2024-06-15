
_PAINEL_COMANDO_init:

;painel_comando.c,194 :: 		void PAINEL_COMANDO_init()
;painel_comando.c,196 :: 		MODO_FUNCIONAMENTO_T = TASK_PAINEL_COMANDO;
	MOVLW       2
	MOVWF       _writeBuffer+6 
;painel_comando.c,197 :: 		Painel_Init(&painel);
	MOVLW       painel_comando_painel+0
	MOVWF       FARG_painel_comando_Painel_Init_p+0 
	MOVLW       hi_addr(painel_comando_painel+0)
	MOVWF       FARG_painel_comando_Painel_Init_p+1 
	CALL        painel_comando_Painel_Init+0, 0
;painel_comando.c,198 :: 		}
L_end_PAINEL_COMANDO_init:
	RETURN      0
; end of _PAINEL_COMANDO_init

_PAINEL_COMANDO_main:

;painel_comando.c,200 :: 		void PAINEL_COMANDO_main()
;painel_comando.c,202 :: 		Painel_Modo(&painel);
	MOVLW       painel_comando_painel+0
	MOVWF       FARG_painel_comando_Painel_Modo_p+0 
	MOVLW       hi_addr(painel_comando_painel+0)
	MOVWF       FARG_painel_comando_Painel_Modo_p+1 
	CALL        painel_comando_Painel_Modo+0, 0
;painel_comando.c,203 :: 		}
L_end_PAINEL_COMANDO_main:
	RETURN      0
; end of _PAINEL_COMANDO_main

painel_comando_Painel_Init:

;painel_comando.c,206 :: 		static void Painel_Init(PAINEL_COMANDO_t *p)
;painel_comando.c,210 :: 		MySql_WriteQtdeFabricada = 0;
	CLRF        _writeBuffer+8 
;painel_comando.c,211 :: 		MySql_QtdePeca = 0;
	CLRF        _readBuffer+7 
;painel_comando.c,214 :: 		p->auxErro = true;
	MOVFF       FARG_painel_comando_Painel_Init_p+0, FSR1L+0
	MOVFF       FARG_painel_comando_Painel_Init_p+1, FSR1H+0
	MOVLW       1
	MOVWF       POSTINC1+0 
;painel_comando.c,215 :: 		p->auxAuto = false;
	MOVLW       1
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,216 :: 		p->auxManual = false;
	MOVLW       2
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,217 :: 		p->auxStart = false;
	MOVLW       3
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,218 :: 		p->auxQtdeFabricada = 0x00;
	MOVLW       4
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,219 :: 		p->auxContagemPeca = 0x00;
	MOVLW       5
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,222 :: 		p->passoMaquina1 = 0x00;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,223 :: 		p->auxMaq1_bordaDescida = false;
	MOVLW       19
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,226 :: 		p->passoMaquina2 = 0x00;
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,229 :: 		p->passoMaquina3 = 0x00;
	MOVLW       21
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,230 :: 		p->auxMaq3_bordaDescida = false;
	MOVLW       22
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,233 :: 		p->passoMaquina4 = 0;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,234 :: 		p->auxMaq4_isTampa = false;
	MOVLW       24
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,237 :: 		p->passoMaquina5 = 0;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,238 :: 		p->auxMaq5_isMontagem = false;
	MOVLW       28
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,239 :: 		p->auxMaq5_isTampa = false;
	MOVLW       29
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,240 :: 		p->auxMaq5_Est1_bordaDescida = false;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,241 :: 		p->auxMaq5_Est2_bordaDescida = false;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Init_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Init_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,243 :: 		} // End static void Painel_Init(PAINEL_COMANDO_t *p)
L_end_Painel_Init:
	RETURN      0
; end of painel_comando_Painel_Init

painel_comando_Painel_isMontagem:

;painel_comando.c,246 :: 		static bool Painel_isMontagem(unsigned char idPeca)
;painel_comando.c,248 :: 		return (idPeca < 9);
	MOVLW       9
	SUBWF       FARG_painel_comando_Painel_isMontagem_idPeca+0, 0 
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
;painel_comando.c,249 :: 		}
L_end_Painel_isMontagem:
	RETURN      0
; end of painel_comando_Painel_isMontagem

painel_comando_Painel_isFazTampa:

;painel_comando.c,252 :: 		static bool Painel_isFazTampa(unsigned char qtdeAuxContagemPeca, unsigned char idPeca)
;painel_comando.c,254 :: 		if (idPeca < 9)
	MOVLW       9
	SUBWF       FARG_painel_comando_Painel_isFazTampa_idPeca+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_painel_comando_Painel_isFazTampa0
;painel_comando.c,255 :: 		return (qtdeAuxContagemPeca % 2 == 0);
	MOVLW       1
	ANDWF       FARG_painel_comando_Painel_isFazTampa_qtdeAuxContagemPeca+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	GOTO        L_end_Painel_isFazTampa
L_painel_comando_Painel_isFazTampa0:
;painel_comando.c,257 :: 		return (idPeca < 12);
	MOVLW       12
	SUBWF       FARG_painel_comando_Painel_isFazTampa_idPeca+0, 0 
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
;painel_comando.c,258 :: 		}
L_end_Painel_isFazTampa:
	RETURN      0
; end of painel_comando_Painel_isFazTampa

painel_comando_Painel_isPecaBruta:

;painel_comando.c,261 :: 		static bool Painel_isPecaBruta(unsigned char sensTipoPeca)
;painel_comando.c,264 :: 		if (sensTipoPeca == 1 || sensTipoPeca == 4 || sensTipoPeca == 7)
	MOVF        FARG_painel_comando_Painel_isPecaBruta_sensTipoPeca+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_isPecaBruta210
	MOVF        FARG_painel_comando_Painel_isPecaBruta_sensTipoPeca+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_isPecaBruta210
	MOVF        FARG_painel_comando_Painel_isPecaBruta_sensTipoPeca+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_isPecaBruta210
	GOTO        L_painel_comando_Painel_isPecaBruta3
L_painel_comando_Painel_isPecaBruta210:
;painel_comando.c,265 :: 		return true;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_Painel_isPecaBruta
L_painel_comando_Painel_isPecaBruta3:
;painel_comando.c,267 :: 		return false;
	CLRF        R0 
;painel_comando.c,269 :: 		} // End void Painel_ValidaPeca(unsigned char sensTipoPeca)
L_end_Painel_isPecaBruta:
	RETURN      0
; end of painel_comando_Painel_isPecaBruta

painel_comando_Painel_VerificaCor:

;painel_comando.c,272 :: 		static unsigned char Painel_VerificaCor(unsigned char idPeca, unsigned char cont)
;painel_comando.c,275 :: 		if (Painel_isMontagem(idPeca))
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	MOVWF       FARG_painel_comando_Painel_isMontagem_idPeca+0 
	CALL        painel_comando_Painel_isMontagem+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor4
;painel_comando.c,277 :: 		switch (idPeca)
	GOTO        L_painel_comando_Painel_VerificaCor5
;painel_comando.c,280 :: 		case 0:
L_painel_comando_Painel_VerificaCor7:
;painel_comando.c,281 :: 		return 0; // Peca Azul
	CLRF        R0 
	GOTO        L_end_Painel_VerificaCor
;painel_comando.c,282 :: 		case 3:
L_painel_comando_Painel_VerificaCor8:
;painel_comando.c,283 :: 		return 1; // Peca Cinza
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
;painel_comando.c,284 :: 		case 6:
L_painel_comando_Painel_VerificaCor9:
;painel_comando.c,285 :: 		return 2; // Peca Verde
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
;painel_comando.c,288 :: 		default:
L_painel_comando_Painel_VerificaCor10:
;painel_comando.c,289 :: 		if (idPeca < 3)
	MOVLW       3
	SUBWF       FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_painel_comando_Painel_VerificaCor11
;painel_comando.c,290 :: 		if (Painel_isFazTampa(cont, idPeca))
	MOVF        FARG_painel_comando_Painel_VerificaCor_cont+0, 0 
	MOVWF       FARG_painel_comando_Painel_isFazTampa_qtdeAuxContagemPeca+0 
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	MOVWF       FARG_painel_comando_Painel_isFazTampa_idPeca+0 
	CALL        painel_comando_Painel_isFazTampa+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor12
;painel_comando.c,291 :: 		return 0; // Peca Azul
	CLRF        R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor12:
;painel_comando.c,292 :: 		else if (idPeca == 1)
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor14
;painel_comando.c,293 :: 		return 2; // Peca Verde
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor14:
;painel_comando.c,295 :: 		return 1; // Peca Cinza
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor11:
;painel_comando.c,296 :: 		else if (idPeca < 6)
	MOVLW       6
	SUBWF       FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_painel_comando_Painel_VerificaCor17
;painel_comando.c,297 :: 		if (Painel_isFazTampa(cont, idPeca))
	MOVF        FARG_painel_comando_Painel_VerificaCor_cont+0, 0 
	MOVWF       FARG_painel_comando_Painel_isFazTampa_qtdeAuxContagemPeca+0 
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	MOVWF       FARG_painel_comando_Painel_isFazTampa_idPeca+0 
	CALL        painel_comando_Painel_isFazTampa+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor18
;painel_comando.c,298 :: 		return 1; // Peca Cinza
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor18:
;painel_comando.c,299 :: 		else if (idPeca == 4)
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor20
;painel_comando.c,300 :: 		return 0; // Peca Azul
	CLRF        R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor20:
;painel_comando.c,302 :: 		return 2; // Peca Verde
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor17:
;painel_comando.c,303 :: 		else if (Painel_isFazTampa(cont, idPeca))
	MOVF        FARG_painel_comando_Painel_VerificaCor_cont+0, 0 
	MOVWF       FARG_painel_comando_Painel_isFazTampa_qtdeAuxContagemPeca+0 
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	MOVWF       FARG_painel_comando_Painel_isFazTampa_idPeca+0 
	CALL        painel_comando_Painel_isFazTampa+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor23
;painel_comando.c,304 :: 		return 2; // Peca Verde
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor23:
;painel_comando.c,305 :: 		else if (idPeca == 7)
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor25
;painel_comando.c,306 :: 		return 0; // Peca Azul
	CLRF        R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor25:
;painel_comando.c,308 :: 		return 1; // Peca Cinza
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
;painel_comando.c,309 :: 		} // End switch(idPeca)
L_painel_comando_Painel_VerificaCor5:
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor7
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor8
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor9
	GOTO        L_painel_comando_Painel_VerificaCor10
;painel_comando.c,310 :: 		} // End if(Painel_isMontagem(idPeca))
L_painel_comando_Painel_VerificaCor4:
;painel_comando.c,313 :: 		if (idPeca == 9 || idPeca == 12)
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor213
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor213
	GOTO        L_painel_comando_Painel_VerificaCor30
L_painel_comando_Painel_VerificaCor213:
;painel_comando.c,314 :: 		return 0; // Peca Azul
	CLRF        R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor30:
;painel_comando.c,315 :: 		else if (idPeca == 10 || idPeca == 13)
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor212
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor212
	GOTO        L_painel_comando_Painel_VerificaCor34
L_painel_comando_Painel_VerificaCor212:
;painel_comando.c,316 :: 		return 2; // Peca Verde
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor34:
;painel_comando.c,317 :: 		else if (idPeca == 11 || idPeca == 14)
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor211
	MOVF        FARG_painel_comando_Painel_VerificaCor_idPeca+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaCor211
	GOTO        L_painel_comando_Painel_VerificaCor38
L_painel_comando_Painel_VerificaCor211:
;painel_comando.c,318 :: 		return 1; // Peca Cinza
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_Painel_VerificaCor
L_painel_comando_Painel_VerificaCor38:
;painel_comando.c,321 :: 		return 0xFF; // Erro
	MOVLW       255
	MOVWF       R0 
;painel_comando.c,323 :: 		} // End static unsigned char Painel_VerificaCor(unsigned char idPeca, unsigned char cont)
L_end_Painel_VerificaCor:
	RETURN      0
; end of painel_comando_Painel_VerificaCor

painel_comando_Painel_Emergencia:

;painel_comando.c,326 :: 		static void Painel_Emergencia(PAINEL_COMANDO_t *p)
;painel_comando.c,330 :: 		p->auxErro = true;
	MOVFF       FARG_painel_comando_Painel_Emergencia_p+0, FSR1L+0
	MOVFF       FARG_painel_comando_Painel_Emergencia_p+1, FSR1H+0
	MOVLW       1
	MOVWF       POSTINC1+0 
;painel_comando.c,331 :: 		p->auxAuto = false;
	MOVLW       1
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,332 :: 		p->auxManual = false;
	MOVLW       2
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,333 :: 		p->auxStart = false;
	MOVLW       3
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,334 :: 		p->auxQtdeFabricada = 0x00;
	MOVLW       4
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,335 :: 		p->auxContagemPeca = 0x00;
	MOVLW       5
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,337 :: 		Painel_Evento_QtdeFeita_Off;
	BCF         _writeBuffer+4, 0 
;painel_comando.c,340 :: 		p->passoMaquina1 = 0x00;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,341 :: 		p->auxMaq1_bordaDescida = false;
	MOVLW       19
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,343 :: 		Maq1_Output_dropVerde_Off;
	BCF         _writeBuffer+0, 2 
;painel_comando.c,344 :: 		Maq1_Output_dropAzul_Off;
	BCF         _writeBuffer+0, 0 
;painel_comando.c,345 :: 		Maq1_Output_dropMetal_Off;
	BCF         _writeBuffer+0, 1 
;painel_comando.c,346 :: 		Maq1_Output_esteira_Off;
	BCF         _writeBuffer+0, 3 
;painel_comando.c,347 :: 		Maq1_Output_esteiraPcAzul_Off;
	BCF         _writeBuffer+17, 0 
;painel_comando.c,348 :: 		Maq1_Output_esteiraPcCinza_Off;
	BCF         _writeBuffer+17, 1 
;painel_comando.c,351 :: 		p->passoMaquina2 = 0x00;
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,353 :: 		Maq2_Output_btnStart_Off;
	BCF         _writeBuffer+0, 5 
;painel_comando.c,354 :: 		Maq2_Output_btnReset_Off;
	BCF         _writeBuffer+0, 4 
;painel_comando.c,355 :: 		Maq2_Output_btnStop_On;
	BSF         _writeBuffer+0, 6 
;painel_comando.c,358 :: 		p->passoMaquina3 = 0x00;
	MOVLW       21
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,359 :: 		p->auxMaq3_bordaDescida = false;
	MOVLW       22
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,361 :: 		Maq3_Output_esteira_Off;
	BCF         _writeBuffer+1, 0 
;painel_comando.c,364 :: 		p->passoMaquina4 = 0;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,365 :: 		p->auxMaq4_isTampa = false;
	MOVLW       24
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,367 :: 		Maq4_Output_esteira_Off;
	BCF         _writeBuffer+1, 3 
;painel_comando.c,370 :: 		p->passoMaquina5 = 0;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,371 :: 		p->auxMaq5_isMontagem = false;
	MOVLW       28
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,372 :: 		p->auxMaq5_isTampa = false;
	MOVLW       29
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,373 :: 		p->auxMaq5_Est1_bordaDescida = false;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,374 :: 		p->auxMaq5_Est2_bordaDescida = false;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Emergencia_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Emergencia_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,376 :: 		Maq5_Output_est1_Off;
	BCF         _writeBuffer+1, 4 
;painel_comando.c,377 :: 		Maq5_Output_est2_Off;
	BCF         _writeBuffer+1, 7 
;painel_comando.c,382 :: 		set_bit(PORTD, ledSinalAmarelo);
	BSF         PORTD+0, 1 
;painel_comando.c,385 :: 		Painel_Output_ledAmarelo_On;
	BSF         _writeBuffer+3, 0 
;painel_comando.c,388 :: 		clr_bit(PORTD, ledSinalVerde);
	BCF         PORTD+0, 0 
;painel_comando.c,391 :: 		Painel_Output_ledVerde_Off;
	BCF         _writeBuffer+3, 1 
;painel_comando.c,393 :: 		if (btnEmergencia)
	BTFSS       PORTB+0, 0 
	GOTO        L_painel_comando_Painel_Emergencia39
;painel_comando.c,396 :: 		clr_bit(PORTD, ledSinalVermelho);
	BCF         PORTD+0, 2 
;painel_comando.c,399 :: 		Painel_Output_ledVermelho_Off;
	BCF         _writeBuffer+3, 2 
;painel_comando.c,400 :: 		}
L_painel_comando_Painel_Emergencia39:
;painel_comando.c,403 :: 		clr_bit(PORTD, ledBtnStop);
	BCF         PORTD+0, 7 
;painel_comando.c,404 :: 		Painel_Output_btnLedStop_Off;
	BCF         _writeBuffer+2, 7 
;painel_comando.c,407 :: 		clr_bit(PORTD, ledBtnStart);
	BCF         PORTD+0, 5 
;painel_comando.c,408 :: 		Painel_Output_btnLedStart_Off;
	BCF         _writeBuffer+2, 6 
;painel_comando.c,411 :: 		clr_bit(PORTD, ledBtnReset);
	BCF         PORTD+0, 6 
;painel_comando.c,412 :: 		Painel_Output_btnLedReset_Off;
	BCF         _writeBuffer+2, 5 
;painel_comando.c,413 :: 		} // End static void Painel_Emergencia(PAINEL_Controle *p)
L_end_Painel_Emergencia:
	RETURN      0
; end of painel_comando_Painel_Emergencia

painel_comando_Painel_VerificaConexao:

;painel_comando.c,416 :: 		static void Painel_VerificaConexao(PAINEL_COMANDO_t *p)
;painel_comando.c,420 :: 		if (!MySql_Banco_On)
	BTFSC       _readBuffer+9, 0 
	GOTO        L_painel_comando_Painel_VerificaConexao40
;painel_comando.c,423 :: 		Painel_Emergencia(p);
	MOVF        FARG_painel_comando_Painel_VerificaConexao_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_Emergencia_p+0 
	MOVF        FARG_painel_comando_Painel_VerificaConexao_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_Emergencia_p+1 
	CALL        painel_comando_Painel_Emergencia+0, 0
;painel_comando.c,425 :: 		if (SOFT_TIMER_delay_s(&p->timerConexao, 1))
	MOVLW       14
	ADDWF       FARG_painel_comando_Painel_VerificaConexao_p+0, 0 
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_VerificaConexao_p+1, 0 
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaConexao41
;painel_comando.c,427 :: 		Painel_Output_ledVermelho_Blk;
	BTG         _writeBuffer+3, 2 
;painel_comando.c,428 :: 		tgl_bit(PORTD, ledSinalVermelho);
	BTG         PORTD+0, 2 
;painel_comando.c,429 :: 		}
L_painel_comando_Painel_VerificaConexao41:
;painel_comando.c,430 :: 		}
	GOTO        L_painel_comando_Painel_VerificaConexao42
L_painel_comando_Painel_VerificaConexao40:
;painel_comando.c,431 :: 		else if (p->auxErro)
	MOVFF       FARG_painel_comando_Painel_VerificaConexao_p+0, FSR0L+0
	MOVFF       FARG_painel_comando_Painel_VerificaConexao_p+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_VerificaConexao43
;painel_comando.c,432 :: 		p->auxQtdeFabricada = MySql_ReadQtdeFabricada;
	MOVLW       4
	ADDWF       FARG_painel_comando_Painel_VerificaConexao_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_VerificaConexao_p+1, 0 
	MOVWF       FSR1L+1 
	MOVF        _readBuffer+10, 0 
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_VerificaConexao43:
L_painel_comando_Painel_VerificaConexao42:
;painel_comando.c,433 :: 		} // End void verificaConexao()
L_end_Painel_VerificaConexao:
	RETURN      0
; end of painel_comando_Painel_VerificaConexao

painel_comando_Painel_Erro:

;painel_comando.c,436 :: 		static void Painel_Erro(PAINEL_COMANDO_t *p)
;painel_comando.c,438 :: 		set_bit(PORTD, ledBtnReset);
	BSF         PORTD+0, 6 
;painel_comando.c,439 :: 		Painel_Output_btnLedReset_On;
	BSF         _writeBuffer+2, 5 
;painel_comando.c,441 :: 		Maq2_Output_btnStop_Off;
	BCF         _writeBuffer+0, 6 
;painel_comando.c,443 :: 		if (SOFT_TIMER_delay_s(&p->timerErro, 1))
	MOVLW       6
	ADDWF       FARG_painel_comando_Painel_Erro_p+0, 0 
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Erro_p+1, 0 
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Erro44
;painel_comando.c,445 :: 		tgl_bit(PORTD, ledSinalAmarelo);
	BTG         PORTD+0, 1 
;painel_comando.c,446 :: 		Painel_Output_ledAmarelo_Blk;
	BTG         _writeBuffer+3, 0 
;painel_comando.c,447 :: 		}
L_painel_comando_Painel_Erro44:
;painel_comando.c,450 :: 		if (!btnReset)
	BTFSC       PORTB+0, 3 
	GOTO        L_painel_comando_Painel_Erro45
;painel_comando.c,453 :: 		Maq2_Output_btnReset_On;
	BSF         _writeBuffer+0, 4 
;painel_comando.c,456 :: 		Maq4_Output_cln1_Off;
	BCF         _writeBuffer+1, 1 
;painel_comando.c,457 :: 		Maq4_Output_cln2_Off;
	BCF         _writeBuffer+1, 2 
;painel_comando.c,460 :: 		Maq5_Output_cln1Fechar_Off;
	BCF         _writeBuffer+1, 6 
;painel_comando.c,461 :: 		Maq5_Output_cln1Subir_Off;
	BCF         _writeBuffer+1, 5 
;painel_comando.c,462 :: 		Maq5_Output_cln2Fechar_Off;
	BCF         _writeBuffer+2, 1 
;painel_comando.c,463 :: 		Maq5_Output_cln2Subir_Off;
	BCF         _writeBuffer+2, 0 
;painel_comando.c,464 :: 		Maq5_Output_mnpVacuo_Off;
	BCF         _writeBuffer+2, 4 
;painel_comando.c,465 :: 		Maq5_Output_mnpZ_Off;
	BCF         _writeBuffer+2, 3 
;painel_comando.c,466 :: 		Maq5_Output_mnpX_Off;
	BCF         _writeBuffer+2, 2 
;painel_comando.c,468 :: 		if (SOFT_TIMER_delay_s(&p->timerReset, 1))
	MOVLW       10
	ADDWF       FARG_painel_comando_Painel_Erro_p+0, 0 
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Erro_p+1, 0 
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Erro46
;painel_comando.c,469 :: 		p->auxErro = 0;
	MOVFF       FARG_painel_comando_Painel_Erro_p+0, FSR1L+0
	MOVFF       FARG_painel_comando_Painel_Erro_p+1, FSR1H+0
	CLRF        POSTINC1+0 
L_painel_comando_Painel_Erro46:
;painel_comando.c,470 :: 		} // End if(!btnReset)
	GOTO        L_painel_comando_Painel_Erro47
L_painel_comando_Painel_Erro45:
;painel_comando.c,472 :: 		SOFT_TIMER_reset(&p->timerReset);
	MOVLW       10
	ADDWF       FARG_painel_comando_Painel_Erro_p+0, 0 
	MOVWF       FARG_SOFT_TIMER_reset_timer+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Erro_p+1, 0 
	MOVWF       FARG_SOFT_TIMER_reset_timer+1 
	CALL        _SOFT_TIMER_reset+0, 0
L_painel_comando_Painel_Erro47:
;painel_comando.c,473 :: 		} // End Painel_Erro(PAINEL_Controle* p)
L_end_Painel_Erro:
	RETURN      0
; end of painel_comando_Painel_Erro

painel_comando_Painel_Painel:

;painel_comando.c,476 :: 		static void Painel_Painel(PAINEL_COMANDO_t *p)
;painel_comando.c,478 :: 		clr_bit(PORTD, ledSinalAmarelo);
	BCF         PORTD+0, 1 
;painel_comando.c,479 :: 		Painel_Output_ledAmarelo_Off;
	BCF         _writeBuffer+3, 0 
;painel_comando.c,481 :: 		clr_bit(PORTD, ledBtnReset);
	BCF         PORTD+0, 6 
;painel_comando.c,482 :: 		Painel_Output_btnLedReset_Off;
	BCF         _writeBuffer+2, 5 
;painel_comando.c,485 :: 		if (!btnStop)
	BTFSC       PORTB+0, 1 
	GOTO        L_painel_comando_Painel_Painel48
;painel_comando.c,487 :: 		p->auxAuto = 0;
	MOVLW       1
	ADDWF       FARG_painel_comando_Painel_Painel_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Painel_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,488 :: 		clr_bit(PORTD, ledBtnStop);
	BCF         PORTD+0, 7 
;painel_comando.c,489 :: 		Painel_Output_btnLedStop_Off;
	BCF         _writeBuffer+2, 7 
;painel_comando.c,490 :: 		}
	GOTO        L_painel_comando_Painel_Painel49
L_painel_comando_Painel_Painel48:
;painel_comando.c,491 :: 		else if (!btnStart)
	BTFSC       PORTB+0, 2 
	GOTO        L_painel_comando_Painel_Painel50
;painel_comando.c,493 :: 		if (!btnAutomatico)
	BTFSC       PORTB+0, 4 
	GOTO        L_painel_comando_Painel_Painel51
;painel_comando.c,495 :: 		p->auxAuto = 1;
	MOVLW       1
	ADDWF       FARG_painel_comando_Painel_Painel_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Painel_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
;painel_comando.c,496 :: 		p->auxManual = 0;
	MOVLW       2
	ADDWF       FARG_painel_comando_Painel_Painel_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Painel_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,497 :: 		set_bit(PORTD, ledBtnStop);
	BSF         PORTD+0, 7 
;painel_comando.c,498 :: 		Painel_Output_btnLedStop_On;
	BSF         _writeBuffer+2, 7 
;painel_comando.c,499 :: 		}
	GOTO        L_painel_comando_Painel_Painel52
L_painel_comando_Painel_Painel51:
;painel_comando.c,502 :: 		p->auxManual = 1;
	MOVLW       2
	ADDWF       FARG_painel_comando_Painel_Painel_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Painel_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
;painel_comando.c,503 :: 		p->auxAuto = 0;
	MOVLW       1
	ADDWF       FARG_painel_comando_Painel_Painel_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Painel_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,504 :: 		clr_bit(PORTD, ledBtnStop);
	BCF         PORTD+0, 7 
;painel_comando.c,505 :: 		Painel_Output_btnLedStop_Off;
	BCF         _writeBuffer+2, 7 
;painel_comando.c,506 :: 		}
L_painel_comando_Painel_Painel52:
;painel_comando.c,507 :: 		} // End Verifica funcionamento autom�tico / manual
L_painel_comando_Painel_Painel50:
L_painel_comando_Painel_Painel49:
;painel_comando.c,510 :: 		if (!(p->auxStart))
	MOVLW       3
	ADDWF       FARG_painel_comando_Painel_Painel_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Painel_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Painel53
;painel_comando.c,512 :: 		if (MySql_Banco_On)
	BTFSS       _readBuffer+9, 0 
	GOTO        L_painel_comando_Painel_Painel54
;painel_comando.c,514 :: 		Painel_Output_ledVermelho_On;
	BSF         _writeBuffer+3, 2 
;painel_comando.c,515 :: 		set_bit(PORTD, ledSinalVermelho);
	BSF         PORTD+0, 2 
;painel_comando.c,516 :: 		}
L_painel_comando_Painel_Painel54:
;painel_comando.c,518 :: 		clr_bit(PORTD, ledSinalVerde);
	BCF         PORTD+0, 0 
;painel_comando.c,519 :: 		Painel_Output_ledVerde_Off;
	BCF         _writeBuffer+3, 1 
;painel_comando.c,521 :: 		set_bit(PORTD, ledBtnStart);
	BSF         PORTD+0, 5 
;painel_comando.c,522 :: 		Painel_Output_btnLedStart_On;
	BSF         _writeBuffer+2, 6 
;painel_comando.c,523 :: 		}
	GOTO        L_painel_comando_Painel_Painel55
L_painel_comando_Painel_Painel53:
;painel_comando.c,526 :: 		if (MySql_Banco_On)
	BTFSS       _readBuffer+9, 0 
	GOTO        L_painel_comando_Painel_Painel56
;painel_comando.c,528 :: 		clr_bit(PORTD, ledSinalVermelho);
	BCF         PORTD+0, 2 
;painel_comando.c,529 :: 		Painel_Output_ledVermelho_Off;
	BCF         _writeBuffer+3, 2 
;painel_comando.c,530 :: 		}
L_painel_comando_Painel_Painel56:
;painel_comando.c,532 :: 		set_bit(PORTD, ledSinalVerde);
	BSF         PORTD+0, 0 
;painel_comando.c,533 :: 		Painel_Output_ledVerde_On;
	BSF         _writeBuffer+3, 1 
;painel_comando.c,535 :: 		clr_bit(PORTD, ledBtnStart);
	BCF         PORTD+0, 5 
;painel_comando.c,536 :: 		Painel_Output_btnLedStart_Off;
	BCF         _writeBuffer+2, 6 
;painel_comando.c,537 :: 		}
L_painel_comando_Painel_Painel55:
;painel_comando.c,538 :: 		} // End Painel_Painel(PAINEL_Controle* p)
L_end_Painel_Painel:
	RETURN      0
; end of painel_comando_Painel_Painel

painel_comando_Painel_Maquina5:

;painel_comando.c,541 :: 		static void Painel_Maquina5(PAINEL_COMANDO_t *p)
;painel_comando.c,544 :: 		switch (p->passoMaquina5)
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       R4 
	GOTO        L_painel_comando_Painel_Maquina557
;painel_comando.c,547 :: 		case 0:
L_painel_comando_Painel_Maquina559:
;painel_comando.c,549 :: 		Maq5_Output_cln1Fechar_Off;
	BCF         _writeBuffer+1, 6 
;painel_comando.c,550 :: 		Maq5_Output_cln1Subir_Off;
	BCF         _writeBuffer+1, 5 
;painel_comando.c,551 :: 		Maq5_Output_cln2Fechar_Off;
	BCF         _writeBuffer+2, 1 
;painel_comando.c,552 :: 		Maq5_Output_cln2Subir_Off;
	BCF         _writeBuffer+2, 0 
;painel_comando.c,553 :: 		Maq5_Output_est1_Off;
	BCF         _writeBuffer+1, 4 
;painel_comando.c,554 :: 		Maq5_Output_est2_Off;
	BCF         _writeBuffer+1, 7 
;painel_comando.c,555 :: 		Maq5_Output_mnpVacuo_Off;
	BCF         _writeBuffer+2, 4 
;painel_comando.c,556 :: 		Maq5_Output_mnpX_Off;
	BCF         _writeBuffer+2, 2 
;painel_comando.c,557 :: 		Maq5_Output_mnpZ_Off;
	BCF         _writeBuffer+2, 3 
;painel_comando.c,559 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,561 :: 		case 5:
L_painel_comando_Painel_Maquina560:
;painel_comando.c,563 :: 		if (p->auxMaq5_isTampa)
	MOVLW       29
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina561
;painel_comando.c,564 :: 		p->passoMaquina5 = 10;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       10
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina562
L_painel_comando_Painel_Maquina561:
;painel_comando.c,566 :: 		p->passoMaquina5 = 100;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       100
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina562:
;painel_comando.c,568 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,571 :: 		case 10:
L_painel_comando_Painel_Maquina563:
;painel_comando.c,573 :: 		Maq5_Output_est1_On;
	BSF         _writeBuffer+1, 4 
;painel_comando.c,575 :: 		if (p->auxMaq5_isMontagem)
	MOVLW       28
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina564
;painel_comando.c,576 :: 		p->passoMaquina5 = 30;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       30
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina565
L_painel_comando_Painel_Maquina564:
;painel_comando.c,578 :: 		p->passoMaquina5 = 15;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       15
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina565:
;painel_comando.c,580 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,583 :: 		case 15:
L_painel_comando_Painel_Maquina566:
;painel_comando.c,585 :: 		Maq5_Output_cln1Subir_On;
	BSF         _writeBuffer+1, 5 
;painel_comando.c,587 :: 		if (Maq5_Input_sensPc1)
	BTFSS       _readBuffer+1, 5 
	GOTO        L_painel_comando_Painel_Maquina567
;painel_comando.c,588 :: 		p->auxMaq5_Est1_bordaDescida = true;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina568
L_painel_comando_Painel_Maquina567:
;painel_comando.c,589 :: 		else if (p->auxMaq5_Est1_bordaDescida)
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina569
;painel_comando.c,591 :: 		p->auxMaq5_Est1_bordaDescida = false;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,592 :: 		p->passoMaquina5 = 200;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       200
	MOVWF       POSTINC1+0 
;painel_comando.c,593 :: 		}
L_painel_comando_Painel_Maquina569:
L_painel_comando_Painel_Maquina568:
;painel_comando.c,595 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,598 :: 		case 30:
L_painel_comando_Painel_Maquina570:
;painel_comando.c,600 :: 		if (Maq5_Input_sensPc1)
	BTFSS       _readBuffer+1, 5 
	GOTO        L_painel_comando_Painel_Maquina571
;painel_comando.c,601 :: 		p->auxMaq5_Est1_bordaDescida = true;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina572
L_painel_comando_Painel_Maquina571:
;painel_comando.c,602 :: 		else if (p->auxMaq5_Est1_bordaDescida)
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina573
;painel_comando.c,604 :: 		p->auxMaq5_Est1_bordaDescida = false;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,605 :: 		p->passoMaquina5 = 35;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       35
	MOVWF       POSTINC1+0 
;painel_comando.c,606 :: 		}
L_painel_comando_Painel_Maquina573:
L_painel_comando_Painel_Maquina572:
;painel_comando.c,608 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,611 :: 		case 35:
L_painel_comando_Painel_Maquina574:
;painel_comando.c,613 :: 		Maq5_Output_est1_Off;
	BCF         _writeBuffer+1, 4 
;painel_comando.c,614 :: 		Maq5_Output_cln1Fechar_On;
	BSF         _writeBuffer+1, 6 
;painel_comando.c,616 :: 		if (Maq5_Input_cln1Fechado)
	BTFSS       _readBuffer+1, 7 
	GOTO        L_painel_comando_Painel_Maquina575
;painel_comando.c,617 :: 		p->passoMaquina5 = 130;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       130
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina575:
;painel_comando.c,619 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,622 :: 		case 100:
L_painel_comando_Painel_Maquina576:
;painel_comando.c,624 :: 		Maq5_Output_est2_On;
	BSF         _writeBuffer+1, 7 
;painel_comando.c,626 :: 		if (p->auxMaq5_isMontagem)
	MOVLW       28
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina577
;painel_comando.c,627 :: 		p->passoMaquina5 = 120;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       120
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina578
L_painel_comando_Painel_Maquina577:
;painel_comando.c,629 :: 		p->passoMaquina5 = 105;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       105
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina578:
;painel_comando.c,631 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,634 :: 		case 105:
L_painel_comando_Painel_Maquina579:
;painel_comando.c,636 :: 		Maq5_Output_cln2Subir_On;
	BSF         _writeBuffer+2, 0 
;painel_comando.c,638 :: 		if (Maq5_Input_sensPc2)
	BTFSS       _readBuffer+2, 0 
	GOTO        L_painel_comando_Painel_Maquina580
;painel_comando.c,639 :: 		p->auxMaq5_Est2_bordaDescida = true;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina581
L_painel_comando_Painel_Maquina580:
;painel_comando.c,640 :: 		else if (p->auxMaq5_Est2_bordaDescida)
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina582
;painel_comando.c,642 :: 		p->auxMaq5_Est2_bordaDescida = false;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,643 :: 		p->passoMaquina5 = 200;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       200
	MOVWF       POSTINC1+0 
;painel_comando.c,644 :: 		}
L_painel_comando_Painel_Maquina582:
L_painel_comando_Painel_Maquina581:
;painel_comando.c,646 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,649 :: 		case 120:
L_painel_comando_Painel_Maquina583:
;painel_comando.c,652 :: 		if (Maq5_Input_sensPc2)
	BTFSS       _readBuffer+2, 0 
	GOTO        L_painel_comando_Painel_Maquina584
;painel_comando.c,653 :: 		p->auxMaq5_Est2_bordaDescida = true;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina585
L_painel_comando_Painel_Maquina584:
;painel_comando.c,654 :: 		else if (p->auxMaq5_Est2_bordaDescida)
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina586
;painel_comando.c,656 :: 		p->auxMaq5_Est2_bordaDescida = false;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,657 :: 		p->passoMaquina5 = 121;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       121
	MOVWF       POSTINC1+0 
;painel_comando.c,658 :: 		}
L_painel_comando_Painel_Maquina586:
L_painel_comando_Painel_Maquina585:
;painel_comando.c,660 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,662 :: 		case 121:
L_painel_comando_Painel_Maquina587:
;painel_comando.c,664 :: 		Maq5_Output_est2_Off;
	BCF         _writeBuffer+1, 7 
;painel_comando.c,665 :: 		Maq5_Output_cln2Fechar_On;
	BSF         _writeBuffer+2, 1 
;painel_comando.c,667 :: 		if (Maq5_Input_cln2Fechado)
	BTFSS       _readBuffer+2, 2 
	GOTO        L_painel_comando_Painel_Maquina588
;painel_comando.c,668 :: 		p->passoMaquina5 = 130;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       130
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina588:
;painel_comando.c,670 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,673 :: 		case 130:
L_painel_comando_Painel_Maquina589:
;painel_comando.c,676 :: 		if (Maq5_Input_cln1Fechado && Maq5_Input_cln2Fechado)
	BTFSS       _readBuffer+1, 7 
	GOTO        L_painel_comando_Painel_Maquina592
	BTFSS       _readBuffer+2, 2 
	GOTO        L_painel_comando_Painel_Maquina592
L_painel_comando_Painel_Maquina5214:
;painel_comando.c,677 :: 		p->passoMaquina5 = 135;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       135
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina592:
;painel_comando.c,679 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,681 :: 		case 135:
L_painel_comando_Painel_Maquina593:
;painel_comando.c,683 :: 		Maq5_Output_mnpZ_On;
	BSF         _writeBuffer+2, 3 
;painel_comando.c,685 :: 		if (Maq5_Input_MnpSensMovZ)
	BTFSS       _readBuffer+2, 4 
	GOTO        L_painel_comando_Painel_Maquina594
;painel_comando.c,686 :: 		p->auxMaq5_Est1_bordaDescida = true;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina595
L_painel_comando_Painel_Maquina594:
;painel_comando.c,687 :: 		else if (p->auxMaq5_Est1_bordaDescida)
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina596
;painel_comando.c,690 :: 		p->auxMaq5_Est1_bordaDescida = false;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,691 :: 		p->passoMaquina5 = 140;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       140
	MOVWF       POSTINC1+0 
;painel_comando.c,692 :: 		}
L_painel_comando_Painel_Maquina596:
L_painel_comando_Painel_Maquina595:
;painel_comando.c,694 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,696 :: 		case 140:
L_painel_comando_Painel_Maquina597:
;painel_comando.c,698 :: 		Maq5_Output_mnpVacuo_On;
	BSF         _writeBuffer+2, 4 
;painel_comando.c,700 :: 		if (Maq5_Input_MnpSensPcDetec)
	BTFSS       _readBuffer+2, 5 
	GOTO        L_painel_comando_Painel_Maquina598
;painel_comando.c,701 :: 		p->passoMaquina5 = 145;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       145
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina598:
;painel_comando.c,703 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,705 :: 		case 145:
L_painel_comando_Painel_Maquina599:
;painel_comando.c,707 :: 		Maq5_Output_cln1Fechar_Off;
	BCF         _writeBuffer+1, 6 
;painel_comando.c,709 :: 		if (!Maq5_Input_cln1Fechado)
	BTFSC       _readBuffer+1, 7 
	GOTO        L_painel_comando_Painel_Maquina5100
;painel_comando.c,710 :: 		p->passoMaquina5 = 150;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       150
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina5100:
;painel_comando.c,712 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,714 :: 		case 150:
L_painel_comando_Painel_Maquina5101:
;painel_comando.c,716 :: 		Maq5_Output_mnpZ_Off;
	BCF         _writeBuffer+2, 3 
;painel_comando.c,718 :: 		if (Maq5_Input_MnpSensMovZ)
	BTFSS       _readBuffer+2, 4 
	GOTO        L_painel_comando_Painel_Maquina5102
;painel_comando.c,719 :: 		p->auxMaq5_Est1_bordaDescida = true;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina5103
L_painel_comando_Painel_Maquina5102:
;painel_comando.c,720 :: 		else if (p->auxMaq5_Est1_bordaDescida)
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5104
;painel_comando.c,723 :: 		p->auxMaq5_Est1_bordaDescida = false;
	MOVLW       26
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,724 :: 		p->passoMaquina5 = 155;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       155
	MOVWF       POSTINC1+0 
;painel_comando.c,725 :: 		}
L_painel_comando_Painel_Maquina5104:
L_painel_comando_Painel_Maquina5103:
;painel_comando.c,727 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,729 :: 		case 155:
L_painel_comando_Painel_Maquina5105:
;painel_comando.c,731 :: 		Maq5_Output_mnpX_On;
	BSF         _writeBuffer+2, 2 
;painel_comando.c,733 :: 		if (Maq5_Input_MnpSensMovX)
	BTFSS       _readBuffer+2, 3 
	GOTO        L_painel_comando_Painel_Maquina5106
;painel_comando.c,734 :: 		p->auxMaq5_Est2_bordaDescida = true;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina5107
L_painel_comando_Painel_Maquina5106:
;painel_comando.c,735 :: 		else if (p->auxMaq5_Est2_bordaDescida)
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5108
;painel_comando.c,738 :: 		p->auxMaq5_Est2_bordaDescida = false;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,739 :: 		p->passoMaquina5 = 160;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       160
	MOVWF       POSTINC1+0 
;painel_comando.c,740 :: 		}
L_painel_comando_Painel_Maquina5108:
L_painel_comando_Painel_Maquina5107:
;painel_comando.c,742 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,744 :: 		case 160:
L_painel_comando_Painel_Maquina5109:
;painel_comando.c,746 :: 		Maq5_Output_mnpZ_On;
	BSF         _writeBuffer+2, 3 
;painel_comando.c,747 :: 		Maq5_Output_cln2Fechar_Off;
	BCF         _writeBuffer+2, 1 
;painel_comando.c,749 :: 		if (Maq5_Input_MnpSensMovZ)
	BTFSS       _readBuffer+2, 4 
	GOTO        L_painel_comando_Painel_Maquina5110
;painel_comando.c,750 :: 		p->auxMaq5_Est2_bordaDescida = true;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina5111
L_painel_comando_Painel_Maquina5110:
;painel_comando.c,751 :: 		else if (p->auxMaq5_Est2_bordaDescida)
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5112
;painel_comando.c,754 :: 		p->auxMaq5_Est2_bordaDescida = 0;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,755 :: 		p->passoMaquina5 = 165;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       165
	MOVWF       POSTINC1+0 
;painel_comando.c,756 :: 		}
L_painel_comando_Painel_Maquina5112:
L_painel_comando_Painel_Maquina5111:
;painel_comando.c,758 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,760 :: 		case 165:
L_painel_comando_Painel_Maquina5113:
;painel_comando.c,762 :: 		Maq5_Output_mnpVacuo_Off;
	BCF         _writeBuffer+2, 4 
;painel_comando.c,764 :: 		p->passoMaquina5 = 170;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       170
	MOVWF       POSTINC1+0 
;painel_comando.c,766 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,768 :: 		case 170:
L_painel_comando_Painel_Maquina5114:
;painel_comando.c,770 :: 		Maq5_Output_mnpZ_Off;
	BCF         _writeBuffer+2, 3 
;painel_comando.c,772 :: 		if (Maq5_Input_MnpSensMovZ)
	BTFSS       _readBuffer+2, 4 
	GOTO        L_painel_comando_Painel_Maquina5115
;painel_comando.c,773 :: 		p->auxMaq5_Est2_bordaDescida = true;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina5116
L_painel_comando_Painel_Maquina5115:
;painel_comando.c,774 :: 		else if (p->auxMaq5_Est2_bordaDescida)
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5117
;painel_comando.c,777 :: 		p->auxMaq5_Est2_bordaDescida = false;
	MOVLW       27
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,778 :: 		p->passoMaquina5 = 175;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       175
	MOVWF       POSTINC1+0 
;painel_comando.c,779 :: 		}
L_painel_comando_Painel_Maquina5117:
L_painel_comando_Painel_Maquina5116:
;painel_comando.c,781 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,783 :: 		case 175:
L_painel_comando_Painel_Maquina5118:
;painel_comando.c,786 :: 		Maq5_Output_cln2Subir_On;
	BSF         _writeBuffer+2, 0 
;painel_comando.c,787 :: 		Maq5_Output_est2_On;
	BSF         _writeBuffer+1, 7 
;painel_comando.c,788 :: 		Maq5_Output_mnpX_Off;
	BCF         _writeBuffer+2, 2 
;painel_comando.c,789 :: 		p->passoMaquina5 = 200;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       200
	MOVWF       POSTINC1+0 
;painel_comando.c,791 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,794 :: 		case 200:
L_painel_comando_Painel_Maquina5119:
;painel_comando.c,796 :: 		if (!Maq5_Input_sensFinal)
	BTFSC       _readBuffer+2, 6 
	GOTO        L_painel_comando_Painel_Maquina5120
;painel_comando.c,797 :: 		p->passoMaquina5 = 205;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       205
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina5120:
;painel_comando.c,799 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,802 :: 		case 205:
L_painel_comando_Painel_Maquina5121:
;painel_comando.c,804 :: 		MySql_WriteQtdeFabricada = p->auxQtdeFabricada;
	MOVLW       4
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       R2 
	MOVFF       R1, FSR0L+0
	MOVFF       R2, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       _writeBuffer+8 
;painel_comando.c,806 :: 		if (p->auxQtdeFabricada >= MySql_QtdePeca)
	MOVFF       R1, FSR0L+0
	MOVFF       R2, FSR0H+0
	MOVF        _readBuffer+7, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_painel_comando_Painel_Maquina5122
;painel_comando.c,808 :: 		Painel_Evento_QtdeFeita_On;
	BSF         _writeBuffer+4, 0 
;painel_comando.c,809 :: 		p->passoMaquina5 = 210;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       210
	MOVWF       POSTINC1+0 
;painel_comando.c,810 :: 		}
	GOTO        L_painel_comando_Painel_Maquina5123
L_painel_comando_Painel_Maquina5122:
;painel_comando.c,812 :: 		p->passoMaquina5 = 0;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
L_painel_comando_Painel_Maquina5123:
;painel_comando.c,814 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,817 :: 		case 210:
L_painel_comando_Painel_Maquina5124:
;painel_comando.c,819 :: 		if (MySql_QtdePeca == 0)
	MOVF        _readBuffer+7, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5125
;painel_comando.c,821 :: 		Painel_Evento_QtdeFeita_Off;
	BCF         _writeBuffer+4, 0 
;painel_comando.c,822 :: 		p->auxQtdeFabricada = 0;
	MOVLW       4
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,823 :: 		p->auxStart = false;
	MOVLW       3
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,824 :: 		MySql_WriteQtdeFabricada = 0;
	CLRF        _writeBuffer+8 
;painel_comando.c,826 :: 		if (p->auxManual)
	MOVLW       2
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5126
;painel_comando.c,827 :: 		p->auxManual = 0;
	MOVLW       2
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
L_painel_comando_Painel_Maquina5126:
;painel_comando.c,829 :: 		p->passoMaquina5 = 0;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina5_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina5_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,830 :: 		}
L_painel_comando_Painel_Maquina5125:
;painel_comando.c,832 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,834 :: 		default:
L_painel_comando_Painel_Maquina5127:
;painel_comando.c,835 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina558
;painel_comando.c,837 :: 		} // End switch(p->passoMaquina5)
L_painel_comando_Painel_Maquina557:
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina559
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina560
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina563
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina566
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       30
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina570
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       35
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina574
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       100
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina576
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       105
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina579
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       120
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina583
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       121
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina587
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       130
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina589
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       135
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina593
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       140
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina597
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       145
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina599
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       150
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5101
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       155
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5105
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       160
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5109
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       165
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5113
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       170
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5114
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       175
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5118
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       200
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5119
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       205
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5121
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       210
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina5124
	GOTO        L_painel_comando_Painel_Maquina5127
L_painel_comando_Painel_Maquina558:
;painel_comando.c,838 :: 		} // End void Painel_Maquina5(PAINEL_Controle* p)
L_end_Painel_Maquina5:
	RETURN      0
; end of painel_comando_Painel_Maquina5

painel_comando_Painel_Maquina4:

;painel_comando.c,841 :: 		static void Painel_Maquina4(PAINEL_COMANDO_t *p)
;painel_comando.c,844 :: 		switch (p->passoMaquina4)
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       R3 
	GOTO        L_painel_comando_Painel_Maquina4128
;painel_comando.c,847 :: 		case 0:
L_painel_comando_Painel_Maquina4130:
;painel_comando.c,849 :: 		Maq4_Output_cln1_Off;
	BCF         _writeBuffer+1, 1 
;painel_comando.c,850 :: 		Maq4_Output_cln2_Off;
	BCF         _writeBuffer+1, 2 
;painel_comando.c,851 :: 		Maq4_Output_esteira_Off;
	BCF         _writeBuffer+1, 3 
;painel_comando.c,853 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina4129
;painel_comando.c,855 :: 		case 5:
L_painel_comando_Painel_Maquina4131:
;painel_comando.c,857 :: 		Maq4_Output_esteira_On;
	BSF         _writeBuffer+1, 3 
;painel_comando.c,859 :: 		p->passoMaquina4 = 10;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       10
	MOVWF       POSTINC1+0 
;painel_comando.c,861 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina4129
;painel_comando.c,863 :: 		case 10:
L_painel_comando_Painel_Maquina4132:
;painel_comando.c,865 :: 		if (p->auxMaq4_isTampa)
	MOVLW       24
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina4133
;painel_comando.c,867 :: 		if (Maq4_Input_sens1)
	BTFSS       _readBuffer+0, 7 
	GOTO        L_painel_comando_Painel_Maquina4134
;painel_comando.c,868 :: 		p->passoMaquina4 = 15;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       15
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina4134:
;painel_comando.c,869 :: 		}
	GOTO        L_painel_comando_Painel_Maquina4135
L_painel_comando_Painel_Maquina4133:
;painel_comando.c,870 :: 		else if (Maq4_Input_sens2)
	BTFSS       _readBuffer+1, 2 
	GOTO        L_painel_comando_Painel_Maquina4136
;painel_comando.c,871 :: 		p->passoMaquina4 = 25;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       25
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina4136:
L_painel_comando_Painel_Maquina4135:
;painel_comando.c,873 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina4129
;painel_comando.c,876 :: 		case 15:
L_painel_comando_Painel_Maquina4137:
;painel_comando.c,878 :: 		Maq4_Output_esteira_Off;
	BCF         _writeBuffer+1, 3 
;painel_comando.c,879 :: 		Maq4_Output_cln1_On;
	BSF         _writeBuffer+1, 1 
;painel_comando.c,881 :: 		if (Maq4_Input_cln1Avancado)
	BTFSS       _readBuffer+1, 1 
	GOTO        L_painel_comando_Painel_Maquina4138
;painel_comando.c,882 :: 		p->passoMaquina4 = 20;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       20
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina4138:
;painel_comando.c,884 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina4129
;painel_comando.c,886 :: 		case 20:
L_painel_comando_Painel_Maquina4139:
;painel_comando.c,888 :: 		Maq4_Output_cln1_Off;
	BCF         _writeBuffer+1, 1 
;painel_comando.c,889 :: 		p->passoMaquina4 = 35;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       35
	MOVWF       POSTINC1+0 
;painel_comando.c,891 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina4129
;painel_comando.c,894 :: 		case 25:
L_painel_comando_Painel_Maquina4140:
;painel_comando.c,896 :: 		Maq4_Output_esteira_Off;
	BCF         _writeBuffer+1, 3 
;painel_comando.c,897 :: 		Maq4_Output_cln2_On;
	BSF         _writeBuffer+1, 2 
;painel_comando.c,899 :: 		if (Maq4_Input_cln2Avancado)
	BTFSS       _readBuffer+1, 4 
	GOTO        L_painel_comando_Painel_Maquina4141
;painel_comando.c,900 :: 		p->passoMaquina4 = 30;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       30
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina4141:
;painel_comando.c,902 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina4129
;painel_comando.c,904 :: 		case 30:
L_painel_comando_Painel_Maquina4142:
;painel_comando.c,906 :: 		Maq4_Output_cln2_Off;
	BCF         _writeBuffer+1, 2 
;painel_comando.c,907 :: 		p->passoMaquina4 = 35;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       35
	MOVWF       POSTINC1+0 
;painel_comando.c,909 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina4129
;painel_comando.c,911 :: 		case 35:
L_painel_comando_Painel_Maquina4143:
;painel_comando.c,913 :: 		p->passoMaquina4 = 0;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,914 :: 		p->passoMaquina5 = 5;
	MOVLW       25
	ADDWF       FARG_painel_comando_Painel_Maquina4_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina4_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       5
	MOVWF       POSTINC1+0 
;painel_comando.c,916 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina4129
;painel_comando.c,918 :: 		default:
L_painel_comando_Painel_Maquina4144:
;painel_comando.c,919 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina4129
;painel_comando.c,921 :: 		} // End switch(p->passoMaquina4)
L_painel_comando_Painel_Maquina4128:
	MOVFF       R2, FSR0L+0
	MOVFF       R3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina4130
	MOVFF       R2, FSR0L+0
	MOVFF       R3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina4131
	MOVFF       R2, FSR0L+0
	MOVFF       R3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina4132
	MOVFF       R2, FSR0L+0
	MOVFF       R3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina4137
	MOVFF       R2, FSR0L+0
	MOVFF       R3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       20
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina4139
	MOVFF       R2, FSR0L+0
	MOVFF       R3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       25
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina4140
	MOVFF       R2, FSR0L+0
	MOVFF       R3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       30
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina4142
	MOVFF       R2, FSR0L+0
	MOVFF       R3, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       35
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina4143
	GOTO        L_painel_comando_Painel_Maquina4144
L_painel_comando_Painel_Maquina4129:
;painel_comando.c,923 :: 		} // End void Painel_Maquina4(PAINEL_Controle* p)
L_end_Painel_Maquina4:
	RETURN      0
; end of painel_comando_Painel_Maquina4

painel_comando_Painel_Maquina3:

;painel_comando.c,926 :: 		static void Painel_Maquina3(PAINEL_COMANDO_t *p)
;painel_comando.c,929 :: 		switch (p->passoMaquina3)
	MOVLW       21
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FLOC_painel_comando_Painel_Maquina3+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FLOC_painel_comando_Painel_Maquina3+1 
	GOTO        L_painel_comando_Painel_Maquina3145
;painel_comando.c,932 :: 		case 0:
L_painel_comando_Painel_Maquina3147:
;painel_comando.c,934 :: 		Maq3_Output_esteira_Off;
	BCF         _writeBuffer+1, 0 
;painel_comando.c,935 :: 		p->auxMaq3_bordaDescida = false;
	MOVLW       22
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,938 :: 		if (Maq3_Input_sensTipoPeca > 0 && p->passoMaquina2 == 25)
	MOVF        _readBuffer+4, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_painel_comando_Painel_Maquina3150
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       25
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3150
L_painel_comando_Painel_Maquina3216:
;painel_comando.c,939 :: 		p->passoMaquina3 = 3;
	MOVLW       21
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       3
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina3150:
;painel_comando.c,941 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina3146
;painel_comando.c,943 :: 		case 3:
L_painel_comando_Painel_Maquina3151:
;painel_comando.c,946 :: 		if (!Painel_isPecaBruta(Maq3_Input_sensTipoPeca))
	MOVF        _readBuffer+4, 0 
	MOVWF       FARG_painel_comando_Painel_isPecaBruta_sensTipoPeca+0 
	CALL        painel_comando_Painel_isPecaBruta+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3152
;painel_comando.c,949 :: 		if (Painel_isMontagem(MySql_TipoPedido))
	MOVF        _readBuffer+6, 0 
	MOVWF       FARG_painel_comando_Painel_isMontagem_idPeca+0 
	CALL        painel_comando_Painel_isMontagem+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3153
;painel_comando.c,951 :: 		if (++(p->auxContagemPeca) >= 2)
	MOVLW       5
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       R2 
	MOVFF       R1, FSR0L+0
	MOVFF       R2, FSR0H+0
	MOVF        POSTINC0+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVFF       R1, FSR1L+0
	MOVFF       R2, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R1, FSR0L+0
	MOVFF       R2, FSR0H+0
	MOVLW       2
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_painel_comando_Painel_Maquina3154
;painel_comando.c,953 :: 		p->auxQtdeFabricada += 1;
	MOVLW       4
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       R2 
	MOVFF       R1, FSR0L+0
	MOVFF       R2, FSR0H+0
	MOVF        POSTINC0+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVFF       R1, FSR1L+0
	MOVFF       R2, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;painel_comando.c,954 :: 		p->auxContagemPeca = 0;
	MOVLW       5
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,955 :: 		}
L_painel_comando_Painel_Maquina3154:
;painel_comando.c,957 :: 		p->auxMaq5_isMontagem = true;
	MOVLW       28
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
;painel_comando.c,958 :: 		}
	GOTO        L_painel_comando_Painel_Maquina3155
L_painel_comando_Painel_Maquina3153:
;painel_comando.c,961 :: 		p->auxQtdeFabricada += 1;
	MOVLW       4
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       R2 
	MOVFF       R1, FSR0L+0
	MOVFF       R2, FSR0H+0
	MOVF        POSTINC0+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVFF       R1, FSR1L+0
	MOVFF       R2, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;painel_comando.c,962 :: 		p->auxMaq5_isMontagem = false;
	MOVLW       28
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,963 :: 		}
L_painel_comando_Painel_Maquina3155:
;painel_comando.c,967 :: 		Maq3_Input_sensTipoPeca == 5 ||
	MOVF        _readBuffer+4, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3215
	MOVF        _readBuffer+4, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3215
;painel_comando.c,968 :: 		Maq3_Input_sensTipoPeca == 8)
	MOVF        _readBuffer+4, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3215
	GOTO        L_painel_comando_Painel_Maquina3158
L_painel_comando_Painel_Maquina3215:
;painel_comando.c,970 :: 		p->auxMaq4_isTampa = true;
	MOVLW       24
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
;painel_comando.c,971 :: 		p->auxMaq5_isTampa = true;
	MOVLW       29
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
;painel_comando.c,972 :: 		}
	GOTO        L_painel_comando_Painel_Maquina3159
L_painel_comando_Painel_Maquina3158:
;painel_comando.c,975 :: 		p->auxMaq4_isTampa = false;
	MOVLW       24
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,976 :: 		p->auxMaq5_isTampa = false;
	MOVLW       29
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,977 :: 		}
L_painel_comando_Painel_Maquina3159:
;painel_comando.c,979 :: 		p->passoMaquina1 = 0;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,980 :: 		p->passoMaquina2 = 0;
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,981 :: 		p->passoMaquina3 = 5;
	MOVLW       21
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       5
	MOVWF       POSTINC1+0 
;painel_comando.c,982 :: 		} // End if(!Painel_isPecaBruta(Maq3_Input_sensTipoPeca)
	GOTO        L_painel_comando_Painel_Maquina3160
L_painel_comando_Painel_Maquina3152:
;painel_comando.c,986 :: 		p->passoMaquina3 = 15;
	MOVLW       21
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       15
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina3160:
;painel_comando.c,988 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina3146
;painel_comando.c,990 :: 		case 5:
L_painel_comando_Painel_Maquina3161:
;painel_comando.c,992 :: 		Maq3_Output_esteira_On;
	BSF         _writeBuffer+1, 0 
;painel_comando.c,994 :: 		if (Maq3_Input_sensInicio)
	BTFSS       _readBuffer+0, 6 
	GOTO        L_painel_comando_Painel_Maquina3162
;painel_comando.c,996 :: 		p->auxMaq3_bordaDescida = true;
	MOVLW       22
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
;painel_comando.c,997 :: 		p->passoMaquina4 = 5;
	MOVLW       23
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       5
	MOVWF       POSTINC1+0 
;painel_comando.c,998 :: 		}
	GOTO        L_painel_comando_Painel_Maquina3163
L_painel_comando_Painel_Maquina3162:
;painel_comando.c,999 :: 		else if (p->auxMaq3_bordaDescida)
	MOVLW       22
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3164
;painel_comando.c,1001 :: 		p->auxMaq3_bordaDescida = false;
	MOVLW       22
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,1002 :: 		p->passoMaquina3 = 10;
	MOVLW       21
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       10
	MOVWF       POSTINC1+0 
;painel_comando.c,1003 :: 		}
L_painel_comando_Painel_Maquina3164:
L_painel_comando_Painel_Maquina3163:
;painel_comando.c,1005 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina3146
;painel_comando.c,1007 :: 		case 10:
L_painel_comando_Painel_Maquina3165:
;painel_comando.c,1009 :: 		Maq3_Output_esteira_Off;
	BCF         _writeBuffer+1, 0 
;painel_comando.c,1011 :: 		p->passoMaquina3 = 0;
	MOVLW       21
	ADDWF       FARG_painel_comando_Painel_Maquina3_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina3_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,1013 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina3146
;painel_comando.c,1016 :: 		case 15:
L_painel_comando_Painel_Maquina3166:
;painel_comando.c,1018 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina3146
;painel_comando.c,1020 :: 		default:
L_painel_comando_Painel_Maquina3167:
;painel_comando.c,1021 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina3146
;painel_comando.c,1023 :: 		} // End switch(p->passoMaquina3)
L_painel_comando_Painel_Maquina3145:
	MOVFF       FLOC_painel_comando_Painel_Maquina3+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina3+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3147
	MOVFF       FLOC_painel_comando_Painel_Maquina3+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina3+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3151
	MOVFF       FLOC_painel_comando_Painel_Maquina3+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina3+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3161
	MOVFF       FLOC_painel_comando_Painel_Maquina3+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina3+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3165
	MOVFF       FLOC_painel_comando_Painel_Maquina3+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina3+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina3166
	GOTO        L_painel_comando_Painel_Maquina3167
L_painel_comando_Painel_Maquina3146:
;painel_comando.c,1025 :: 		} // End void Painel_Maquina3(PAINEL_Controle* p)
L_end_Painel_Maquina3:
	RETURN      0
; end of painel_comando_Painel_Maquina3

painel_comando_Painel_Maquina2:

;painel_comando.c,1028 :: 		static void Painel_Maquina2(PAINEL_COMANDO_t *p)
;painel_comando.c,1031 :: 		switch (p->passoMaquina2)
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Maquina2_p+0, 0 
	MOVWF       FLOC_painel_comando_Painel_Maquina2+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina2_p+1, 0 
	MOVWF       FLOC_painel_comando_Painel_Maquina2+1 
	GOTO        L_painel_comando_Painel_Maquina2168
;painel_comando.c,1034 :: 		case 0:
L_painel_comando_Painel_Maquina2170:
;painel_comando.c,1037 :: 		Maq2_Output_btnReset_Off;
	BCF         _writeBuffer+0, 4 
;painel_comando.c,1038 :: 		Maq2_Output_btnStart_Off;
	BCF         _writeBuffer+0, 5 
;painel_comando.c,1039 :: 		Maq2_Output_btnStop_Off;
	BCF         _writeBuffer+0, 6 
;painel_comando.c,1041 :: 		if (p->passoMaquina1 == 25)
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina2_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina2_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       25
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina2171
;painel_comando.c,1042 :: 		p->passoMaquina2 = 5;
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Maquina2_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina2_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       5
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina2171:
;painel_comando.c,1044 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina2169
;painel_comando.c,1046 :: 		case 5:
L_painel_comando_Painel_Maquina2172:
;painel_comando.c,1048 :: 		if (Painel_isFazTampa(p->auxContagemPeca, MySql_TipoPedido))
	MOVLW       5
	ADDWF       FARG_painel_comando_Painel_Maquina2_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina2_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_painel_comando_Painel_isFazTampa_qtdeAuxContagemPeca+0 
	MOVF        _readBuffer+6, 0 
	MOVWF       FARG_painel_comando_Painel_isFazTampa_idPeca+0 
	CALL        painel_comando_Painel_isFazTampa+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina2173
;painel_comando.c,1049 :: 		Maq2_Output_fazerTampa_On;
	BSF         _writeBuffer+0, 7 
	GOTO        L_painel_comando_Painel_Maquina2174
L_painel_comando_Painel_Maquina2173:
;painel_comando.c,1051 :: 		Maq2_Output_fazerTampa_Off;
	BCF         _writeBuffer+0, 7 
L_painel_comando_Painel_Maquina2174:
;painel_comando.c,1053 :: 		p->passoMaquina2 = 10;
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Maquina2_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina2_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       10
	MOVWF       POSTINC1+0 
;painel_comando.c,1055 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina2169
;painel_comando.c,1057 :: 		case 10:
L_painel_comando_Painel_Maquina2175:
;painel_comando.c,1059 :: 		Maq2_Output_btnStart_On;
	BSF         _writeBuffer+0, 5 
;painel_comando.c,1061 :: 		if (Maq2_Input_sensUsinagemOperando)
	BTFSS       _readBuffer+0, 5 
	GOTO        L_painel_comando_Painel_Maquina2176
;painel_comando.c,1062 :: 		p->passoMaquina2 = 15;
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Maquina2_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina2_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       15
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina2176:
;painel_comando.c,1064 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina2169
;painel_comando.c,1066 :: 		case 15:
L_painel_comando_Painel_Maquina2177:
;painel_comando.c,1068 :: 		if (!Maq2_Input_sensCncPortaAberta)
	BTFSC       _readBuffer+0, 4 
	GOTO        L_painel_comando_Painel_Maquina2178
;painel_comando.c,1069 :: 		p->passoMaquina2 = 20;
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Maquina2_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina2_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       20
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina2178:
;painel_comando.c,1071 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina2169
;painel_comando.c,1073 :: 		case 20:
L_painel_comando_Painel_Maquina2179:
;painel_comando.c,1075 :: 		if (Maq2_Input_sensCncPortaAberta)
	BTFSS       _readBuffer+0, 4 
	GOTO        L_painel_comando_Painel_Maquina2180
;painel_comando.c,1076 :: 		p->passoMaquina2 = 25;
	MOVLW       20
	ADDWF       FARG_painel_comando_Painel_Maquina2_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina2_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       25
	MOVWF       POSTINC1+0 
L_painel_comando_Painel_Maquina2180:
;painel_comando.c,1078 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina2169
;painel_comando.c,1080 :: 		default:
L_painel_comando_Painel_Maquina2181:
;painel_comando.c,1081 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina2169
;painel_comando.c,1083 :: 		} // End switch(p->passoMaquina2)
L_painel_comando_Painel_Maquina2168:
	MOVFF       FLOC_painel_comando_Painel_Maquina2+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina2+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina2170
	MOVFF       FLOC_painel_comando_Painel_Maquina2+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina2+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina2172
	MOVFF       FLOC_painel_comando_Painel_Maquina2+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina2+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina2175
	MOVFF       FLOC_painel_comando_Painel_Maquina2+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina2+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina2177
	MOVFF       FLOC_painel_comando_Painel_Maquina2+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina2+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       20
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina2179
	GOTO        L_painel_comando_Painel_Maquina2181
L_painel_comando_Painel_Maquina2169:
;painel_comando.c,1084 :: 		} // End Painel_Maquina2(PAINEL_Controle* p)
L_end_Painel_Maquina2:
	RETURN      0
; end of painel_comando_Painel_Maquina2

painel_comando_Painel_Maquina1:

;painel_comando.c,1087 :: 		static void Painel_Maquina1(PAINEL_COMANDO_t *p)
;painel_comando.c,1092 :: 		switch (p->passoMaquina1)
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FLOC_painel_comando_Painel_Maquina1+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FLOC_painel_comando_Painel_Maquina1+1 
	GOTO        L_painel_comando_Painel_Maquina1182
;painel_comando.c,1095 :: 		case 0:
L_painel_comando_Painel_Maquina1184:
;painel_comando.c,1097 :: 		Maq1_Output_dropVerde_Off;
	BCF         _writeBuffer+0, 2 
;painel_comando.c,1098 :: 		Maq1_Output_dropAzul_Off;
	BCF         _writeBuffer+0, 0 
;painel_comando.c,1099 :: 		Maq1_Output_dropMetal_Off;
	BCF         _writeBuffer+0, 1 
;painel_comando.c,1100 :: 		Maq1_Output_esteira_Off;
	BCF         _writeBuffer+0, 3 
;painel_comando.c,1101 :: 		Maq1_Output_esteiraPcAzul_Off;
	BCF         _writeBuffer+17, 0 
;painel_comando.c,1102 :: 		Maq1_Output_esteiraPcCinza_Off;
	BCF         _writeBuffer+17, 1 
;painel_comando.c,1105 :: 		if (p->auxAuto || p->auxManual || p->auxStart)
	MOVLW       1
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1217
	MOVLW       2
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1217
	MOVLW       3
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1217
	GOTO        L_painel_comando_Painel_Maquina1187
L_painel_comando_Painel_Maquina1217:
;painel_comando.c,1107 :: 		p->auxStart = true; // Flag de M�quina operando
	MOVLW       3
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
;painel_comando.c,1109 :: 		p->passoMaquina1 = 5;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       5
	MOVWF       POSTINC1+0 
;painel_comando.c,1110 :: 		}
L_painel_comando_Painel_Maquina1187:
;painel_comando.c,1111 :: 		break; // End case 0
	GOTO        L_painel_comando_Painel_Maquina1183
;painel_comando.c,1113 :: 		case 5:
L_painel_comando_Painel_Maquina1188:
;painel_comando.c,1116 :: 		if (p->auxQtdeFabricada < MySql_QtdePeca)
	MOVLW       4
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        _readBuffer+7, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_painel_comando_Painel_Maquina1189
;painel_comando.c,1117 :: 		p->passoMaquina1 = 10;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       10
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina1190
L_painel_comando_Painel_Maquina1189:
;painel_comando.c,1119 :: 		p->passoMaquina1 = 0;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
L_painel_comando_Painel_Maquina1190:
;painel_comando.c,1121 :: 		break; // End case 5
	GOTO        L_painel_comando_Painel_Maquina1183
;painel_comando.c,1123 :: 		case 10:
L_painel_comando_Painel_Maquina1191:
;painel_comando.c,1127 :: 		auxVerificaCor = Painel_VerificaCor(MySql_TipoPedido, p->auxContagemPeca);
	MOVF        _readBuffer+6, 0 
	MOVWF       FARG_painel_comando_Painel_VerificaCor_idPeca+0 
	MOVLW       5
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_painel_comando_Painel_VerificaCor_cont+0 
	CALL        painel_comando_Painel_VerificaCor+0, 0
	MOVF        R0, 0 
	MOVWF       painel_comando_Painel_Maquina1_auxVerificaCor_L0+0 
;painel_comando.c,1130 :: 		if (auxVerificaCor != 0xFF)
	MOVF        R0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1192
;painel_comando.c,1133 :: 		if (auxVerificaCor == 0)
	MOVF        painel_comando_Painel_Maquina1_auxVerificaCor_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1193
;painel_comando.c,1135 :: 		Maq1_Output_dropAzul_On;
	BSF         _writeBuffer+0, 0 
;painel_comando.c,1137 :: 		if (Maq1_Input_sensPcAzul)
	BTFSS       _readBuffer+0, 0 
	GOTO        L_painel_comando_Painel_Maquina1194
;painel_comando.c,1139 :: 		Maq1_Output_dropAzul_Off;
	BCF         _writeBuffer+0, 0 
;painel_comando.c,1140 :: 		Maq1_Output_esteiraPcAzul_On;
	BSF         _writeBuffer+17, 0 
;painel_comando.c,1141 :: 		p->passoMaquina1 = 15;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       15
	MOVWF       POSTINC1+0 
;painel_comando.c,1142 :: 		}
L_painel_comando_Painel_Maquina1194:
;painel_comando.c,1143 :: 		}
	GOTO        L_painel_comando_Painel_Maquina1195
L_painel_comando_Painel_Maquina1193:
;painel_comando.c,1146 :: 		else if (auxVerificaCor == 1)
	MOVF        painel_comando_Painel_Maquina1_auxVerificaCor_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1196
;painel_comando.c,1148 :: 		Maq1_Output_dropMetal_On;
	BSF         _writeBuffer+0, 1 
;painel_comando.c,1150 :: 		if (Maq1_Input_sensPcMetal)
	BTFSS       _readBuffer+0, 1 
	GOTO        L_painel_comando_Painel_Maquina1197
;painel_comando.c,1152 :: 		Maq1_Output_dropMetal_Off;
	BCF         _writeBuffer+0, 1 
;painel_comando.c,1153 :: 		Maq1_Output_esteiraPcCinza_On;
	BSF         _writeBuffer+17, 1 
;painel_comando.c,1154 :: 		p->passoMaquina1 = 15;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       15
	MOVWF       POSTINC1+0 
;painel_comando.c,1155 :: 		}
L_painel_comando_Painel_Maquina1197:
;painel_comando.c,1156 :: 		}
	GOTO        L_painel_comando_Painel_Maquina1198
L_painel_comando_Painel_Maquina1196:
;painel_comando.c,1161 :: 		Maq1_Output_dropVerde_On;
	BSF         _writeBuffer+0, 2 
;painel_comando.c,1163 :: 		if (Maq1_Input_sensPcVerde)
	BTFSS       _readBuffer+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1199
;painel_comando.c,1165 :: 		Maq1_Output_dropVerde_Off;
	BCF         _writeBuffer+0, 2 
;painel_comando.c,1166 :: 		p->passoMaquina1 = 15;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       15
	MOVWF       POSTINC1+0 
;painel_comando.c,1167 :: 		}
L_painel_comando_Painel_Maquina1199:
;painel_comando.c,1168 :: 		}
L_painel_comando_Painel_Maquina1198:
L_painel_comando_Painel_Maquina1195:
;painel_comando.c,1170 :: 		} // End  if(auxVerificaCor != 0xFF)
L_painel_comando_Painel_Maquina1192:
;painel_comando.c,1172 :: 		break; // End case 10
	GOTO        L_painel_comando_Painel_Maquina1183
;painel_comando.c,1174 :: 		case 15:
L_painel_comando_Painel_Maquina1200:
;painel_comando.c,1176 :: 		Maq1_Output_esteira_On;
	BSF         _writeBuffer+0, 3 
;painel_comando.c,1178 :: 		if (Maq1_Input_sensFinal)
	BTFSS       _readBuffer+0, 3 
	GOTO        L_painel_comando_Painel_Maquina1201
;painel_comando.c,1179 :: 		p->auxMaq1_bordaDescida = true;
	MOVLW       19
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
	GOTO        L_painel_comando_Painel_Maquina1202
L_painel_comando_Painel_Maquina1201:
;painel_comando.c,1180 :: 		else if (p->auxMaq1_bordaDescida)
	MOVLW       19
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1203
;painel_comando.c,1182 :: 		p->auxMaq1_bordaDescida = false;
	MOVLW       19
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;painel_comando.c,1183 :: 		p->passoMaquina1 = 20;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       20
	MOVWF       POSTINC1+0 
;painel_comando.c,1184 :: 		}
L_painel_comando_Painel_Maquina1203:
L_painel_comando_Painel_Maquina1202:
;painel_comando.c,1186 :: 		break; // End case 15
	GOTO        L_painel_comando_Painel_Maquina1183
;painel_comando.c,1188 :: 		case 20:
L_painel_comando_Painel_Maquina1204:
;painel_comando.c,1190 :: 		Maq1_Output_esteira_Off;
	BCF         _writeBuffer+0, 3 
;painel_comando.c,1191 :: 		Maq1_Output_esteiraPcAzul_Off;
	BCF         _writeBuffer+17, 0 
;painel_comando.c,1192 :: 		Maq1_Output_esteiraPcCinza_Off;
	BCF         _writeBuffer+17, 1 
;painel_comando.c,1194 :: 		p->passoMaquina1 = 25;
	MOVLW       18
	ADDWF       FARG_painel_comando_Painel_Maquina1_p+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_painel_comando_Painel_Maquina1_p+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       25
	MOVWF       POSTINC1+0 
;painel_comando.c,1196 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina1183
;painel_comando.c,1198 :: 		default:
L_painel_comando_Painel_Maquina1205:
;painel_comando.c,1199 :: 		break;
	GOTO        L_painel_comando_Painel_Maquina1183
;painel_comando.c,1201 :: 		} // End switch(p->passoMaquina1)
L_painel_comando_Painel_Maquina1182:
	MOVFF       FLOC_painel_comando_Painel_Maquina1+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina1+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1184
	MOVFF       FLOC_painel_comando_Painel_Maquina1+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina1+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1188
	MOVFF       FLOC_painel_comando_Painel_Maquina1+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina1+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1191
	MOVFF       FLOC_painel_comando_Painel_Maquina1+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina1+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1200
	MOVFF       FLOC_painel_comando_Painel_Maquina1+0, FSR0L+0
	MOVFF       FLOC_painel_comando_Painel_Maquina1+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	XORLW       20
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Maquina1204
	GOTO        L_painel_comando_Painel_Maquina1205
L_painel_comando_Painel_Maquina1183:
;painel_comando.c,1203 :: 		} // End Painel_Maquina1(PAINEL_Controle* p)
L_end_Painel_Maquina1:
	RETURN      0
; end of painel_comando_Painel_Maquina1

painel_comando_Painel_Modo:

;painel_comando.c,1206 :: 		static void Painel_Modo(PAINEL_COMANDO_t *p)
;painel_comando.c,1210 :: 		LATD = (PORTD & 0xE7);
	MOVLW       231
	ANDWF       PORTD+0, 0 
	MOVWF       LATD+0 
;painel_comando.c,1212 :: 		PAINEL_VerificaConexao(p);
	MOVF        FARG_painel_comando_Painel_Modo_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_VerificaConexao_p+0 
	MOVF        FARG_painel_comando_Painel_Modo_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_VerificaConexao_p+1 
	CALL        painel_comando_Painel_VerificaConexao+0, 0
;painel_comando.c,1215 :: 		if (btnEmergencia)
	BTFSS       PORTB+0, 0 
	GOTO        L_painel_comando_Painel_Modo206
;painel_comando.c,1216 :: 		Painel_Emergencia(p);
	MOVF        FARG_painel_comando_Painel_Modo_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_Emergencia_p+0 
	MOVF        FARG_painel_comando_Painel_Modo_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_Emergencia_p+1 
	CALL        painel_comando_Painel_Emergencia+0, 0
	GOTO        L_painel_comando_Painel_Modo207
L_painel_comando_Painel_Modo206:
;painel_comando.c,1217 :: 		else if (p->auxErro)
	MOVFF       FARG_painel_comando_Painel_Modo_p+0, FSR0L+0
	MOVFF       FARG_painel_comando_Painel_Modo_p+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_painel_comando_Painel_Modo208
;painel_comando.c,1218 :: 		Painel_Erro(p);
	MOVF        FARG_painel_comando_Painel_Modo_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_Erro_p+0 
	MOVF        FARG_painel_comando_Painel_Modo_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_Erro_p+1 
	CALL        painel_comando_Painel_Erro+0, 0
	GOTO        L_painel_comando_Painel_Modo209
L_painel_comando_Painel_Modo208:
;painel_comando.c,1221 :: 		Painel_Painel(p);
	MOVF        FARG_painel_comando_Painel_Modo_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_Painel_p+0 
	MOVF        FARG_painel_comando_Painel_Modo_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_Painel_p+1 
	CALL        painel_comando_Painel_Painel+0, 0
;painel_comando.c,1222 :: 		Painel_Maquina1(p);
	MOVF        FARG_painel_comando_Painel_Modo_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina1_p+0 
	MOVF        FARG_painel_comando_Painel_Modo_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina1_p+1 
	CALL        painel_comando_Painel_Maquina1+0, 0
;painel_comando.c,1223 :: 		Painel_Maquina2(p);
	MOVF        FARG_painel_comando_Painel_Modo_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina2_p+0 
	MOVF        FARG_painel_comando_Painel_Modo_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina2_p+1 
	CALL        painel_comando_Painel_Maquina2+0, 0
;painel_comando.c,1224 :: 		Painel_Maquina3(p);
	MOVF        FARG_painel_comando_Painel_Modo_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina3_p+0 
	MOVF        FARG_painel_comando_Painel_Modo_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina3_p+1 
	CALL        painel_comando_Painel_Maquina3+0, 0
;painel_comando.c,1225 :: 		Painel_Maquina4(p);
	MOVF        FARG_painel_comando_Painel_Modo_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina4_p+0 
	MOVF        FARG_painel_comando_Painel_Modo_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina4_p+1 
	CALL        painel_comando_Painel_Maquina4+0, 0
;painel_comando.c,1226 :: 		Painel_Maquina5(p);
	MOVF        FARG_painel_comando_Painel_Modo_p+0, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina5_p+0 
	MOVF        FARG_painel_comando_Painel_Modo_p+1, 0 
	MOVWF       FARG_painel_comando_Painel_Maquina5_p+1 
	CALL        painel_comando_Painel_Maquina5+0, 0
;painel_comando.c,1227 :: 		}
L_painel_comando_Painel_Modo209:
L_painel_comando_Painel_Modo207:
;painel_comando.c,1228 :: 		} // End Painel_Modo(PAINEL_Controle *p)
L_end_Painel_Modo:
	RETURN      0
; end of painel_comando_Painel_Modo
