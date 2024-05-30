
controle_on_off_stop:

;controle_on_off.c,46 :: 		static void stop()
;controle_on_off.c,49 :: 		ON_OFF_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_on_off.c,50 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_on_off.c,52 :: 		ON_OFF_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_on_off.c,53 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_on_off.c,56 :: 		ON_OFF_start_light_off;
	BCF         LATD+0, 0 
;controle_on_off.c,59 :: 		if (SOFT_TIMER_delay_ms(&timer[T_TGL_STOP], 500))
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
;controle_on_off.c,60 :: 		ON_OFF_stop_tgl;
	BTG         LATD+0, 2 
L_controle_on_off_stop0:
;controle_on_off.c,61 :: 		}
L_end_stop:
	RETURN      0
; end of controle_on_off_stop

controle_on_off_start:

;controle_on_off.c,63 :: 		static void start()
;controle_on_off.c,65 :: 		ON_OFF_stop_light_off;
	BCF         LATD+0, 2 
;controle_on_off.c,66 :: 		ON_OFF_start_light_on;
	BSF         LATD+0, 0 
;controle_on_off.c,67 :: 		}
L_end_start:
	RETURN      0
; end of controle_on_off_start

_CONTROLE_ON_OFF_init:

;controle_on_off.c,69 :: 		void CONTROLE_ON_OFF_init()
;controle_on_off.c,71 :: 		isStart = false;
	CLRF        controle_on_off_isStart+0 
;controle_on_off.c,72 :: 		stop();
	CALL        controle_on_off_stop+0, 0
;controle_on_off.c,73 :: 		}
L_end_CONTROLE_ON_OFF_init:
	RETURN      0
; end of _CONTROLE_ON_OFF_init

_CONTROLE_ON_OFF_main:

;controle_on_off.c,75 :: 		void CONTROLE_ON_OFF_main()
;controle_on_off.c,77 :: 		MODO_FUNCIONAMENTO_T = TASK_CONTROLE_ON_OFF;
	MOVLW       6
	MOVWF       _writeBuffer+6 
;controle_on_off.c,79 :: 		if (!ON_OFF_btn_stop)
	BTFSC       PORTB+0, 2 
	GOTO        L_CONTROLE_ON_OFF_main1
;controle_on_off.c,80 :: 		isStart = false;
	CLRF        controle_on_off_isStart+0 
	GOTO        L_CONTROLE_ON_OFF_main2
L_CONTROLE_ON_OFF_main1:
;controle_on_off.c,81 :: 		else if (!ON_OFF_btn_start)
	BTFSC       PORTB+0, 0 
	GOTO        L_CONTROLE_ON_OFF_main3
;controle_on_off.c,83 :: 		isStart = true;
	MOVLW       1
	MOVWF       controle_on_off_isStart+0 
;controle_on_off.c,84 :: 		start();
	CALL        controle_on_off_start+0, 0
;controle_on_off.c,85 :: 		}
L_CONTROLE_ON_OFF_main3:
L_CONTROLE_ON_OFF_main2:
;controle_on_off.c,87 :: 		if (isStart)
	MOVF        controle_on_off_isStart+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_ON_OFF_main4
;controle_on_off.c,89 :: 		if (SOFT_TIMER_delay_ms(&timer[T_ON_OFF], 10))
	MOVLW       controle_on_off_timer+0
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+0 
	MOVLW       hi_addr(controle_on_off_timer+0)
	MOVWF       FARG_SOFT_TIMER_delay_ms_timer+1 
	MOVLW       10
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+0 
	MOVLW       0
	MOVWF       FARG_SOFT_TIMER_delay_ms_delay_ms+1 
	CALL        _SOFT_TIMER_delay_ms+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_ON_OFF_main5
;controle_on_off.c,91 :: 		if (ON_OFF_setpoint != ON_OFF_level_meter)
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
	GOTO        L__CONTROLE_ON_OFF_main14
	MOVF        R2, 0 
	XORWF       _ADC_variable+2, 0 
L__CONTROLE_ON_OFF_main14:
	BTFSC       STATUS+0, 2 
	GOTO        L_CONTROLE_ON_OFF_main6
;controle_on_off.c,93 :: 		if (ON_OFF_level_meter < ON_OFF_setpoint)
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
	GOTO        L__CONTROLE_ON_OFF_main15
	MOVF        _ADC_variable+2, 0 
	SUBWF       R2, 0 
L__CONTROLE_ON_OFF_main15:
	BTFSC       STATUS+0, 0 
	GOTO        L_CONTROLE_ON_OFF_main7
;controle_on_off.c,96 :: 		ON_OFF_discharge_valve(0);
	CLRF        _writeBuffer+20 
	CLRF        _writeBuffer+21 
;controle_on_off.c,97 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_on_off.c,100 :: 		ON_OFF_fill_valve(1000);
	MOVLW       232
	MOVWF       _writeBuffer+18 
	MOVLW       3
	MOVWF       _writeBuffer+19 
;controle_on_off.c,101 :: 		PWM1_set_duty_cycle(20);
	MOVLW       20
	MOVWF       FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_on_off.c,102 :: 		}
	GOTO        L_CONTROLE_ON_OFF_main8
L_CONTROLE_ON_OFF_main7:
;controle_on_off.c,106 :: 		ON_OFF_fill_valve(0);
	CLRF        _writeBuffer+18 
	CLRF        _writeBuffer+19 
;controle_on_off.c,107 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;controle_on_off.c,110 :: 		ON_OFF_discharge_valve(1000);
	MOVLW       232
	MOVWF       _writeBuffer+20 
	MOVLW       3
	MOVWF       _writeBuffer+21 
;controle_on_off.c,111 :: 		PWM2_set_duty_cycle(20);
	MOVLW       20
	MOVWF       FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;controle_on_off.c,112 :: 		}
L_CONTROLE_ON_OFF_main8:
;controle_on_off.c,113 :: 		}
L_CONTROLE_ON_OFF_main6:
;controle_on_off.c,114 :: 		}
L_CONTROLE_ON_OFF_main5:
;controle_on_off.c,115 :: 		} // end start
	GOTO        L_CONTROLE_ON_OFF_main9
L_CONTROLE_ON_OFF_main4:
;controle_on_off.c,117 :: 		stop();
	CALL        controle_on_off_stop+0, 0
L_CONTROLE_ON_OFF_main9:
;controle_on_off.c,118 :: 		}
L_end_CONTROLE_ON_OFF_main:
	RETURN      0
; end of _CONTROLE_ON_OFF_main
