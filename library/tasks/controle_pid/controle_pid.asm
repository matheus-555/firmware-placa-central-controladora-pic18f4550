
_CONTROLE_PID_init:

;controle_pid.c,63 :: 		void CONTROLE_PID_init()
;controle_pid.c,65 :: 		MODO_FUNCIONAMENTO_T = TASK_CONTROLE_PID;
	MOVLW       5
	MOVWF       _writeBuffer+6 
;controle_pid.c,66 :: 		isStart = false;
	CLRF        controle_pid_isStart+0 
;controle_pid.c,67 :: 		stop();
	CALL        controle_pid_stop+0, 0
;controle_pid.c,68 :: 		}
L_end_CONTROLE_PID_init:
	RETURN      0
; end of _CONTROLE_PID_init

_CONTROLE_PID_main:

;controle_pid.c,70 :: 		void CONTROLE_PID_main()
;controle_pid.c,72 :: 		if (!PID_btn_stop)
	BTFSC       PORTB+0, 2 
	GOTO        L_CONTROLE_PID_main0
;controle_pid.c,73 :: 		isStart = false;
	CLRF        controle_pid_isStart+0 
	GOTO        L_CONTROLE_PID_main1
L_CONTROLE_PID_main0:
;controle_pid.c,74 :: 		else if (!PID_btn_start)
	BTFSC       PORTB+0, 0 
	GOTO        L_CONTROLE_PID_main2
;controle_pid.c,76 :: 		isStart = true;
	MOVLW       1
	MOVWF       controle_pid_isStart+0 
;controle_pid.c,77 :: 		start();
	CALL        controle_pid_start+0, 0
;controle_pid.c,78 :: 		}
L_CONTROLE_PID_main2:
L_CONTROLE_PID_main1:
;controle_pid.c,80 :: 		if (isStart)
	MOVF        controle_pid_isStart+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main3
;controle_pid.c,82 :: 		if (SOFT_TIMER_delay_ms(&timer[T_PID], CONTROLE_PID_START_CALC_MS))
	MOVLW       controle_pid_timer+0
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+0 
	MOVLW       hi_addr(controle_pid_timer+0)
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+1 
	MOVLW       244
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+0 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+1 
	CALL        _SOFT_TIMER_delay_ms+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main4
;controle_pid.c,84 :: 		tank_level = PID_level_meter;
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
;controle_pid.c,85 :: 		setpoint   = PID_setpoint;
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
;controle_pid.c,87 :: 		control_output = calculate_PID(setpoint, tank_level);
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
;controle_pid.c,89 :: 		if (control_output > 0)
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
;controle_pid.c,92 :: 		PID_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_pid.c,93 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_pid.c,96 :: 		PID_fill_valve((uint16_t) (control_output > 1000 ? 1000 : control_output));
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       122
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main6
	MOVLW       232
	MOVWF       ?FLOC___CONTROLE_PID_mainT20+0 
	MOVLW       3
	MOVWF       ?FLOC___CONTROLE_PID_mainT20+1 
	GOTO        L_CONTROLE_PID_main7
L_CONTROLE_PID_main6:
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT20+0 
	MOVF        R1, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT20+1 
L_CONTROLE_PID_main7:
	MOVF        ?FLOC___CONTROLE_PID_mainT20+0, 0 
	MOVWF       _writeBuffer+18 
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       122
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main8
	MOVLW       232
	MOVWF       ?FLOC___CONTROLE_PID_mainT25+0 
	MOVLW       3
	MOVWF       ?FLOC___CONTROLE_PID_mainT25+1 
	GOTO        L_CONTROLE_PID_main9
L_CONTROLE_PID_main8:
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT25+0 
	MOVF        R1, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT25+1 
L_CONTROLE_PID_main9:
	MOVF        ?FLOC___CONTROLE_PID_mainT25+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       _writeBuffer+19 
;controle_pid.c,97 :: 		value_pwm = CONTROLE_PID_CONVERT_TO_PWM_DUTY_PORCENT(control_output);
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R3 
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_value_pwm+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_value_pwm+1 
;controle_pid.c,98 :: 		PWM1_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CONTROLE_PID_main28
	MOVF        R0, 0 
	SUBLW       100
