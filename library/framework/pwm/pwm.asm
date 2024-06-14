
_PWM_init:

;pwm.c,7 :: 		void PWM_init(uint16_t freq_pwm)
;pwm.c,10 :: 		clr_bit(TRISC, PIN_PWM1);
	BCF         TRISC+0, 1 
;pwm.c,11 :: 		clr_bit(TRISC, PIN_PWM2);
	BCF         TRISC+0, 2 
;pwm.c,13 :: 		PWM_SetFrequency((uint16_t)freq_pwm);
	MOVF        FARG_PWM_init_freq_pwm+0, 0 
	MOVWF       FARG_pwm_PWM_SetFrequency_freq+0 
	MOVF        FARG_PWM_init_freq_pwm+1, 0 
	MOVWF       FARG_pwm_PWM_SetFrequency_freq+1 
	CALL        pwm_PWM_SetFrequency+0, 0
;pwm.c,16 :: 		CCP1CON = 0b00001100;
	MOVLW       12
	MOVWF       CCP1CON+0 
;pwm.c,17 :: 		CCP2CON = 0b00001100;
	MOVLW       12
	MOVWF       CCP2CON+0 
;pwm.c,20 :: 		CCPR1L = 0;
	CLRF        CCPR1L+0 
;pwm.c,21 :: 		CCPR2L = 0;
	CLRF        CCPR2L+0 
;pwm.c,24 :: 		T2CON = 0b0000111;
	MOVLW       7
	MOVWF       T2CON+0 
;pwm.c,25 :: 		}
L_end_PWM_init:
	RETURN      0
; end of _PWM_init

_PWM1_set_duty_cycle:

;pwm.c,27 :: 		void PWM1_set_duty_cycle(uint8_t duty_porcent)
;pwm.c,29 :: 		uint16_t duty = PWM_CONVERT_PORCENT_TO_10_BITS(duty_porcent);
	MOVF        FARG_PWM1_set_duty_cycle_duty_porcent+0, 0 
	MOVWF       R0 
	CALL        _byte2double+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       215
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       PWM1_set_duty_cycle_duty_L0+0 
	MOVF        R1, 0 
	MOVWF       PWM1_set_duty_cycle_duty_L0+1 
;pwm.c,31 :: 		if (duty & 0x1)
	BTFSS       R0, 0 
	GOTO        L_PWM1_set_duty_cycle0
;pwm.c,32 :: 		set_bit(CCP1CON, DC1B0);
	BSF         CCP1CON+0, 4 
	GOTO        L_PWM1_set_duty_cycle1
L_PWM1_set_duty_cycle0:
;pwm.c,34 :: 		clr_bit(CCP1CON, DC1B0);
	BCF         CCP1CON+0, 4 
L_PWM1_set_duty_cycle1:
;pwm.c,36 :: 		if (duty & 0x2)
	BTFSS       PWM1_set_duty_cycle_duty_L0+0, 1 
	GOTO        L_PWM1_set_duty_cycle2
;pwm.c,37 :: 		set_bit(CCP1CON, DC1B1);
	BSF         CCP1CON+0, 5 
	GOTO        L_PWM1_set_duty_cycle3
L_PWM1_set_duty_cycle2:
;pwm.c,39 :: 		clr_bit(CCP1CON, DC1B1);
	BCF         CCP1CON+0, 5 
L_PWM1_set_duty_cycle3:
;pwm.c,41 :: 		CCPR1L = duty>>2;
	MOVF        PWM1_set_duty_cycle_duty_L0+0, 0 
	MOVWF       R0 
	MOVF        PWM1_set_duty_cycle_duty_L0+1, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R0, 0 
	MOVWF       CCPR1L+0 
;pwm.c,42 :: 		}
L_end_PWM1_set_duty_cycle:
	RETURN      0
; end of _PWM1_set_duty_cycle

_PWM2_set_duty_cycle:

;pwm.c,44 :: 		void PWM2_set_duty_cycle(uint8_t duty_porcent)
;pwm.c,46 :: 		uint16_t duty = PWM_CONVERT_PORCENT_TO_10_BITS(duty_porcent);
	MOVF        FARG_PWM2_set_duty_cycle_duty_porcent+0, 0 
	MOVWF       R0 
	CALL        _byte2double+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       215
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       PWM2_set_duty_cycle_duty_L0+0 
	MOVF        R1, 0 
	MOVWF       PWM2_set_duty_cycle_duty_L0+1 
