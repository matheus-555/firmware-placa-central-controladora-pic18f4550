
_CONTROLE_PID_init:

;controle_pid.c,70 :: 		void CONTROLE_PID_init()
;controle_pid.c,72 :: 		isStart = false;
	CLRF        controle_pid_isStart+0 
;controle_pid.c,73 :: 		stop();
	CALL        controle_pid_stop+0, 0
;controle_pid.c,74 :: 		}
L_end_CONTROLE_PID_init:
	RETURN      0
; end of _CONTROLE_PID_init

_CONTROLE_PID_main:

;controle_pid.c,76 :: 		void CONTROLE_PID_main()
;controle_pid.c,78 :: 		MODO_FUNCIONAMENTO_T = TASK_CONTROLE_PID;
	MOVLW       5
	MOVWF       _writeBuffer+6 
;controle_pid.c,80 :: 		if (!PID_btn_stop)
	BTFSC       PORTB+0, 2 
	GOTO        L_CONTROLE_PID_main0
;controle_pid.c,81 :: 		isStart = false;
	CLRF        controle_pid_isStart+0 
	GOTO        L_CONTROLE_PID_main1
L_CONTROLE_PID_main0:
;controle_pid.c,82 :: 		else if (!PID_btn_start)
	BTFSC       PORTB+0, 0 
	GOTO        L_CONTROLE_PID_main2
;controle_pid.c,84 :: 		isStart = true;
	MOVLW       1
	MOVWF       controle_pid_isStart+0 
;controle_pid.c,85 :: 		start();
	CALL        controle_pid_start+0, 0
;controle_pid.c,86 :: 		}
L_CONTROLE_PID_main2:
L_CONTROLE_PID_main1:
;controle_pid.c,88 :: 		if (isStart)
	MOVF        controle_pid_isStart+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main3
;controle_pid.c,90 :: 		if (SOFT_TIMER_delay_ms(&timer[T_PID], 1000))
	MOVLW       controle_pid_timer+0
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+0 
	MOVLW       hi_addr(controle_pid_timer+0)
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+1 
	MOVLW       232
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+0 
	MOVLW       3
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+1 
	CALL        _SOFT_TIMER_delay_ms+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main4
;controle_pid.c,92 :: 		tank_level = PID_level_meter;
	MOVF        _readBuffer+14, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        _readBuffer+13, 0 
	IORWF       R0, 1 
	MOVLW       0
	IORWF       R1, 1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__CONTROLE_PID_main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__CONTROLE_PID_main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__CONTROLE_PID_main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__CONTROLE_PID_main+3 
	MOVF        FLOC__CONTROLE_PID_main+0, 0 
	MOVWF       controle_pid_tank_level+0 
	MOVF        FLOC__CONTROLE_PID_main+1, 0 
	MOVWF       controle_pid_tank_level+1 
	MOVF        FLOC__CONTROLE_PID_main+2, 0 
	MOVWF       controle_pid_tank_level+2 
	MOVF        FLOC__CONTROLE_PID_main+3, 0 
	MOVWF       controle_pid_tank_level+3 
;controle_pid.c,93 :: 		setpoint = PID_setpoint;
	MOVF        _ADC_variable+2, 0 
	MOVWF       R0 
	MOVF        _ADC_variable+3, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_setpoint+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_setpoint+1 
	MOVF        R2, 0 
	MOVWF       controle_pid_setpoint+2 
	MOVF        R3, 0 
	MOVWF       controle_pid_setpoint+3 
;controle_pid.c,95 :: 		control_output = calculate_PID(setpoint, tank_level);
	MOVF        R0, 0 
	MOVWF       FARG_controle_pid_calculate_PID_setpoint+0 
	MOVF        R1, 0 
	MOVWF       FARG_controle_pid_calculate_PID_setpoint+1 
	MOVF        R2, 0 
	MOVWF       FARG_controle_pid_calculate_PID_setpoint+2 
	MOVF        R3, 0 
	MOVWF       FARG_controle_pid_calculate_PID_setpoint+3 
	MOVF        FLOC__CONTROLE_PID_main+0, 0 
	MOVWF       FARG_controle_pid_calculate_PID_nivel_tanque+0 
	MOVF        FLOC__CONTROLE_PID_main+1, 0 
	MOVWF       FARG_controle_pid_calculate_PID_nivel_tanque+1 
	MOVF        FLOC__CONTROLE_PID_main+2, 0 
	MOVWF       FARG_controle_pid_calculate_PID_nivel_tanque+2 
	MOVF        FLOC__CONTROLE_PID_main+3, 0 
	MOVWF       FARG_controle_pid_calculate_PID_nivel_tanque+3 
	CALL        controle_pid_calculate_PID+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_control_output+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_control_output+1 
	MOVF        R2, 0 
	MOVWF       controle_pid_control_output+2 
	MOVF        R3, 0 
	MOVWF       controle_pid_control_output+3 