L__CONTROLE_PID_main28:
	BTFSC       STATUS+0, 0 
	GOTO        L_CONTROLE_PID_main10
	MOVLW       100
	MOVWF       ?FLOC___CONTROLE_PID_mainT31+0 
	MOVLW       0
	MOVWF       ?FLOC___CONTROLE_PID_mainT31+1 
	GOTO        L_CONTROLE_PID_main11
L_CONTROLE_PID_main10:
	MOVF        controle_pid_value_pwm+0, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT31+0 
	MOVF        controle_pid_value_pwm+1, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT31+1 
L_CONTROLE_PID_main11:
	MOVF        ?FLOC___CONTROLE_PID_mainT31+0, 0 
	MOVWF       FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_pid.c,99 :: 		}
	GOTO        L_CONTROLE_PID_main12
L_CONTROLE_PID_main5:
;controle_pid.c,100 :: 		else if (control_output < 0)
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main13
;controle_pid.c,102 :: 		control_output = -control_output;
	BTG         controle_pid_control_output+2, 7 
;controle_pid.c,104 :: 		PID_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_pid.c,105 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_pid.c,108 :: 		PID_discharge_valve((uint16_t) (control_output > 1000 ? 1000 : control_output));
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       122
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main14
	MOVLW       232
	MOVWF       ?FLOC___CONTROLE_PID_mainT40+0 
	MOVLW       3
	MOVWF       ?FLOC___CONTROLE_PID_mainT40+1 
	GOTO        L_CONTROLE_PID_main15
L_CONTROLE_PID_main14:
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT40+0 
	MOVF        R1, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT40+1 
L_CONTROLE_PID_main15:
	MOVF        ?FLOC___CONTROLE_PID_mainT40+0, 0 
	MOVWF       _writeBuffer+20 
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       122
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_PID_main16
	MOVLW       232
	MOVWF       ?FLOC___CONTROLE_PID_mainT45+0 
	MOVLW       3
	MOVWF       ?FLOC___CONTROLE_PID_mainT45+1 
	GOTO        L_CONTROLE_PID_main17
L_CONTROLE_PID_main16:
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT45+0 
	MOVF        R1, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT45+1 
L_CONTROLE_PID_main17:
	MOVF        ?FLOC___CONTROLE_PID_mainT45+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       _writeBuffer+21 
;controle_pid.c,109 :: 		value_pwm = CONTROLE_PID_CONVERT_TO_PWM_DUTY_PORCENT(control_output);
	MOVF        controle_pid_control_output+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_control_output+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_control_output+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_control_output+3, 0 
	MOVWF       R3 
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_value_pwm+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_value_pwm+1 
;controle_pid.c,110 :: 		PWM2_set_duty_cycle(value_pwm > 100 ? 100 : value_pwm);
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CONTROLE_PID_main29
	MOVF        R0, 0 
	SUBLW       100
L__CONTROLE_PID_main29:
	BTFSC       STATUS+0, 0 
	GOTO        L_CONTROLE_PID_main18
	MOVLW       100
	MOVWF       ?FLOC___CONTROLE_PID_mainT51+0 
	MOVLW       0
	MOVWF       ?FLOC___CONTROLE_PID_mainT51+1 
	GOTO        L_CONTROLE_PID_main19
L_CONTROLE_PID_main18:
	MOVF        controle_pid_value_pwm+0, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT51+0 
	MOVF        controle_pid_value_pwm+1, 0 
	MOVWF       ?FLOC___CONTROLE_PID_mainT51+1 
L_CONTROLE_PID_main19:
	MOVF        ?FLOC___CONTROLE_PID_mainT51+0, 0 
	MOVWF       FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_pid.c,111 :: 		}
	GOTO        L_CONTROLE_PID_main20
L_CONTROLE_PID_main13:
;controle_pid.c,115 :: 		PID_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_pid.c,116 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_pid.c,119 :: 		PID_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_pid.c,120 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_pid.c,121 :: 		}
L_CONTROLE_PID_main20:
L_CONTROLE_PID_main12:
;controle_pid.c,122 :: 		} // SoftTimer()
L_CONTROLE_PID_main4:
;controle_pid.c,123 :: 		} // end start
	GOTO        L_CONTROLE_PID_main21
