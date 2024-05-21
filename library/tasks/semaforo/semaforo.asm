
_SEMAFORO_main:

;semaforo.c,20 :: 		void SEMAFORO_main()
;semaforo.c,22 :: 		MODO_FUNCIONAMENTO_T = TASK_SEMAFORO;
	MOVLW       3
	MOVWF       _writeBuffer+6 
;semaforo.c,24 :: 		switch (estado)
	GOTO        L_SEMAFORO_main0
;semaforo.c,31 :: 		case 0:
L_SEMAFORO_main2:
;semaforo.c,32 :: 		set_bit(LATD, 0); // verde
	BSF         LATD+0, 0 
;semaforo.c,33 :: 		clr_bit(LATD, 1); // amarelo
	BCF         LATD+0, 1 
;semaforo.c,34 :: 		clr_bit(LATD, 2); // vermelho
	BCF         LATD+0, 2 
;semaforo.c,36 :: 		SEMAFORO_Fase1();
	CALL        semaforo_SEMAFORO_fase1+0, 0
;semaforo.c,38 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_VERDE_ON))
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
;semaforo.c,39 :: 		estado = 1;
	MOVLW       1
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main3:
;semaforo.c,41 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,48 :: 		case 1:
L_SEMAFORO_main4:
;semaforo.c,50 :: 		clr_bit(LATD, 0); // verde
	BCF         LATD+0, 0 
;semaforo.c,51 :: 		set_bit(LATD, 1); // amarelo
	BSF         LATD+0, 1 
;semaforo.c,52 :: 		clr_bit(LATD, 2); // vermelho
	BCF         LATD+0, 2 
;semaforo.c,54 :: 		SEMAFORO_fase1();
	CALL        semaforo_SEMAFORO_fase1+0, 0
;semaforo.c,56 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_AMARELO_ON))
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
;semaforo.c,57 :: 		estado = 2;
	MOVLW       2
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main5:
;semaforo.c,59 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,66 :: 		case 2:
L_SEMAFORO_main6:
;semaforo.c,67 :: 		SEMAFORO_todos_vermelho();
	CALL        semaforo_SEMAFORO_todos_vermelho+0, 0
;semaforo.c,69 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
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
;semaforo.c,70 :: 		estado = 3;
	MOVLW       3
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main7:
;semaforo.c,72 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,79 :: 		case 3:
L_SEMAFORO_main8:
;semaforo.c,81 :: 		set_bit(LATD, 5); // verde
	BSF         LATD+0, 5 
;semaforo.c,82 :: 		clr_bit(LATD, 6); // amarelo
	BCF         LATD+0, 6 
;semaforo.c,83 :: 		clr_bit(LATD, 7); // vermelho
	BCF         LATD+0, 7 
;semaforo.c,85 :: 		SEMAFORO_fase2();
	CALL        semaforo_SEMAFORO_fase2+0, 0
;semaforo.c,87 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_VERDE_ON))
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
;semaforo.c,88 :: 		estado = 4;
	MOVLW       4
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main9:
;semaforo.c,90 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,98 :: 		case 4:
L_SEMAFORO_main10:
;semaforo.c,100 :: 		clr_bit(LATD, 5); // verde
	BCF         LATD+0, 5 
;semaforo.c,101 :: 		set_bit(LATD, 6); // amarelo
	BSF         LATD+0, 6 
;semaforo.c,102 :: 		clr_bit(LATD, 7); // vermelho
	BCF         LATD+0, 7 
;semaforo.c,104 :: 		SEMAFORO_fase2();
	CALL        semaforo_SEMAFORO_fase2+0, 0
;semaforo.c,106 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_AUTOMOVEL_AMARELO_ON))
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
;semaforo.c,107 :: 		estado = 5;
	MOVLW       5
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main11:
;semaforo.c,109 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,116 :: 		case 5:
L_SEMAFORO_main12:
;semaforo.c,117 :: 		SEMAFORO_todos_vermelho();
	CALL        semaforo_SEMAFORO_todos_vermelho+0, 0
;semaforo.c,119 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
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
;semaforo.c,120 :: 		estado = 6;
	MOVLW       6
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main13:
;semaforo.c,122 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,129 :: 		case 6:
L_SEMAFORO_main14:
;semaforo.c,131 :: 		set_bit(LATD, 3); // verde
	BSF         LATD+0, 3 
;semaforo.c,132 :: 		clr_bit(LATD, 4); // vermelho
	BCF         LATD+0, 4 
;semaforo.c,134 :: 		SEMAFORO_fase3();
	CALL        semaforo_SEMAFORO_fase3+0, 0
;semaforo.c,136 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_PEDESTRE_VERDE_ON))
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
;semaforo.c,137 :: 		estado = 7;
	MOVLW       7
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main15:
;semaforo.c,139 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,146 :: 		case 7:
L_SEMAFORO_main16:
;semaforo.c,148 :: 		clr_bit(LATD, 3); // verde
	BCF         LATD+0, 3 
