
_SEMAFORO_init:

;semaforo.c,20 :: 		void SEMAFORO_init()
;semaforo.c,23 :: 		}
L_end_SEMAFORO_init:
	RETURN      0
; end of _SEMAFORO_init

_SEMAFORO_main:

;semaforo.c,25 :: 		void SEMAFORO_main()
;semaforo.c,27 :: 		MODO_FUNCIONAMENTO_T = TASK_SEMAFORO;
	MOVLW       3
	MOVWF       _writeBuffer+6 
;semaforo.c,29 :: 		switch (estado)
	GOTO        L_SEMAFORO_main0
;semaforo.c,36 :: 		case 0:
L_SEMAFORO_main2:
;semaforo.c,37 :: 		set_bit(LATD, 0); // verde
	BSF         LATD+0, 0 
;semaforo.c,38 :: 		clr_bit(LATD, 1); // amarelo
	BCF         LATD+0, 1 
;semaforo.c,39 :: 		clr_bit(LATD, 2); // vermelho
	BCF         LATD+0, 2 
;semaforo.c,41 :: 		SEMAFORO_Fase1();
	CALL        semaforo_SEMAFORO_fase1+0, 0
;semaforo.c,43 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_VERDE_ON))
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
;semaforo.c,44 :: 		estado = 1;
	MOVLW       1
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main3:
;semaforo.c,46 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,53 :: 		case 1:
L_SEMAFORO_main4:
;semaforo.c,55 :: 		clr_bit(LATD, 0); // verde
	BCF         LATD+0, 0 
;semaforo.c,56 :: 		set_bit(LATD, 1); // amarelo
	BSF         LATD+0, 1 
;semaforo.c,57 :: 		clr_bit(LATD, 2); // vermelho
	BCF         LATD+0, 2 
;semaforo.c,59 :: 		SEMAFORO_fase1();
	CALL        semaforo_SEMAFORO_fase1+0, 0
;semaforo.c,61 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_AMARELO_ON))
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
;semaforo.c,62 :: 		estado = 2;
	MOVLW       2
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main5:
;semaforo.c,64 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,71 :: 		case 2:
L_SEMAFORO_main6:
;semaforo.c,72 :: 		SEMAFORO_todos_vermelho();
	CALL        semaforo_SEMAFORO_todos_vermelho+0, 0
;semaforo.c,74 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
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
;semaforo.c,75 :: 		estado = 3;
	MOVLW       3
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main7:
;semaforo.c,77 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,84 :: 		case 3:
L_SEMAFORO_main8:
;semaforo.c,86 :: 		set_bit(LATD, 5); // verde
	BSF         LATD+0, 5 
;semaforo.c,87 :: 		clr_bit(LATD, 6); // amarelo
	BCF         LATD+0, 6 
;semaforo.c,88 :: 		clr_bit(LATD, 7); // vermelho
	BCF         LATD+0, 7 
;semaforo.c,90 :: 		SEMAFORO_fase2();
	CALL        semaforo_SEMAFORO_fase2+0, 0
;semaforo.c,92 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_VERDE_ON))
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
;semaforo.c,93 :: 		estado = 4;
	MOVLW       4
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main9:
;semaforo.c,95 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,103 :: 		case 4:
L_SEMAFORO_main10:
;semaforo.c,105 :: 		clr_bit(LATD, 5); // verde
	BCF         LATD+0, 5 
;semaforo.c,106 :: 		set_bit(LATD, 6); // amarelo
	BSF         LATD+0, 6 
;semaforo.c,107 :: 		clr_bit(LATD, 7); // vermelho
	BCF         LATD+0, 7 
;semaforo.c,109 :: 		SEMAFORO_fase2();
	CALL        semaforo_SEMAFORO_fase2+0, 0
;semaforo.c,111 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_AMARELO_ON))
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
;semaforo.c,112 :: 		estado = 5;
	MOVLW       5
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main11:
;semaforo.c,114 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,121 :: 		case 5:
L_SEMAFORO_main12:
;semaforo.c,122 :: 		SEMAFORO_todos_vermelho();
	CALL        semaforo_SEMAFORO_todos_vermelho+0, 0
;semaforo.c,124 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
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
;semaforo.c,125 :: 		estado = 6;
	MOVLW       6
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main13:
;semaforo.c,127 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,134 :: 		case 6:
L_SEMAFORO_main14:
;semaforo.c,136 :: 		set_bit(LATD, 3); // verde
	BSF         LATD+0, 3 
;semaforo.c,137 :: 		clr_bit(LATD, 4); // vermelho
	BCF         LATD+0, 4 
;semaforo.c,139 :: 		SEMAFORO_fase3();
	CALL        semaforo_SEMAFORO_fase3+0, 0