L_CONTROLE_PID_main3:
;controle_pid.c,125 :: 		stop();
	CALL        controle_pid_stop+0, 0
L_CONTROLE_PID_main21:
;controle_pid.c,126 :: 		}
L_end_CONTROLE_PID_main:
	RETURN      0
; end of _CONTROLE_PID_main

controle_pid_stop:

;controle_pid.c,128 :: 		static void stop()
;controle_pid.c,131 :: 		PID_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_pid.c,132 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_pid.c,134 :: 		PID_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_pid.c,135 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_pid.c,138 :: 		PID_start_light_off;
	BCF         LATD+0, 0 
;controle_pid.c,141 :: 		if (SOFT_TIMER_delay_ms(&timer[T_TGL_STOP], 500))
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
	GOTO        L_controle_pid_stop22
;controle_pid.c,142 :: 		PID_stop_tgl;
	BTG         LATD+0, 2 
L_controle_pid_stop22:
;controle_pid.c,143 :: 		}
L_end_stop:
	RETURN      0
; end of controle_pid_stop

controle_pid_start:

;controle_pid.c,145 :: 		static void start()
;controle_pid.c,147 :: 		PID_stop_light_off;
	BCF         LATD+0, 2 
;controle_pid.c,148 :: 		PID_start_light_on;
	BSF         LATD+0, 0 
;controle_pid.c,149 :: 		}
L_end_start:
	RETURN      0
; end of controle_pid_start

controle_pid_calculate_PID:

;controle_pid.c,151 :: 		static float calculate_PID(float setpoint, float nivel_tanque)
;controle_pid.c,163 :: 		float        erro          = setpoint - nivel_tanque;
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
	MOVWF       FLOC_controle_pid_calculate_PID+0 
	MOVF        R1, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+1 
	MOVF        R2, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+2 
	MOVF        R3, 0 
	MOVWF       FLOC_controle_pid_calculate_PID+3 
	MOVF        FLOC_controle_pid_calculate_PID+0, 0 
	MOVWF       controle_pid_calculate_PID_erro_L0+0 
	MOVF        FLOC_controle_pid_calculate_PID+1, 0 
	MOVWF       controle_pid_calculate_PID_erro_L0+1 
	MOVF        FLOC_controle_pid_calculate_PID+2, 0 
	MOVWF       controle_pid_calculate_PID_erro_L0+2 
	MOVF        FLOC_controle_pid_calculate_PID+3, 0 
	MOVWF       controle_pid_calculate_PID_erro_L0+3 
;controle_pid.c,164 :: 		float        derivada      = (erro - erro_anterior) / DT;
	MOVF        controle_pid_calculate_PID_erro_anterior_L0+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_calculate_PID_erro_anterior_L0+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_calculate_PID_erro_anterior_L0+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_calculate_PID_erro_anterior_L0+3, 0 
	MOVWF       R7 
	MOVF        FLOC_controle_pid_calculate_PID+0, 0 
	MOVWF       R0 
	MOVF        FLOC_controle_pid_calculate_PID+1, 0 
	MOVWF       R1 
	MOVF        FLOC_controle_pid_calculate_PID+2, 0 
	MOVWF       R2 
	MOVF        FLOC_controle_pid_calculate_PID+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_calculate_PID_derivada_L0+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_calculate_PID_derivada_L0+1 
	MOVF        R2, 0 
	MOVWF       controle_pid_calculate_PID_derivada_L0+2 
	MOVF        R3, 0 
	MOVWF       controle_pid_calculate_PID_derivada_L0+3 