;semaforo.c,150 :: 		if (SOFT_TIMER_delay_ms(&timer_ms, SEMAFORO_TEMPO_PEDESTRE_BLINK_MS))
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
;semaforo.c,151 :: 		tgl_bit(LATD, 4); // vermelho
	BTG         LATD+0, 4 
L_SEMAFORO_main17:
;semaforo.c,153 :: 		SEMAFORO_fase3();
	CALL        semaforo_SEMAFORO_fase3+0, 0
;semaforo.c,155 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_PEDESTRE_ALERTA))
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
;semaforo.c,156 :: 		estado = 8;
	MOVLW       8
	MOVWF       semaforo_estado+0 
L_SEMAFORO_main18:
;semaforo.c,158 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,165 :: 		case 8:
L_SEMAFORO_main19:
;semaforo.c,166 :: 		SEMAFORO_todos_vermelho();
	CALL        semaforo_SEMAFORO_todos_vermelho+0, 0
;semaforo.c,168 :: 		if (SOFT_TIMER_delay_s(&timer_s, SEMAFORO_TEMPO_TODOS_VERMELHO))
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
;semaforo.c,169 :: 		estado = 0;
	CLRF        semaforo_estado+0 
L_SEMAFORO_main20:
;semaforo.c,171 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,173 :: 		default:
L_SEMAFORO_main21:
;semaforo.c,174 :: 		break;
	GOTO        L_SEMAFORO_main1
;semaforo.c,175 :: 		}
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
;semaforo.c,176 :: 		}
L_end_SEMAFORO_main:
	RETURN      0
; end of _SEMAFORO_main

semaforo_SEMAFORO_todos_vermelho:

;semaforo.c,178 :: 		static void SEMAFORO_todos_vermelho()
;semaforo.c,181 :: 		clr_bit(LATD, 0); // verde
	BCF         LATD+0, 0 
;semaforo.c,182 :: 		clr_bit(LATD, 1); // amarelo
	BCF         LATD+0, 1 
;semaforo.c,183 :: 		set_bit(LATD, 2); // vermelho
	BSF         LATD+0, 2 
;semaforo.c,186 :: 		clr_bit(LATD, 5); // verde
	BCF         LATD+0, 5 
;semaforo.c,187 :: 		clr_bit(LATD, 6); // amarelo
	BCF         LATD+0, 6 
;semaforo.c,188 :: 		set_bit(LATD, 7); // vermelho
	BSF         LATD+0, 7 
;semaforo.c,191 :: 		clr_bit(LATD, 3); // verde
	BCF         LATD+0, 3 
;semaforo.c,192 :: 		set_bit(LATD, 4); // vermelho
	BSF         LATD+0, 4 
;semaforo.c,193 :: 		}
L_end_SEMAFORO_todos_vermelho:
	RETURN      0
; end of semaforo_SEMAFORO_todos_vermelho

semaforo_SEMAFORO_fase1:

;semaforo.c,195 :: 		static void SEMAFORO_fase1()
;semaforo.c,209 :: 		LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 3));
	MOVLW       191
	ANDWF       PORTD+0, 0 
	MOVWF       R0 
	BCF         R0, 5 
	MOVLW       247
	ANDWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,210 :: 		LATD = (PORTD | (1 << 7) | (1 << 4));
	MOVLW       128
	IORWF       PORTD+0, 0 
	MOVWF       R0 
	MOVLW       16
	IORWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,211 :: 		}
L_end_SEMAFORO_fase1:
	RETURN      0
; end of semaforo_SEMAFORO_fase1

semaforo_SEMAFORO_fase2:

;semaforo.c,213 :: 		static void SEMAFORO_fase2()
;semaforo.c,227 :: 		LATD = (PORTD & ~(1 << 0) & ~(1 << 1) & ~(1 << 3));
	MOVLW       254
	ANDWF       PORTD+0, 0 
	MOVWF       R0 
	BCF         R0, 1 
	MOVLW       247
	ANDWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,228 :: 		LATD = (PORTD | (1 << 2) | (1 << 4));
	MOVLW       4
	IORWF       PORTD+0, 0 
	MOVWF       R0 
	MOVLW       16
	IORWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,229 :: 		}
L_end_SEMAFORO_fase2:
	RETURN      0
; end of semaforo_SEMAFORO_fase2

semaforo_SEMAFORO_fase3:

;semaforo.c,231 :: 		static void SEMAFORO_fase3()
;semaforo.c,246 :: 		LATD = (PORTD & ~(1 << 6) & ~(1 << 5) & ~(1 << 1) & ~(1 << 0));
	MOVLW       191
	ANDWF       PORTD+0, 0 
	MOVWF       R0 
	BCF         R0, 5 
	BCF         R0, 1 
	MOVLW       254
	ANDWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,247 :: 		LATD = (PORTD | (1 << 7) | (1 << 2));
	MOVLW       128
	IORWF       PORTD+0, 0 
	MOVWF       R0 
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       LATD+0 
;semaforo.c,248 :: 		}
L_end_SEMAFORO_fase3:
	RETURN      0
; end of semaforo_SEMAFORO_fase3
