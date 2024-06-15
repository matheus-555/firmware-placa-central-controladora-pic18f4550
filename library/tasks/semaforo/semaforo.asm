
_SEMAFORO_init:

;semaforo.c,20 :: 		void SEMAFORO_init()
;semaforo.c,22 :: 		MODO_FUNCIONAMENTO_T = TASK_SEMAFORO;
	MOVLW       3
	MOVWF       _writeBuffer+6 
;semaforo.c,23 :: 		}
L_end_SEMAFORO_init:
	RETURN      0
; end of _SEMAFORO_init

_SEMAFORO_main:

;semaforo.c,25 :: 		void SEMAFORO_main()
;semaforo.c,27 :: 		switch (estado)
	GOTO        L_SEMAFORO_main0
;semaforo.c,34 :: 		case 0:
L_SEMAFORO_main2:
;semaforo.c,35 :: 		set_bit(LATD, 0); // verde
	BSF         LATD+0, 0 
;semaforo.c,36 :: 		clr_bit(LATD, 1); // amarelo
	BCF         LATD+0, 1 
;semaforo.c,37 :: 		clr_bit(LATD, 2); // vermelho
	BCF         LATD+0, 2 
;semaforo.c,39 :: 		SEMAFORO_Fase1();
	CALL        semaforo_SEMAFORO_fase1+0, 0
;semaforo.c,41 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_VERDE_ON))
	MOVLW       semaforo_timer_s+0
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       hi_addr(semaforo_timer_s+0)
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       8
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main3
;semaforo.c,42 :: 		estado = 1;
	MOVLW       1
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main3:
;semaforo.c,44 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,51 :: 		case 1:
L_SEMAFORO_main4:
;semaforo.c,53 :: 		clr_bit(LATD, 0); // verde
	BCF         LATD+0, 0 
;semaforo.c,54 :: 		set_bit(LATD, 1); // amarelo
	BSF         LATD+0, 1 
;semaforo.c,55 :: 		clr_bit(LATD, 2); // vermelho
	BCF         LATD+0, 2 
;semaforo.c,57 :: 		SEMAFORO_fase1();
	CALL        semaforo_SEMAFORO_fase1+0, 0
;semaforo.c,59 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_AMARELO_ON))
	MOVLW       semaforo_timer_s+0
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       hi_addr(semaforo_timer_s+0)
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       3
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main5
;semaforo.c,60 :: 		estado = 2;
	MOVLW       2
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main5:
;semaforo.c,62 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,69 :: 		case 2:
L_SEMAFORO_main6:
;semaforo.c,70 :: 		SEMAFORO_todos_vermelho();
	CALL        semaforo_SEMAFORO_todos_vermelho+0, 0
;semaforo.c,72 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
	MOVLW       semaforo_timer_s+0
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       hi_addr(semaforo_timer_s+0)
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main7
;semaforo.c,73 :: 		estado = 3;
	MOVLW       3
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main7:
;semaforo.c,75 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,82 :: 		case 3:
L_SEMAFORO_main8:
;semaforo.c,84 :: 		set_bit(LATD, 5); // verde
	BSF         LATD+0, 5 
;semaforo.c,85 :: 		clr_bit(LATD, 6); // amarelo
	BCF         LATD+0, 6 
;semaforo.c,86 :: 		clr_bit(LATD, 7); // vermelho
	BCF         LATD+0, 7 
;semaforo.c,88 :: 		SEMAFORO_fase2();
	CALL        semaforo_SEMAFORO_fase2+0, 0
;semaforo.c,90 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_VERDE_ON))
	MOVLW       semaforo_timer_s+0
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       hi_addr(semaforo_timer_s+0)
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       8
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main9
;semaforo.c,91 :: 		estado = 4;
	MOVLW       4
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main9:
;semaforo.c,93 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,101 :: 		case 4:
L_SEMAFORO_main10:
;semaforo.c,103 :: 		clr_bit(LATD, 5); // verde
	BCF         LATD+0, 5 