;controle_pid.c,166 :: 		integral = integral + (erro * DT);
	MOVF        FLOC_controle_pid_calculate_PID+0, 0 
	MOVWF       R0 
	MOVF        FLOC_controle_pid_calculate_PID+1, 0 
	MOVWF       R1 
	MOVF        FLOC_controle_pid_calculate_PID+2, 0 
	MOVWF       R2 
	MOVF        FLOC_controle_pid_calculate_PID+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        controle_pid_calculate_PID_integral_L0+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_calculate_PID_integral_L0+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_calculate_PID_integral_L0+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_calculate_PID_integral_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       controle_pid_calculate_PID_integral_L0+0 
	MOVF        R1, 0 
	MOVWF       controle_pid_calculate_PID_integral_L0+1 
	MOVF        R2, 0 
	MOVWF       controle_pid_calculate_PID_integral_L0+2 
	MOVF        R3, 0 
	MOVWF       controle_pid_calculate_PID_integral_L0+3 
;controle_pid.c,169 :: 		if (integral > MAX_VAL_SAT_INTEGRAL)
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
	MOVLW       32
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controle_pid_calculate_PID23
;controle_pid.c,170 :: 		integral = MAX_VAL_SAT_INTEGRAL;
	MOVLW       0
	MOVWF       controle_pid_calculate_PID_integral_L0+0 
	MOVLW       0
	MOVWF       controle_pid_calculate_PID_integral_L0+1 
	MOVLW       32
	MOVWF       controle_pid_calculate_PID_integral_L0+2 
	MOVLW       130
	MOVWF       controle_pid_calculate_PID_integral_L0+3 
	GOTO        L_controle_pid_calculate_PID24
L_controle_pid_calculate_PID23:
;controle_pid.c,171 :: 		else if (integral < MIN_VAL_SAT_INTEGRAL)
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       160
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        controle_pid_calculate_PID_integral_L0+0, 0 
	MOVWF       R0 
	MOVF        controle_pid_calculate_PID_integral_L0+1, 0 
	MOVWF       R1 
	MOVF        controle_pid_calculate_PID_integral_L0+2, 0 
	MOVWF       R2 
	MOVF        controle_pid_calculate_PID_integral_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controle_pid_calculate_PID25
;controle_pid.c,172 :: 		integral = MIN_VAL_SAT_INTEGRAL;
	MOVLW       0
	MOVWF       controle_pid_calculate_PID_integral_L0+0 
	MOVLW       0
	MOVWF       controle_pid_calculate_PID_integral_L0+1 
	MOVLW       160
	MOVWF       controle_pid_calculate_PID_integral_L0+2 
	MOVLW       130
	MOVWF       controle_pid_calculate_PID_integral_L0+3 
L_controle_pid_calculate_PID25:
L_controle_pid_calculate_PID24:
;controle_pid.c,174 :: 		erro_anterior = erro;
	MOVF        controle_pid_calculate_PID_erro_L0+0, 0 
	MOVWF       controle_pid_calculate_PID_erro_anterior_L0+0 
	MOVF        controle_pid_calculate_PID_erro_L0+1, 0 
	MOVWF       controle_pid_calculate_PID_erro_anterior_L0+1 
	MOVF        controle_pid_calculate_PID_erro_L0+2, 0 
	MOVWF       controle_pid_calculate_PID_erro_anterior_L0+2 
	MOVF        controle_pid_calculate_PID_erro_L0+3, 0 
	MOVWF       controle_pid_calculate_PID_erro_anterior_L0+3 
;controle_pid.c,176 :: 		return (KP * erro) + (KI * integral) + (KD * derivada);
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	MOVF        controle_pid_calculate_PID_erro_L0+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_calculate_PID_erro_L0+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_calculate_PID_erro_L0+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_calculate_PID_erro_L0+3, 0 
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
	MOVF        controle_pid_calculate_PID_integral_L0+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_calculate_PID_integral_L0+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_calculate_PID_integral_L0+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_calculate_PID_integral_L0+3, 0 
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
	MOVF        controle_pid_calculate_PID_derivada_L0+0, 0 
	MOVWF       R4 
	MOVF        controle_pid_calculate_PID_derivada_L0+1, 0 
	MOVWF       R5 
	MOVF        controle_pid_calculate_PID_derivada_L0+2, 0 
	MOVWF       R6 
	MOVF        controle_pid_calculate_PID_derivada_L0+3, 0 
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
;controle_pid.c,177 :: 		}
L_end_calculate_PID:
	RETURN      0
; end of controle_pid_calculate_PID