;pwm.c,48 :: 		if (duty & 0x1)
	BTFSS       R0, 0 
	GOTO        L_PWM2_set_duty_cycle4
;pwm.c,49 :: 		set_bit(CCP2CON, DC2B0);
	BSF         CCP2CON+0, 4 
	GOTO        L_PWM2_set_duty_cycle5
L_PWM2_set_duty_cycle4:
;pwm.c,51 :: 		clr_bit(CCP2CON, DC2B0);
	BCF         CCP2CON+0, 4 
L_PWM2_set_duty_cycle5:
;pwm.c,53 :: 		if (duty & 0x2)
	BTFSS       PWM2_set_duty_cycle_duty_L0+0, 1 
	GOTO        L_PWM2_set_duty_cycle6
;pwm.c,54 :: 		set_bit(CCP2CON, DC2B1);
	BSF         CCP2CON+0, 5 
	GOTO        L_PWM2_set_duty_cycle7
L_PWM2_set_duty_cycle6:
;pwm.c,56 :: 		clr_bit(CCP2CON, DC2B1);
	BCF         CCP2CON+0, 5 
L_PWM2_set_duty_cycle7:
;pwm.c,58 :: 		CCPR2L = duty>>2;
	MOVF        PWM2_set_duty_cycle_duty_L0+0, 0 
	MOVWF       R0 
	MOVF        PWM2_set_duty_cycle_duty_L0+1, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R0, 0 
	MOVWF       CCPR2L+0 
;pwm.c,59 :: 		}
L_end_PWM2_set_duty_cycle:
	RETURN      0
; end of _PWM2_set_duty_cycle

pwm_PWM_SetFrequency:

;pwm.c,61 :: 		static void PWM_SetFrequency(uint16_t freq)
;pwm.c,66 :: 		pr2_val = (SYSTEM_FOSC / (4UL * freq)) - 1;
	MOVF        FARG_pwm_PWM_SetFrequency_freq+0, 0 
	MOVWF       R4 
	MOVF        FARG_pwm_PWM_SetFrequency_freq+1, 0 
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R6, 1 
	RLCF        R7, 1 
	RLCF        R4, 1 
	BCF         R4, 0 
	RLCF        R5, 1 
	RLCF        R6, 1 
	RLCF        R7, 1 
	MOVLW       0
	MOVWF       R0 
	MOVLW       108
	MOVWF       R1 
	MOVLW       220
	MOVWF       R2 
	MOVLW       2
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       1
	SUBWF       R4, 1 
	MOVLW       0
	SUBWFB      R5, 1 
	SUBWFB      R6, 1 
	SUBWFB      R7, 1 
	MOVF        R4, 0 
	MOVWF       pwm_PWM_SetFrequency_pr2_val_L0+0 
	MOVF        R5, 0 
	MOVWF       pwm_PWM_SetFrequency_pr2_val_L0+1 
	MOVF        R6, 0 
	MOVWF       pwm_PWM_SetFrequency_pr2_val_L0+2 
	MOVF        R7, 0 
	MOVWF       pwm_PWM_SetFrequency_pr2_val_L0+3 
;pwm.c,69 :: 		PR2 = pr2_val > 255 ? 255 : pr2_val;
	MOVF        R7, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_pwm_PWM_SetFrequency14
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_pwm_PWM_SetFrequency14
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_pwm_PWM_SetFrequency14
	MOVF        R4, 0 
	SUBLW       255
L_pwm_PWM_SetFrequency14:
	BTFSC       STATUS+0, 0 
	GOTO        L_pwm_PWM_SetFrequency8
	MOVLW       255
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT33+0 
	MOVLW       0
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT33+1 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT33+2 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT33+3 
	GOTO        L_pwm_PWM_SetFrequency9
L_pwm_PWM_SetFrequency8:
	MOVF        pwm_PWM_SetFrequency_pr2_val_L0+0, 0 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT33+0 
	MOVF        pwm_PWM_SetFrequency_pr2_val_L0+1, 0 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT33+1 
	MOVF        pwm_PWM_SetFrequency_pr2_val_L0+2, 0 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT33+2 
	MOVF        pwm_PWM_SetFrequency_pr2_val_L0+3, 0 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT33+3 
L_pwm_PWM_SetFrequency9:
	MOVF        pwm_?FLOC__pwm_PWM_SetFrequencyT33+0, 0 
	MOVWF       PR2+0 
;pwm.c,70 :: 		}
L_end_PWM_SetFrequency:
	RETURN      0
; end of pwm_PWM_SetFrequency