;semaforo.c,104 :: 		set_bit(LATD, 6); // amarelo
	BSF         LATD+0, 6 
;semaforo.c,105 :: 		clr_bit(LATD, 7); // vermelho
	BCF         LATD+0, 7 
;semaforo.c,107 :: 		SEMAFORO_fase2();
	CALL        semaforo_SEMAFORO_fase2+0, 0
;semaforo.c,109 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_AMARELO_ON))
	MOVLW       semaforo_timer_s+0
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       hi_addr(semaforo_timer_s+0)
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       3
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main11
;semaforo.c,110 :: 		estado = 5;
	MOVLW       5
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main11:
;semaforo.c,112 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,119 :: 		case 5:
L_SEMAFORO_main12:
;semaforo.c,120 :: 		SEMAFORO_todos_vermelho();
	CALL        semaforo_SEMAFORO_todos_vermelho+0, 0
;semaforo.c,122 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
	MOVLW       semaforo_timer_s+0
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       hi_addr(semaforo_timer_s+0)
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main13
;semaforo.c,123 :: 		estado = 6;
	MOVLW       6
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main13:
;semaforo.c,125 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,132 :: 		case 6:
L_SEMAFORO_main14:
;semaforo.c,134 :: 		set_bit(LATD, 3); // verde
	BSF         LATD+0, 3 
;semaforo.c,135 :: 		clr_bit(LATD, 4); // vermelho
	BCF         LATD+0, 4 
;semaforo.c,137 :: 		SEMAFORO_fase3();
	CALL        semaforo_SEMAFORO_fase3+0, 0
;semaforo.c,139 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_PEDESTRE_VERDE_ON))
	MOVLW       semaforo_timer_s+0
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       hi_addr(semaforo_timer_s+0)
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       5
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main15
;semaforo.c,140 :: 		estado = 7;
	MOVLW       7
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main15:
;semaforo.c,142 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,149 :: 		case 7:
L_SEMAFORO_main16:
;semaforo.c,151 :: 		clr_bit(LATD, 3); // verde
	BCF         LATD+0, 3 
;semaforo.c,153 :: 		if (SOFT_TIMER_delay_ms(&timer_ms, SEMAFORO_TEMPO_PEDESTRE_BLINK_MS))
	MOVLW       semaforo_timer_ms+0
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+0 
	MOVLW       hi_addr(semaforo_timer_ms+0)
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+1 
	MOVLW       244
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+0 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+1 
	CALL        _SOFT_TIMER_delay_ms+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main17
;semaforo.c,154 :: 		tgl_bit(LATD, 4); // vermelho
	BTG         LATD+0, 4 
L_SEMAFORO_main17:
;semaforo.c,156 :: 		SEMAFORO_fase3();
	CALL        semaforo_SEMAFORO_fase3+0, 0
;semaforo.c,158 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_PEDESTRE_ALERTA))
	MOVLW       semaforo_timer_s+0
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       hi_addr(semaforo_timer_s+0)
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       3
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main18
;semaforo.c,159 :: 		estado = 8;
	MOVLW       8
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main18:
;semaforo.c,161 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,168 :: 		case 8:
L_SEMAFORO_main19:
;semaforo.c,169 :: 		SEMAFORO_todos_vermelho();
	CALL        semaforo_SEMAFORO_todos_vermelho+0, 0
;semaforo.c,171 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
	MOVLW       semaforo_timer_s+0
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+0 
	MOVLW       hi_addr(semaforo_timer_s+0)
	MOVWF       FARG_SOFT_TIMER_delay_s_timer+1 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_s_delay_s+1 
	CALL        _SOFT_TIMER_delay_s+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main20
;semaforo.c,172 :: 		estado = 0;
	CLRF        semaforo_estado+0 
