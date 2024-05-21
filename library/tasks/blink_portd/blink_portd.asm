
_BLINK_PORTD_main:

;blink_portd.c,3 :: 		void BLINK_PORTD_main()
;blink_portd.c,6 :: 		MODO_FUNCIONAMENTO_T = TASK_BLINK_PORTD;
	MOVLW       1
	MOVWF       _writeBuffer+6 
;blink_portd.c,8 :: 		if(++count >= 1000)
	INFSNZ      BLINK_PORTD_main_count_L0+0, 1 
	INCF        BLINK_PORTD_main_count_L0+1, 1 
	MOVLW       3
	SUBWF       BLINK_PORTD_main_count_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BLINK_PORTD_main2
	MOVLW       232
	SUBWF       BLINK_PORTD_main_count_L0+0, 0 
L__BLINK_PORTD_main2:
	BTFSS       STATUS+0, 0 
	GOTO        L_BLINK_PORTD_main0
;blink_portd.c,10 :: 		LATD = ~PORTD;
	COMF        PORTD+0, 0 
	MOVWF       LATD+0 
;blink_portd.c,11 :: 		count = 0;
	CLRF        BLINK_PORTD_main_count_L0+0 
	CLRF        BLINK_PORTD_main_count_L0+1 
;blink_portd.c,12 :: 		}
L_BLINK_PORTD_main0:
;blink_portd.c,14 :: 		}
L_end_BLINK_PORTD_main:
	RETURN      0
; end of _BLINK_PORTD_main
