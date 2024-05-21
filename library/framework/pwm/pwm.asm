
_PWM_init:

;pwm.c,3 :: 		void PWM_init(double freq_pwm)
;pwm.c,8 :: 		T2CON = 0b00000111;
	MOVLW       7
	MOVWF       T2CON+0 
;pwm.c,10 :: 		ptr2_value = (unsigned char)((SYSTEM_FOSC_CPU / (4 * freq_pwm)) - 1);
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	MOVF        FARG_PWM_init_freq_pwm+0, 0 
	MOVWF       R4 
	MOVF        FARG_PWM_init_freq_pwm+1, 0 
	MOVWF       R5 
	MOVF        FARG_PWM_init_freq_pwm+2, 0 
	MOVWF       R6 
	MOVF        FARG_PWM_init_freq_pwm+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
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
	MOVLW       27
	MOVWF       R1 
	MOVLW       55
	MOVWF       R2 
	MOVLW       152
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       PWM_init_ptr2_value_L0+0 
;pwm.c,12 :: 		if (ptr2_value < 1 || ptr2_value > 255)
	MOVLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__PWM_init3
	MOVF        PWM_init_ptr2_value_L0+0, 0 
	SUBLW       255
	BTFSS       STATUS+0, 0 
	GOTO        L__PWM_init3
	GOTO        L_PWM_init2
L__PWM_init3:
;pwm.c,13 :: 		return;
	GOTO        L_end_PWM_init
L_PWM_init2:
;pwm.c,15 :: 		PR2 = ptr2_value;
	MOVF        PWM_init_ptr2_value_L0+0, 0 
	MOVWF       PR2+0 
;pwm.c,18 :: 		clr_bit(TRISC, PIN_PWM);
	BCF         TRISC+0, 2 
;pwm.c,21 :: 		CCP1CON = 0b00001100;
	MOVLW       12
	MOVWF       CCP1CON+0 
;pwm.c,24 :: 		CCPR1L  = 0;
	CLRF        CCPR1L+0 
;pwm.c,25 :: 		}
L_end_PWM_init:
	RETURN      0
; end of _PWM_init

_PWM_set_duty_cycle:

;pwm.c,27 :: 		void PWM_set_duty_cycle(unsigned char duty_porcent)
;pwm.c,29 :: 		unsigned char duty = ((unsigned char) duty_porcent * (PR2 + 1)) / 100;
	MOVF        PR2+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        FARG_PWM_set_duty_cycle_duty_porcent+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
;pwm.c,31 :: 		CCPR1L = duty;
	MOVF        R0, 0 
	MOVWF       CCPR1L+0 
;pwm.c,32 :: 		}
L_end_PWM_set_duty_cycle:
	RETURN      0
; end of _PWM_set_duty_cycle
