
_TIMER0_init:

;timer0.c,26 :: 		void TIMER0_init(Timer0_t *timer, double tempo_desejado)
;timer0.c,29 :: 		bool *ptr = &timer->is_finalizado[0];
	MOVF        FARG_TIMER0_init_timer+0, 0 
	MOVWF       TIMER0_init_ptr_L0+0 
	MOVF        FARG_TIMER0_init_timer+1, 0 
	MOVWF       TIMER0_init_ptr_L0+1 
;timer0.c,31 :: 		for (i = 0; i < TIMER0_LENGTH; ++i)
	CLRF        TIMER0_init_i_L0+0 
	CLRF        TIMER0_init_i_L0+1 
L_TIMER0_init0:
	MOVLW       128
	XORWF       TIMER0_init_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TIMER0_init10
	MOVLW       4
	SUBWF       TIMER0_init_i_L0+0, 0 
L__TIMER0_init10:
	BTFSC       STATUS+0, 0 
	GOTO        L_TIMER0_init1
;timer0.c,32 :: 		*ptr++ = false;
	MOVFF       TIMER0_init_ptr_L0+0, FSR1L+0
	MOVFF       TIMER0_init_ptr_L0+1, FSR1H+0
	CLRF        POSTINC1+0 
	INFSNZ      TIMER0_init_ptr_L0+0, 1 
	INCF        TIMER0_init_ptr_L0+1, 1 
;timer0.c,31 :: 		for (i = 0; i < TIMER0_LENGTH; ++i)
	INFSNZ      TIMER0_init_i_L0+0, 1 
	INCF        TIMER0_init_i_L0+1, 1 
;timer0.c,32 :: 		*ptr++ = false;
	GOTO        L_TIMER0_init0
L_TIMER0_init1:
;timer0.c,36 :: 		clr_bit(T0CON, TMR0ON);
	BCF         T0CON+0, 7 
;timer0.c,37 :: 		set_bit(T0CON, T08BIT);
	BSF         T0CON+0, 6 
;timer0.c,38 :: 		clr_bit(T0CON, T0CS);
	BCF         T0CON+0, 5 
;timer0.c,39 :: 		clr_bit(T0CON, T0SE);
	BCF         T0CON+0, 4 
;timer0.c,40 :: 		clr_bit(T0CON, PSA);
	BCF         T0CON+0, 3 
;timer0.c,41 :: 		set_bit(T0CON, T0PS2);
	BSF         T0CON+0, 2 
;timer0.c,42 :: 		clr_bit(T0CON, T0PS1);
	BCF         T0CON+0, 1 
;timer0.c,43 :: 		set_bit(T0CON, T0PS0);
	BSF         T0CON+0, 0 
;timer0.c,46 :: 		tmr0_value = TIMER0_VALOR_DESEJADO_SECONDS(tempo_desejado);
	MOVF        FARG_TIMER0_init_tempo_desejado+0, 0 
	MOVWF       R0 
	MOVF        FARG_TIMER0_init_tempo_desejado+1, 0 
	MOVWF       R1 
	MOVF        FARG_TIMER0_init_tempo_desejado+2, 0 
	MOVWF       R2 
	MOVF        FARG_TIMER0_init_tempo_desejado+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       27
	MOVWF       R5 
	MOVLW       55
	MOVWF       R6 
	MOVLW       150
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       135
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       timer0_tmr0_value+0 
;timer0.c,47 :: 		}
L_end_TIMER0_init:
	RETURN      0
; end of _TIMER0_init

_TIMER0_start:

;timer0.c,49 :: 		void TIMER0_start(bool isStart)
;timer0.c,52 :: 		if (isStart)
	MOVF        FARG_TIMER0_start_isStart+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_TIMER0_start3
;timer0.c,54 :: 		set_bit(INTCON, TMR0IE);
	BSF         INTCON+0, 5 
;timer0.c,55 :: 		set_bit(T0CON, TMR0ON);
	BSF         T0CON+0, 7 
