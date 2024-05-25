
_PWM_init:

;pwm.c,5 :: 		void PWM_init(double freq_pwm)
;pwm.c,8 :: 		clr_bit(TRISC, PIN_PWM1);
	BCF         TRISC+0, 1 
;pwm.c,9 :: 		clr_bit(TRISC, PIN_PWM2);
	BCF         TRISC+0, 2 
;pwm.c,11 :: 		PWM_SetFrequency((unsigned int)freq_pwm);
	MOVF        FARG_PWM_init_freq_pwm+0, 0 
	MOVWF       R0 
	MOVF        FARG_PWM_init_freq_pwm+1, 0 
	MOVWF       R1 
	MOVF        FARG_PWM_init_freq_pwm+2, 0 
	MOVWF       R2 
	MOVF        FARG_PWM_init_freq_pwm+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pwm_PWM_SetFrequency_freq+0 
	MOVF        R1, 0 
	MOVWF       FARG_pwm_PWM_SetFrequency_freq+1 
	CALL        pwm_PWM_SetFrequency+0, 0
;pwm.c,14 :: 		CCP1CON = 0b00001100;
	MOVLW       12
	MOVWF       CCP1CON+0 
;pwm.c,15 :: 		CCP2CON = 0b00001100;
	MOVLW       12
	MOVWF       CCP2CON+0 
;pwm.c,18 :: 		CCPR1L = 0;
	CLRF        CCPR1L+0 
;pwm.c,19 :: 		CCPR2L = 0;
	CLRF        CCPR2L+0 
;pwm.c,22 :: 		T2CON = 0b0000111;
	MOVLW       7
	MOVWF       T2CON+0 
;pwm.c,23 :: 		}
L_end_PWM_init:
	RETURN      0
; end of _PWM_init

_PWM1_set_duty_cycle:

;pwm.c,25 :: 		void PWM1_set_duty_cycle(unsigned char duty_porcent)
;pwm.c,27 :: 		unsigned int duty = ((unsigned int)duty_porcent * (PR2 + 1)) / 100;
	MOVF        FARG_PWM1_set_duty_cycle_duty_porcent+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        PR2+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       PWM1_set_duty_cycle_duty_L0+0 
	MOVF        R1, 0 
	MOVWF       PWM1_set_duty_cycle_duty_L0+1 
;pwm.c,29 :: 		if (duty > 255)
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PWM1_set_duty_cycle14
	MOVF        R0, 0 
	SUBLW       255
L__PWM1_set_duty_cycle14:
	BTFSC       STATUS+0, 0 
	GOTO        L_PWM1_set_duty_cycle0
;pwm.c,30 :: 		duty = 255;
	MOVLW       255
	MOVWF       PWM1_set_duty_cycle_duty_L0+0 
	MOVLW       0
	MOVWF       PWM1_set_duty_cycle_duty_L0+1 
L_PWM1_set_duty_cycle0:
;pwm.c,32 :: 		if (duty & 0x1)
	BTFSS       PWM1_set_duty_cycle_duty_L0+0, 0 
	GOTO        L_PWM1_set_duty_cycle1
;pwm.c,33 :: 		set_bit(CCP1CON, DC1B0);
	BSF         CCP1CON+0, 4 
	GOTO        L_PWM1_set_duty_cycle2
L_PWM1_set_duty_cycle1:
;pwm.c,35 :: 		clr_bit(CCP1CON, DC1B0);
	BCF         CCP1CON+0, 4 
L_PWM1_set_duty_cycle2:
;pwm.c,37 :: 		if (duty & 0x2)
	BTFSS       PWM1_set_duty_cycle_duty_L0+0, 1 
	GOTO        L_PWM1_set_duty_cycle3
;pwm.c,38 :: 		set_bit(CCP1CON, DC1B1);
	BSF         CCP1CON+0, 5 
	GOTO        L_PWM1_set_duty_cycle4
L_PWM1_set_duty_cycle3:
;pwm.c,40 :: 		clr_bit(CCP1CON, DC1B1);
	BCF         CCP1CON+0, 5 
L_PWM1_set_duty_cycle4:
;pwm.c,42 :: 		CCPR1L = duty;
	MOVF        PWM1_set_duty_cycle_duty_L0+0, 0 
	MOVWF       CCPR1L+0 
;pwm.c,43 :: 		}
L_end_PWM1_set_duty_cycle:
	RETURN      0
; end of _PWM1_set_duty_cycle

_PWM2_set_duty_cycle:

;pwm.c,45 :: 		void PWM2_set_duty_cycle(unsigned char duty_porcent)
;pwm.c,47 :: 		unsigned int duty = ((unsigned int)duty_porcent * (PR2 + 1)) / 100;
	MOVF        FARG_PWM2_set_duty_cycle_duty_porcent+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        PR2+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       PWM2_set_duty_cycle_duty_L0+0 
	MOVF        R1, 0 
	MOVWF       PWM2_set_duty_cycle_duty_L0+1 
;pwm.c,49 :: 		if (duty > 255)
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__PWM2_set_duty_cycle16
	MOVF        R0, 0 
	SUBLW       255
L__PWM2_set_duty_cycle16:
	BTFSC       STATUS+0, 0 
	GOTO        L_PWM2_set_duty_cycle5
;pwm.c,50 :: 		duty = 255;
	MOVLW       255
	MOVWF       PWM2_set_duty_cycle_duty_L0+0 
	MOVLW       0
	MOVWF       PWM2_set_duty_cycle_duty_L0+1 
L_PWM2_set_duty_cycle5:
;pwm.c,52 :: 		if (duty & 0x1)
	BTFSS       PWM2_set_duty_cycle_duty_L0+0, 0 
	GOTO        L_PWM2_set_duty_cycle6
;pwm.c,53 :: 		set_bit(CCP2CON, DC2B0);
	BSF         CCP2CON+0, 4 
	GOTO        L_PWM2_set_duty_cycle7
L_PWM2_set_duty_cycle6:
;pwm.c,55 :: 		clr_bit(CCP2CON, DC2B0);
	BCF         CCP2CON+0, 4 
L_PWM2_set_duty_cycle7:
;pwm.c,57 :: 		if (duty & 0x2)
	BTFSS       PWM2_set_duty_cycle_duty_L0+0, 1 
	GOTO        L_PWM2_set_duty_cycle8
;pwm.c,58 :: 		set_bit(CCP2CON, DC2B1);
	BSF         CCP2CON+0, 5 
	GOTO        L_PWM2_set_duty_cycle9
L_PWM2_set_duty_cycle8:
;pwm.c,60 :: 		clr_bit(CCP2CON, DC2B1);
	BCF         CCP2CON+0, 5 
L_PWM2_set_duty_cycle9:
;pwm.c,62 :: 		CCPR2L = duty;
	MOVF        PWM2_set_duty_cycle_duty_L0+0, 0 
	MOVWF       CCPR2L+0 
;pwm.c,63 :: 		}
L_end_PWM2_set_duty_cycle:
	RETURN      0
; end of _PWM2_set_duty_cycle

pwm_PWM_SetFrequency:

;pwm.c,65 :: 		static void PWM_SetFrequency(unsigned int freq)
;pwm.c,70 :: 		pr2_val = (SYSTEM_FOSC_CPU / (4UL * freq)) - 1;
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
;pwm.c,73 :: 		PR2 = pr2_val > 255 ? 255 : pr2_val;
	MOVF        R7, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_pwm_PWM_SetFrequency18
	MOVF        R6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_pwm_PWM_SetFrequency18
	MOVF        R5, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_pwm_PWM_SetFrequency18
	MOVF        R4, 0 
	SUBLW       255
L_pwm_PWM_SetFrequency18:
	BTFSC       STATUS+0, 0 
	GOTO        L_pwm_PWM_SetFrequency10
	MOVLW       255
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT36+0 
	MOVLW       0
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT36+1 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT36+2 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT36+3 
	GOTO        L_pwm_PWM_SetFrequency11
L_pwm_PWM_SetFrequency10:
	MOVF        pwm_PWM_SetFrequency_pr2_val_L0+0, 0 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT36+0 
	MOVF        pwm_PWM_SetFrequency_pr2_val_L0+1, 0 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT36+1 
	MOVF        pwm_PWM_SetFrequency_pr2_val_L0+2, 0 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT36+2 
	MOVF        pwm_PWM_SetFrequency_pr2_val_L0+3, 0 
	MOVWF       pwm_?FLOC__pwm_PWM_SetFrequencyT36+3 
L_pwm_PWM_SetFrequency11:
	MOVF        pwm_?FLOC__pwm_PWM_SetFrequencyT36+0, 0 
	MOVWF       PR2+0 
;pwm.c,74 :: 		}
L_end_PWM_SetFrequency:
	RETURN      0
; end of pwm_PWM_SetFrequency
