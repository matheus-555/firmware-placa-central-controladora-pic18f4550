
controle_on_off_stop:

;controle_on_off.c,48 :: 		static void stop()
;controle_on_off.c,51 :: 		ON_OFF_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_on_off.c,52 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_on_off.c,54 :: 		ON_OFF_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_on_off.c,55 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_on_off.c,58 :: 		ON_OFF_start_light_off;
	BCF         LATD+0, 0 
;controle_on_off.c,61 :: 		if (SOFT_TIMER_delay_ms(&timer[T_TGL_STOP], 500))
	MOVLW       controle_on_off_timer+4
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+0 
	MOVLW       hi_addr(controle_on_off_timer+4)
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+1 
	MOVLW       244
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+0 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+1 
	CALL        _SOFT_TIMER_delay_ms+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_controle_on_off_stop0
;controle_on_off.c,62 :: 		ON_OFF_stop_tgl;
	BTG         LATD+0, 2 
L_controle_on_off_stop0:
;controle_on_off.c,63 :: 		}
L_end_stop:
	RETURN      0
; end of controle_on_off_stop

controle_on_off_start:

;controle_on_off.c,65 :: 		static void start()
;controle_on_off.c,67 :: 		ON_OFF_stop_light_off;
	BCF         LATD+0, 2 
;controle_on_off.c,68 :: 		ON_OFF_start_light_on;
	BSF         LATD+0, 0 
;controle_on_off.c,69 :: 		}
L_end_start:
	RETURN      0
; end of controle_on_off_start

_CONTROLE_ON_OFF_init:

;controle_on_off.c,71 :: 		void CONTROLE_ON_OFF_init()
;controle_on_off.c,73 :: 		isStart = false;
	CLRF        controle_on_off_isStart+0 
;controle_on_off.c,74 :: 		stop();
	CALL        controle_on_off_stop+0, 0
;controle_on_off.c,75 :: 		}
L_end_CONTROLE_ON_OFF_init:
	RETURN      0
; end of _CONTROLE_ON_OFF_init

_CONTROLE_ON_OFF_main:

;controle_on_off.c,77 :: 		void CONTROLE_ON_OFF_main()
;controle_on_off.c,79 :: 		MODO_FUNCIONAMENTO_T = TASK_CONTROLE_ON_OFF;
	MOVLW       6
	MOVWF       _writeBuffer+6 
;controle_on_off.c,81 :: 		if (!ON_OFF_btn_stop)
	BTFSC       PORTB+0, 2 
	GOTO        L_CONTROLE_ON_OFF_main1
;controle_on_off.c,82 :: 		isStart = false;
	CLRF        controle_on_off_isStart+0 
	GOTO        L_CONTROLE_ON_OFF_main2
L_CONTROLE_ON_OFF_main1:
;controle_on_off.c,83 :: 		else if (!ON_OFF_btn_start)
	BTFSC       PORTB+0, 0 
	GOTO        L_CONTROLE_ON_OFF_main3
;controle_on_off.c,85 :: 		isStart = true;
	MOVLW       1
	MOVWF       controle_on_off_isStart+0 
;controle_on_off.c,86 :: 		start();
	CALL        controle_on_off_start+0, 0
;controle_on_off.c,87 :: 		}
L_CONTROLE_ON_OFF_main3:
L_CONTROLE_ON_OFF_main2:
;controle_on_off.c,89 :: 		if (isStart)
	MOVF        controle_on_off_isStart+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_ON_OFF_main4
;controle_on_off.c,91 :: 		if (SOFT_TIMER_delay_ms(&timer[T_ON_OFF], ON_OFF_START_CALC_MS))
	MOVLW       controle_on_off_timer+0
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+0 
	MOVLW       hi_addr(controle_on_off_timer+0)
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+1 
	MOVLW       244
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+0 
	MOVLW       1
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+1 
	CALL        _SOFT_TIMER_delay_ms+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_ON_OFF_main5