;controle_pid.c,97 :: 		if (control_output > 0)
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main5
;controle_pid.c,100 :: 		PID_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_pid.c,101 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_pid.c,104 :: 		PID_fill_valve((unsigned)control_output);
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _writeBuffer+18 
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       _writeBuffer+19 
;controle_pid.c,105 :: 		value_pwm = (control_output / 1023) * 100;
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_value_pwm+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_value_pwm+1 
;controle_pid.c,106 :: 		PWM1_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CONTROLE_PID_main17
	MOVF        R0, 0 
	SUBLW       100
L__CONTROLE_PID_main17:
	BTFSC       STATUS+0, 0 
	GOTO        L_CONTROLE_PID_main6
	MOVLW       100
	MOVWF       ?FLOC___CONTROLE_PID_mainT28+0 
	MOVLW       0
	MOVWF       ?FLOC___CONTROLE_PID_mainT28+1 
	GOTO        L_CONTROLE_PID_main7
L_CONTROLE_PID_main6:
	MOVF        controle_pid_value_pwm+0, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT28+0 
	MOVF        controle_pid_value_pwm+1, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT28+1 
L_CONTROLE_PID_main7:
	MOVF        ?FLOC___CONTROLE_PID_mainT28+0, 0 
	MOVWF       FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_pid.c,107 :: 		}
	GOTO        L_CONTROLE_PID_main8
L_CONTROLE_PID_main5:
;controle_pid.c,110 :: 		control_output = -control_output;
	BTG         controle_pid_control_output+2, 7 
;controle_pid.c,112 :: 		PID_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_pid.c,113 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_pid.c,116 :: 		PID_discharge_valve((unsigned)-control_output);
	MOVLW       0
	XORWF       controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVLW       0
	XORWF       controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVLW       128
	XORWF       controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVLW       0
	XORWF       controle_pid_control_output+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _writeBuffer+20 
	MOVLW       0
	XORWF       controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVLW       0
	XORWF       controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVLW       128
	XORWF       controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVLW       0
	XORWF       controle_pid_control_output+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       _writeBuffer+21 
;controle_pid.c,117 :: 		value_pwm = (-control_output / 1023) * 100;
	MOVLW       0
	XORWF       controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVLW       0
	XORWF       controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVLW       128
	XORWF       controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVLW       0
	XORWF       controle_pid_control_output+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_value_pwm+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_value_pwm+1 
;controle_pid.c,118 :: 		PWM2_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CONTROLE_PID_main18
	MOVF        R0, 0 
	SUBLW       100
L__CONTROLE_PID_main18:
	BTFSC       STATUS+0, 0 
	GOTO        L_CONTROLE_PID_main9
	MOVLW       100
	MOVWF       ?FLOC___CONTROLE_PID_mainT50+0 
	MOVLW       0
	MOVWF       ?FLOC___CONTROLE_PID_mainT50+1 
	GOTO        L_CONTROLE_PID_main10
L_CONTROLE_PID_main9:
	MOVF        controle_pid_value_pwm+0, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT50+0 
	MOVF        controle_pid_value_pwm+1, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT50+1 
L_CONTROLE_PID_main10:
	MOVF        ?FLOC___CONTROLE_PID_mainT50+0, 0 
	MOVWF       FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_pid.c,119 :: 		}
L_CONTROLE_PID_main8:
;controle_pid.c,120 :: 		}
L_CONTROLE_PID_main4:
;controle_pid.c,121 :: 		} // end start
	GOTO        L_CONTROLE_PID_main11
L_CONTROLE_PID_main3:
;controle_pid.c,123 :: 		stop();
	CALL        controle_pid_stop+0, 0
L_CONTROLE_PID_main11:
;controle_pid.c,124 :: 		}
L_end_CONTROLE_PID_main:
	RETURN      0
; end of _CONTROLE_PID_main

controle_pid_stop:

;controle_pid.c,126 :: 		static void stop()
;controle_pid.c,129 :: 		PID_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_pid.c,130 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_pid.c,132 :: 		PID_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_pid.c,133 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_pid.c,136 :: 		PID_start_light_off;
	BCF         LATD+0, 0 
;controle_pid.c,139 :: 		if (SOFT_TIMER_delay_ms(&timer[T_TGL_STOP], 500))
	MOVLW       controle_pid_timer+4
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+0 
	MOVLW       hi_addr(controle_pid_timer+4)
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+1 
	MOVLW       244
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+0 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+1 
	CALL        _SOFT_TIMER_delay_ms+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controle_pid_stop12
;controle_pid.c,140 :: 		PID_stop_tgl;
	BTG         LATD+0, 2 
L_controle_pid_stop12:
;controle_pid.c,141 :: 		}
L_end_stop:
	RETURN      0
; end of controle_pid_stop

controle_pid_start:

;controle_pid.c,143 :: 		static void start()
;controle_pid.c,145 :: 		PID_stop_light_off;
	BCF         LATD+0, 2 
;controle_pid.c,146 :: 		PID_start_light_on;
	BSF         LATD+0, 0 
;controle_pid.c,147 :: 		}
L_end_start:
	RETURN      0
; end of controle_pid_start

controle_pid_calculate_PID:

;controle_pid.c,149 :: 		static float calculate_PID(float setpoint, float nivel_tanque)
;controle_pid.c,151 :: 		float error = setpoint - nivel_tanque;
	MOVF        FARG_controle_pid_calculate_PID_nivel_tanque+0, 0 
	MOVWF       R4 
	MOVF        FARG_controle_pid_calculate_PID_nivel_tanque+1, 0 
	MOVWF       R5 
	MOVF        FARG_controle_pid_calculate_PID_nivel_tanque+2, 0 
	MOVWF       R6 
	MOVF        FARG_controle_pid_calculate_PID_nivel_tanque+3, 0 
	MOVWF       R7 
	MOVF        FARG_controle_pid_calculate_PID_setpoint+0, 0 
	MOVWF       R0 
	MOVF        FARG_controle_pid_calculate_PID_setpoint+1, 0 
	MOVWF       R1 
	MOVF        FARG_controle_pid_calculate_PID_setpoint+2, 0 
	MOVWF       R2 
	MOVF        FARG_controle_pid_calculate_PID_setpoint+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_calculate_PID_error_L0+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_calculate_PID_error_L0+1 
	MOVF        R2, 0 
	MOVWF       controle_pid_calculate_PID_error_L0+2 
	MOVF        R3, 0 
	MOVWF       controle_pid_calculate_PID_error_L0+3 
;controle_pid.c,154 :: 		integral += error;
	MOVF        controle_pid_integral+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_integral+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_integral+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_integral+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_integral+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_integral+1 
	MOVF        R2, 0 
	MOVWF       controle_pid_integral+2 
	MOVF        R3, 0 
	MOVWF       controle_pid_integral+3 
;controle_pid.c,156 :: 		if (integral > MAX_VAL_INTEGRAL)
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
	MOVLW       72
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controle_pid_calculate_PID13
;controle_pid.c,157 :: 		integral = MAX_VAL_INTEGRAL; // Limitar integral para antiwindup
	MOVLW       0
	MOVWF       controle_pid_integral+0 
	MOVLW       0
	MOVWF       controle_pid_integral+1 
	MOVLW       72
	MOVWF       controle_pid_integral+2 
	MOVLW       133
	MOVWF       controle_pid_integral+3 
L_controle_pid_calculate_PID13:
;controle_pid.c,159 :: 		if (integral < -MAX_VAL_INTEGRAL)
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       200
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        controle_pid_integral+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_integral+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_integral+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_integral+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controle_pid_calculate_PID14
;controle_pid.c,160 :: 		integral = -MAX_VAL_INTEGRAL; // Limitar integral para antiwindup
	MOVLW       0
	MOVWF       controle_pid_integral+0 
	MOVLW       0
	MOVWF       controle_pid_integral+1 
	MOVLW       200
	MOVWF       controle_pid_integral+2 
	MOVLW       133
	MOVWF       controle_pid_integral+3 