;timer0.c,56 :: 		}
	GOTO        L_TIMER0_start4
L_TIMER0_start3:
;timer0.c,59 :: 		clr_bit(INTCON, TMR0IE);
	BCF         INTCON+0, 5 
;timer0.c,60 :: 		clr_bit(T0CON, TMR0ON);
	BCF         T0CON+0, 7 
;timer0.c,61 :: 		}
L_TIMER0_start4:
;timer0.c,62 :: 		}
L_end_TIMER0_start:
	RETURN      0
; end of _TIMER0_start

_TIMER0_ISR:

;timer0.c,64 :: 		void TIMER0_ISR(Timer0_t *timer)
;timer0.c,69 :: 		for (i = 0, ptr = &tmr0_ticks[0]; i < TIMER0_LENGTH; ++i, ++ptr)
	CLRF        R7 
	CLRF        R8 
	MOVLW       timer0_tmr0_ticks+0
	MOVWF       R9 
	MOVLW       hi_addr(timer0_tmr0_ticks+0)
	MOVWF       R10 
L_TIMER0_ISR5:
	MOVLW       128
	XORWF       R8, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TIMER0_ISR13
	MOVLW       4
	SUBWF       R7, 0 
L__TIMER0_ISR13:
	BTFSC       STATUS+0, 0 
	GOTO        L_TIMER0_ISR6
;timer0.c,71 :: 		*ptr += 1;
	MOVFF       R9, FSR0L+0
	MOVFF       R10, FSR0H+0
	MOVLW       1
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R9, FSR1L+0
	MOVFF       R10, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;timer0.c,73 :: 		if (*ptr >= TIMER0_IS_FINALIZADO[i])
	MOVFF       R9, FSR0L+0
	MOVFF       R10, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        R7, 0 
	MOVWF       R0 
	MOVF        R8, 0 
	MOVWF       R1 
	MOVLW       0
	BTFSC       R8, 7 
	MOVLW       255
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVLW       timer0_TIMER0_IS_FINALIZADO+0
	ADDWF       R0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(timer0_TIMER0_IS_FINALIZADO+0)
	ADDWFC      R1, 0 
	MOVWF       TBLPTR+1 
	MOVLW       higher_addr(timer0_TIMER0_IS_FINALIZADO+0)
	ADDWFC      R2, 0 
	MOVWF       TBLPTR+2 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R2, 0 
	SUBWF       R6, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__TIMER0_ISR14
	MOVF        R1, 0 
	SUBWF       R5, 0 
L__TIMER0_ISR14:
	BTFSS       STATUS+0, 0 
	GOTO        L_TIMER0_ISR8
;timer0.c,75 :: 		timer->is_finalizado[i] = true;
	MOVF        R7, 0 
	ADDWF       FARG_TIMER0_ISR_timer+0, 0 
	MOVWF       FSR1L+0 
	MOVF        R8, 0 
	ADDWFC      FARG_TIMER0_ISR_timer+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       1
	MOVWF       POSTINC1+0 
;timer0.c,76 :: 		*ptr = 0;
	MOVFF       R9, FSR1L+0
	MOVFF       R10, FSR1H+0
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;timer0.c,77 :: 		}
L_TIMER0_ISR8:
;timer0.c,69 :: 		for (i = 0, ptr = &tmr0_ticks[0]; i < TIMER0_LENGTH; ++i, ++ptr)
	INFSNZ      R7, 1 
	INCF        R8, 1 
	MOVLW       2
	ADDWF       R9, 1 
	MOVLW       0
	ADDWFC      R10, 1 
;timer0.c,78 :: 		}
	GOTO        L_TIMER0_ISR5
L_TIMER0_ISR6:
;timer0.c,81 :: 		TMR0L = tmr0_value;
	MOVF        timer0_tmr0_value+0, 0 
	MOVWF       TMR0L+0 
;timer0.c,82 :: 		}
L_end_TIMER0_ISR:
	RETURN      0
; end of _TIMER0_ISR