;controle_on_off.c,93 :: 		if (ON_OFF_setpoint != ON_OFF_level_meter)
	MOVF        _readBuffer+14, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	IORWF       _readBuffer+13, 0 
	MOVWF       R2 
	MOVLW       0
	IORWF       R1, 0 
	MOVWF       R3 
	MOVF        _ADC_variable+3, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CONTROLE_ON_OFF_main16
	MOVF        R2, 0 
	XORWF       _ADC_variable+2, 0 
L__CONTROLE_ON_OFF_main16:
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_ON_OFF_main6
;controle_on_off.c,95 :: 		if (ON_OFF_level_meter < ON_OFF_setpoint)
	MOVF        _readBuffer+14, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	IORWF       _readBuffer+13, 0 
	MOVWF       R2 
	MOVLW       0
	IORWF       R1, 0 
	MOVWF       R3 
	MOVF        _ADC_variable+3, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CONTROLE_ON_OFF_main17
	MOVF        _ADC_variable+2, 0 
	SUBWF       R2, 0 
L__CONTROLE_ON_OFF_main17:
	BTFSC       STATUS+0, 0 
	GOTO        L_CONTROLE_ON_OFF_main7
;controle_on_off.c,98 :: 		ON_OFF_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_on_off.c,99 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_on_off.c,102 :: 		ON_OFF_fill_valve(1000);
	MOVLW       232
	MOVWF       _writeBuffer+18 
	MOVLW       3
	MOVWF       _writeBuffer+19 
;controle_on_off.c,103 :: 		PWM1_set_duty_cycle(100);
	MOVLW       100
	MOVWF       FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_on_off.c,104 :: 		}
	GOTO        L_CONTROLE_ON_OFF_main8
L_CONTROLE_ON_OFF_main7:
;controle_on_off.c,105 :: 		else if (ON_OFF_level_meter > ON_OFF_setpoint)
	MOVF        _readBuffer+14, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	IORWF       _readBuffer+13, 0 
	MOVWF       R2 
	MOVLW       0
	IORWF       R1, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	SUBWF       _ADC_variable+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CONTROLE_ON_OFF_main18
	MOVF        R2, 0 
	SUBWF       _ADC_variable+2, 0 
L__CONTROLE_ON_OFF_main18:
	BTFSC       STATUS+0, 0 
	GOTO        L_CONTROLE_ON_OFF_main9
;controle_on_off.c,108 :: 		ON_OFF_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_on_off.c,109 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_on_off.c,112 :: 		ON_OFF_discharge_valve(1000);
	MOVLW       232
	MOVWF       _writeBuffer+20 
	MOVLW       3
	MOVWF       _writeBuffer+21 
;controle_on_off.c,113 :: 		PWM2_set_duty_cycle(100);
	MOVLW       100
	MOVWF       FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_on_off.c,114 :: 		}
L_CONTROLE_ON_OFF_main9:
L_CONTROLE_ON_OFF_main8:
;controle_on_off.c,115 :: 		}
	GOTO        L_CONTROLE_ON_OFF_main10
L_CONTROLE_ON_OFF_main6:
;controle_on_off.c,119 :: 		ON_OFF_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_on_off.c,120 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_on_off.c,123 :: 		ON_OFF_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_on_off.c,124 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_on_off.c,125 :: 		}
L_CONTROLE_ON_OFF_main10:
;controle_on_off.c,126 :: 		}
L_CONTROLE_ON_OFF_main5:
;controle_on_off.c,127 :: 		} // end start
	GOTO        L_CONTROLE_ON_OFF_main11
L_CONTROLE_ON_OFF_main4:
;controle_on_off.c,129 :: 		stop();
	CALL        controle_on_off_stop+0, 0
L_CONTROLE_ON_OFF_main11:
;controle_on_off.c,130 :: 		}
L_end_CONTROLE_ON_OFF_main:
	RETURN      0
; end of _CONTROLE_ON_OFF_main