L_SEMAFORO_main20:
;semaforo.c,174 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,176 :: 		default:
L_SEMAFORO_main21:
;semaforo.c,177 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,178 :: 		}
L_SEMAFORO_main0:
	MOVF        semaforo_estado+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main2
	MOVF        semaforo_estado+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main4
	MOVF        semaforo_estado+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main6
	MOVF        semaforo_estado+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main8
	MOVF        semaforo_estado+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main10
	MOVF        semaforo_estado+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main12
	MOVF        semaforo_estado+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main14
	MOVF        semaforo_estado+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main16
	MOVF        semaforo_estado+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_SEMAFORO_main19
	GOTO        L_SEMAFORO_main21
L_SEMAFORO_main1:
;semaforo.c,179 :: 		}
L_end_SEMAFORO_main:
	RETURN      0
; end of _SEMAFORO_main

semaforo_SEMAFORO_todos_vermelho:

;semaforo.c,181 :: 		static void SEMAFORO_todos_vermelho()
;semaforo.c,184 :: 		clr_bit(LATD, 0); // verde
	BCF         LATD+0, 0 
;semaforo.c,185 :: 		clr_bit(LATD, 1); // amarelo
	BCF         LATD+0, 1 
;semaforo.c,186 :: 		set_bit(LATD, 2); // vermelho
	BSF         LATD+0, 2 
;semaforo.c,189 :: 		clr_bit(LATD, 5); // verde
	BCF         LATD+0, 5 
;semaforo.c,190 :: 		clr_bit(LATD, 6); // amarelo
	BCF         LATD+0, 6 
;semaforo.c,191 :: 		set_bit(LATD, 7); // vermelho
	BSF         LATD+0, 7 
;semaforo.c,194 :: 		clr_bit(LATD, 3); // verde
	BCF         LATD+0, 3 
;semaforo.c,195 :: 		set_bit(LATD, 4); // vermelho
	BSF         LATD+0, 4 
;semaforo.c,196 :: 		}
L_end_SEMAFORO_todos_vermelho:
	RETURN      0
; end of semaforo_SEMAFORO_todos_vermelho

semaforo_SEMAFORO_fase1:

;semaforo.c,198 :: 		static void SEMAFORO_fase1()
;semaforo.c,212 :: 		LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 3));
	MOVLW       191
	ANDWF       PORTD+0, 0 
	MOVWF       R0 
	BCF         R0, 5 
	MOVLW       247
	ANDWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,213 :: 		LATD = (PORTD | (1 << 7) | (1 << 4));
	MOVLW       128
	IORWF       PORTD+0, 0 
	MOVWF       R0 
	MOVLW       16
	IORWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,214 :: 		}
L_end_SEMAFORO_fase1:
	RETURN      0
; end of semaforo_SEMAFORO_fase1

semaforo_SEMAFORO_fase2:

;semaforo.c,216 :: 		static void SEMAFORO_fase2()
;semaforo.c,230 :: 		LATD = (PORTD & ~(1 << 0) & ~(1 << 1) & ~(1 << 3));
	MOVLW       254
	ANDWF       PORTD+0, 0 
	MOVWF       R0 
	BCF         R0, 1 
	MOVLW       247
	ANDWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,231 :: 		LATD = (PORTD | (1 << 2) | (1 << 4));
	MOVLW       4
	IORWF       PORTD+0, 0 
	MOVWF       R0 
	MOVLW       16
	IORWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,232 :: 		}
L_end_SEMAFORO_fase2:
	RETURN      0
; end of semaforo_SEMAFORO_fase2

semaforo_SEMAFORO_fase3:

;semaforo.c,234 :: 		static void SEMAFORO_fase3()
;semaforo.c,249 :: 		LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 1) & ~(1 << 0));
	MOVLW       191
	ANDWF       PORTD+0, 0 
	MOVWF       R0 
	BCF         R0, 5 
	BCF         R0, 1 
	MOVLW       254
	ANDWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,250 :: 		LATD = (PORTD | (1 << 7) | (1 << 2));
	MOVLW       128
	IORWF       PORTD+0, 0 
	MOVWF       R0 
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,251 :: 		}
L_end_SEMAFORO_fase3:
	RETURN      0
; end of semaforo_SEMAFORO_fase3