;semaforo.c,141 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_PEDESTRE_VERDE_ON))
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
;semaforo.c,142 :: 		estado = 7;
	MOVLW       7
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main15:
;semaforo.c,144 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,151 :: 		case 7:
L_SEMAFORO_main16:
;semaforo.c,153 :: 		clr_bit(LATD, 3); // verde
	BCF         LATD+0, 3 
;semaforo.c,155 :: 		if (SOFT_TIMER_delay_ms(&timer_ms, SEMAFORO_TEMPO_PEDESTRE_BLINK_MS))
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
;semaforo.c,156 :: 		tgl_bit(LATD, 4); // vermelho
	BTG         LATD+0, 4 
L_SEMAFORO_main17:
;semaforo.c,158 :: 		SEMAFORO_fase3();
	CALL        semaforo_SEMAFORO_fase3+0, 0
;semaforo.c,160 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_PEDESTRE_ALERTA))
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
;semaforo.c,161 :: 		estado = 8;
	MOVLW       8
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main18:
;semaforo.c,163 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,170 :: 		case 8:
L_SEMAFORO_main19:
;semaforo.c,171 :: 		SEMAFORO_todos_vermelho();
	CALL        semaforo_SEMAFORO_todos_vermelho+0, 0
;semaforo.c,173 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
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
;semaforo.c,174 :: 		estado = 0;
	CLRF        semaforo_estado+0 
L_SEMAFORO_main20:
;semaforo.c,176 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,178 :: 		default:
L_SEMAFORO_main21:
;semaforo.c,179 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,180 :: 		}
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
;semaforo.c,181 :: 		}
L_end_SEMAFORO_main:
	RETURN      0
; end of _SEMAFORO_main

semaforo_SEMAFORO_todos_vermelho:

;semaforo.c,183 :: 		static void SEMAFORO_todos_vermelho()
;semaforo.c,186 :: 		clr_bit(LATD, 0); // verde
	BCF         LATD+0, 0 
;semaforo.c,187 :: 		clr_bit(LATD, 1); // amarelo
	BCF         LATD+0, 1 
;semaforo.c,188 :: 		set_bit(LATD, 2); // vermelho
	BSF         LATD+0, 2 
;semaforo.c,191 :: 		clr_bit(LATD, 5); // verde
	BCF         LATD+0, 5 
;semaforo.c,192 :: 		clr_bit(LATD, 6); // amarelo
	BCF         LATD+0, 6 
;semaforo.c,193 :: 		set_bit(LATD, 7); // vermelho
	BSF         LATD+0, 7 
;semaforo.c,196 :: 		clr_bit(LATD, 3); // verde
	BCF         LATD+0, 3 
;semaforo.c,197 :: 		set_bit(LATD, 4); // vermelho
	BSF         LATD+0, 4 
;semaforo.c,198 :: 		}
L_end_SEMAFORO_todos_vermelho:
	RETURN      0
; end of semaforo_SEMAFORO_todos_vermelho

semaforo_SEMAFORO_fase1:

;semaforo.c,200 :: 		static void SEMAFORO_fase1()
;semaforo.c,214 :: 		LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 3));
	MOVLW       191
	ANDWF       PORTD+0, 0 
	MOVWF       R0 
	BCF         R0, 5 
	MOVLW       247
	ANDWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,215 :: 		LATD = (PORTD | (1 << 7) | (1 << 4));
	MOVLW       128
	IORWF       PORTD+0, 0 
	MOVWF       R0 
	MOVLW       16
	IORWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,216 :: 		}
L_end_SEMAFORO_fase1:
	RETURN      0
; end of semaforo_SEMAFORO_fase1

semaforo_SEMAFORO_fase2:

;semaforo.c,218 :: 		static void SEMAFORO_fase2()
;semaforo.c,232 :: 		LATD = (PORTD & ~(1 << 0) & ~(1 << 1) & ~(1 << 3));
	MOVLW       254
	ANDWF       PORTD+0, 0 
	MOVWF       R0 
	BCF         R0, 1 
	MOVLW       247
	ANDWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,233 :: 		LATD = (PORTD | (1 << 2) | (1 << 4));
	MOVLW       4
	IORWF       PORTD+0, 0 
	MOVWF       R0 
	MOVLW       16
	IORWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,234 :: 		}
L_end_SEMAFORO_fase2:
	RETURN      0
; end of semaforo_SEMAFORO_fase2

semaforo_SEMAFORO_fase3:

;semaforo.c,236 :: 		static void SEMAFORO_fase3()
;semaforo.c,251 :: 		LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 1) & ~(1 << 0));
	MOVLW       191
	ANDWF       PORTD+0, 0 
	MOVWF       R0 
	BCF         R0, 5 
	BCF         R0, 1 
	MOVLW       254
	ANDWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,252 :: 		LATD = (PORTD | (1 << 7) | (1 << 2));
	MOVLW       128
	IORWF       PORTD+0, 0 
	MOVWF       R0 
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,253 :: 		}
L_end_SEMAFORO_fase3:
	RETURN      0
; end of semaforo_SEMAFORO_fase3
