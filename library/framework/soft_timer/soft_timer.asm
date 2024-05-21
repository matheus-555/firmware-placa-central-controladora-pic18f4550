
_SOFT_TIMER_init:

;soft_timer.c,10 :: 		void SOFT_TIMER_init(SOFT_TIMER_t *timer)
;soft_timer.c,12 :: 		timer->temp_mili_segundos = 0;
	MOVLW       2
	ADDWF       FARG_SOFT_TIMER_init_timer+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_SOFT_TIMER_init_timer+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;soft_timer.c,13 :: 		timer->temp_segundos = 0;
	MOVFF       FARG_SOFT_TIMER_init_timer+0, FSR1L+0
	MOVFF       FARG_SOFT_TIMER_init_timer+1, FSR1H+0
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;soft_timer.c,14 :: 		}
L_end_SOFT_TIMER_init:
	RETURN      0
; end of _SOFT_TIMER_init

_SOFT_TIMER_delay_ms:

;soft_timer.c,16 :: 		bool SOFT_TIMER_delay_ms(SOFT_TIMER_t *timer, unsigned delay_ms)
;soft_timer.c,18 :: 		if (++(timer->temp_mili_segundos) >= delay_ms)
	MOVLW       2
	ADDWF       FARG_SOFT_TIMER_delay_ms_timer+0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      FARG_SOFT_TIMER_delay_ms_timer+1, 0 
	MOVWF       R4 
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVLW       1
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R3, FSR1L+0
	MOVFF       R4, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        FARG_SOFT_TIMER_delay_ms_delay_ms+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SOFT_TIMER_delay_ms5
	MOVF        FARG_SOFT_TIMER_delay_ms_delay_ms+0, 0 
	SUBWF       R1, 0 
L__SOFT_TIMER_delay_ms5:
	BTFSS       STATUS+0, 0 
	GOTO        L_SOFT_TIMER_delay_ms0
;soft_timer.c,20 :: 		timer->temp_mili_segundos = 0;
	MOVLW       2
	ADDWF       FARG_SOFT_TIMER_delay_ms_timer+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_SOFT_TIMER_delay_ms_timer+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;soft_timer.c,21 :: 		return true;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_SOFT_TIMER_delay_ms
;soft_timer.c,22 :: 		}
L_SOFT_TIMER_delay_ms0:
;soft_timer.c,23 :: 		return false;
	CLRF        R0 
;soft_timer.c,24 :: 		}
L_end_SOFT_TIMER_delay_ms:
	RETURN      0
; end of _SOFT_TIMER_delay_ms

_SOFT_TIMER_delay_s:

;soft_timer.c,26 :: 		bool SOFT_TIMER_delay_s(SOFT_TIMER_t *timer, unsigned delay_s)
;soft_timer.c,30 :: 		if (++aux_temp_ms >= SOFT_TIMER_TEMPO_1S)
	INFSNZ      SOFT_TIMER_delay_s_aux_temp_ms_L0+0, 1 
	INCF        SOFT_TIMER_delay_s_aux_temp_ms_L0+1, 1 
	MOVLW       3
	SUBWF       SOFT_TIMER_delay_s_aux_temp_ms_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SOFT_TIMER_delay_s7
	MOVLW       232
	SUBWF       SOFT_TIMER_delay_s_aux_temp_ms_L0+0, 0 
L__SOFT_TIMER_delay_s7:
	BTFSS       STATUS+0, 0 
	GOTO        L_SOFT_TIMER_delay_s1
;soft_timer.c,32 :: 		aux_temp_ms = 0;
	CLRF        SOFT_TIMER_delay_s_aux_temp_ms_L0+0 
	CLRF        SOFT_TIMER_delay_s_aux_temp_ms_L0+1 
;soft_timer.c,34 :: 		if (++(timer->temp_segundos) >= delay_s)
	MOVF        FARG_SOFT_TIMER_delay_s_timer+0, 0 
	MOVWF       R3 
	MOVF        FARG_SOFT_TIMER_delay_s_timer+1, 0 
	MOVWF       R4 
	MOVFF       FARG_SOFT_TIMER_delay_s_timer+0, FSR0L+0
	MOVFF       FARG_SOFT_TIMER_delay_s_timer+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	INFSNZ      R0, 1 
	INCF        R1, 1 
	MOVFF       FARG_SOFT_TIMER_delay_s_timer+0, FSR1L+0
	MOVFF       FARG_SOFT_TIMER_delay_s_timer+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R3, FSR0L+0
	MOVFF       R4, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        FARG_SOFT_TIMER_delay_s_delay_s+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SOFT_TIMER_delay_s8
	MOVF        FARG_SOFT_TIMER_delay_s_delay_s+0, 0 
	SUBWF       R1, 0 
L__SOFT_TIMER_delay_s8:
	BTFSS       STATUS+0, 0 
	GOTO        L_SOFT_TIMER_delay_s2
;soft_timer.c,36 :: 		timer->temp_segundos = 0;
	MOVFF       FARG_SOFT_TIMER_delay_s_timer+0, FSR1L+0
	MOVFF       FARG_SOFT_TIMER_delay_s_timer+1, FSR1H+0
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;soft_timer.c,37 :: 		return true;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_SOFT_TIMER_delay_s
;soft_timer.c,38 :: 		}
L_SOFT_TIMER_delay_s2:
;soft_timer.c,39 :: 		}
L_SOFT_TIMER_delay_s1:
;soft_timer.c,41 :: 		return false;
	CLRF        R0 
;soft_timer.c,42 :: 		}
L_end_SOFT_TIMER_delay_s:
	RETURN      0
; end of _SOFT_TIMER_delay_s

_SOFT_TIMER_reset:

;soft_timer.c,44 :: 		void SOFT_TIMER_reset(SOFT_TIMER_t *timer)
;soft_timer.c,46 :: 		SOFT_TIMER_init(timer);
	MOVF        FARG_SOFT_TIMER_reset_timer+0, 0 
	MOVWF       FARG_SOFT_TIMER_init_timer+0 
	MOVF        FARG_SOFT_TIMER_reset_timer+1, 0 
	MOVWF       FARG_SOFT_TIMER_init_timer+1 
	CALL        _SOFT_TIMER_init+0, 0
;soft_timer.c,47 :: 		}
L_end_SOFT_TIMER_reset:
	RETURN      0
; end of _SOFT_TIMER_reset