L_controle_pid_calculate_PID14:
;controle_pid.c,162 :: 		derivative = (error - previous_error);
	MOVF        controle_pid_previous_error+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_previous_error+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_previous_error+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_previous_error+3, 0 
	MOVWF       R7 
	MOVF        controle_pid_calculate_PID_error_L0+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_calculate_PID_error_L0+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_calculate_PID_error_L0+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_calculate_PID_error_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
;controle_pid.c,165 :: 		derivative = ALPHA * derivative + (1 - ALPHA) * previous_derivative;
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+0 
	MOVF        R1, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+1 
	MOVF        R2, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+2 
	MOVF        R3, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+3 
	MOVLW       102
	MOVWF       R0 
	MOVLW       102
	MOVWF       R1 
	MOVLW       102
	MOVWF       R2 
	MOVLW       126
	MOVWF       R3 
	MOVF        controle_pid_previous_derivative+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_previous_derivative+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_previous_derivative+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_previous_derivative+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC_controle_pid_calculate_PID+0, 0 
	MOVWF       R4 
	MOVF        FLOC_controle_pid_calculate_PID+1, 0 
	MOVWF       R5 
	MOVF        FLOC_controle_pid_calculate_PID+2, 0 
	MOVWF       R6 
	MOVF        FLOC_controle_pid_calculate_PID+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+4 
	MOVF        R1, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+5 
	MOVF        R2, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+6 
	MOVF        R3, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+7 
	MOVF        controle_pid_calculate_PID_error_L0+0, 0 
	MOVWF       controle_pid_previous_error+0 
	MOVF        controle_pid_calculate_PID_error_L0+1, 0 
	MOVWF       controle_pid_previous_error+1 
	MOVF        controle_pid_calculate_PID_error_L0+2, 0 
	MOVWF       controle_pid_previous_error+2 
	MOVF        controle_pid_calculate_PID_error_L0+3, 0 
	MOVWF       controle_pid_previous_error+3 
;controle_pid.c,167 :: 		previous_derivative = derivative;
	MOVF        FLOC_controle_pid_calculate_PID+4, 0 
	MOVWF       controle_pid_previous_derivative+0 
	MOVF        FLOC_controle_pid_calculate_PID+5, 0 
	MOVWF       controle_pid_previous_derivative+1 
	MOVF        FLOC_controle_pid_calculate_PID+6, 0 
	MOVWF       controle_pid_previous_derivative+2 
	MOVF        FLOC_controle_pid_calculate_PID+7, 0 
	MOVWF       controle_pid_previous_derivative+3 
;controle_pid.c,169 :: 		return (KP * error) + (KI * integral) + (KD * derivative);
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	MOVF        controle_pid_calculate_PID_error_L0+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_calculate_PID_error_L0+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_calculate_PID_error_L0+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_calculate_PID_error_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+0 
	MOVF        R1, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+1 
	MOVF        R2, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+2 
	MOVF        R3, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+3 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       126
	MOVWF       R3 
	MOVF        controle_pid_integral+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_integral+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_integral+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_integral+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC_controle_pid_calculate_PID+0, 0 
	MOVWF       R4 
	MOVF        FLOC_controle_pid_calculate_PID+1, 0 
	MOVWF       R5 
	MOVF        FLOC_controle_pid_calculate_PID+2, 0 
	MOVWF       R6 
	MOVF        FLOC_controle_pid_calculate_PID+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+0 
	MOVF        R1, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+1 
	MOVF        R2, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+2 
	MOVF        R3, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+3 
	MOVLW       205
	MOVWF       R0 
	MOVLW       204
	MOVWF       R1 
	MOVLW       76
	MOVWF       R2 
	MOVLW       124
	MOVWF       R3 
	MOVF        FLOC_controle_pid_calculate_PID+4, 0 
	MOVWF       R4 
	MOVF        FLOC_controle_pid_calculate_PID+5, 0 
	MOVWF       R5 
	MOVF        FLOC_controle_pid_calculate_PID+6, 0 
	MOVWF       R6 
	MOVF        FLOC_controle_pid_calculate_PID+7, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC_controle_pid_calculate_PID+0, 0 
	MOVWF       R4 
	MOVF        FLOC_controle_pid_calculate_PID+1, 0 
	MOVWF       R5 
	MOVF        FLOC_controle_pid_calculate_PID+2, 0 
	MOVWF       R6 
	MOVF        FLOC_controle_pid_calculate_PID+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
;controle_pid.c,170 :: 		}
L_end_calculate_PID:
	RETURN      0
; end of controle_pid_calculate_PID
