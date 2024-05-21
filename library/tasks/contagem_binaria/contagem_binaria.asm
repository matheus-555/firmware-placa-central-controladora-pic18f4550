
_CONTAGEM_BINARIA_main:

;contagem_binaria.c,3 :: 		void CONTAGEM_BINARIA_main()
;contagem_binaria.c,6 :: 		MODO_FUNCIONAMENTO_T = TASK_CONTAGEM_BINARIA;
	MOVLW       4
	MOVWF       _writeBuffer+6 
;contagem_binaria.c,8 :: 		if(++count == 2000)
	INFSNZ      CONTAGEM_BINARIA_main_count_L0+0, 1 
	INCF        CONTAGEM_BINARIA_main_count_L0+1, 1 
	MOVF        CONTAGEM_BINARIA_main_count_L0+1, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L__CONTAGEM_BINARIA_main2
	MOVLW       208
	XORWF       CONTAGEM_BINARIA_main_count_L0+0, 0 
L__CONTAGEM_BINARIA_main2:
	BTFSS       STATUS+0, 2 
	GOTO        L_CONTAGEM_BINARIA_main0
;contagem_binaria.c,10 :: 		LATD = ++PORTD;
	MOVF        PORTD+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       PORTD+0 
	MOVF        PORTD+0, 0 
	MOVWF       LATD+0 
;contagem_binaria.c,11 :: 		count = 0;
	CLRF        CONTAGEM_BINARIA_main_count_L0+0 
	CLRF        CONTAGEM_BINARIA_main_count_L0+1 
;contagem_binaria.c,12 :: 		}
L_CONTAGEM_BINARIA_main0:
;contagem_binaria.c,13 :: 		}
L_end_CONTAGEM_BINARIA_main:
	RETURN      0
; end of _CONTAGEM_BINARIA_main
