
_main:

;main.c,11 :: 		void main()
;main.c,14 :: 		TASKS_add(&LIVRE_init, &LIVRE_main, TASK_LIVRE);
	MOVLW       _LIVRE_init+0
	MOVWF       FARG_TASKS_add_init+0 
	MOVLW       hi_addr(_LIVRE_init+0)
	MOVWF       FARG_TASKS_add_init+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+3 
	MOVLW       _LIVRE_main+0
	MOVWF       FARG_TASKS_add_main+0 
	MOVLW       hi_addr(_LIVRE_main+0)
	MOVWF       FARG_TASKS_add_main+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+3 
	CLRF        FARG_TASKS_add_id_task+0 
	CLRF        FARG_TASKS_add_id_task+1 
	CALL        _TASKS_add+0, 0
;main.c,15 :: 		TASKS_add(&BLINK_PORTD_init, &BLINK_PORTD_main, TASK_BLINK_PORTD);
	MOVLW       _BLINK_PORTD_init+0
	MOVWF       FARG_TASKS_add_init+0 
	MOVLW       hi_addr(_BLINK_PORTD_init+0)
	MOVWF       FARG_TASKS_add_init+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+3 
	MOVLW       _BLINK_PORTD_main+0
	MOVWF       FARG_TASKS_add_main+0 
	MOVLW       hi_addr(_BLINK_PORTD_main+0)
	MOVWF       FARG_TASKS_add_main+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+3 
	MOVLW       1
	MOVWF       FARG_TASKS_add_id_task+0 
	MOVLW       0
	MOVWF       FARG_TASKS_add_id_task+1 
	CALL        _TASKS_add+0, 0
;main.c,16 :: 		TASKS_add(&CONTAGEM_BINARIA_init, &CONTAGEM_BINARIA_main, TASK_CONTAGEM_BINARIA);
	MOVLW       _CONTAGEM_BINARIA_init+0
	MOVWF       FARG_TASKS_add_init+0 
	MOVLW       hi_addr(_CONTAGEM_BINARIA_init+0)
	MOVWF       FARG_TASKS_add_init+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+3 
	MOVLW       _CONTAGEM_BINARIA_main+0
	MOVWF       FARG_TASKS_add_main+0 
	MOVLW       hi_addr(_CONTAGEM_BINARIA_main+0)
	MOVWF       FARG_TASKS_add_main+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+3 
	MOVLW       4
	MOVWF       FARG_TASKS_add_id_task+0 
	MOVLW       0
	MOVWF       FARG_TASKS_add_id_task+1 
	CALL        _TASKS_add+0, 0
;main.c,17 :: 		TASKS_add(&CONTROLE_PID_init, &CONTROLE_PID_main, TASK_CONTROLE_PID);
	MOVLW       _CONTROLE_PID_init+0
	MOVWF       FARG_TASKS_add_init+0 
	MOVLW       hi_addr(_CONTROLE_PID_init+0)
	MOVWF       FARG_TASKS_add_init+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+3 
	MOVLW       _CONTROLE_PID_main+0
	MOVWF       FARG_TASKS_add_main+0 
	MOVLW       hi_addr(_CONTROLE_PID_main+0)
	MOVWF       FARG_TASKS_add_main+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+3 
	MOVLW       5
	MOVWF       FARG_TASKS_add_id_task+0 
	MOVLW       0
	MOVWF       FARG_TASKS_add_id_task+1 
	CALL        _TASKS_add+0, 0
;main.c,18 :: 		TASKS_add(&SEMAFORO_init, &SEMAFORO_main, TASK_SEMAFORO);
	MOVLW       _SEMAFORO_init+0
	MOVWF       FARG_TASKS_add_init+0 
	MOVLW       hi_addr(_SEMAFORO_init+0)
	MOVWF       FARG_TASKS_add_init+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+3 
	MOVLW       _SEMAFORO_main+0
	MOVWF       FARG_TASKS_add_main+0 
	MOVLW       hi_addr(_SEMAFORO_main+0)
	MOVWF       FARG_TASKS_add_main+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+3 
	MOVLW       3
	MOVWF       FARG_TASKS_add_id_task+0 
	MOVLW       0
	MOVWF       FARG_TASKS_add_id_task+1 
	CALL        _TASKS_add+0, 0
;main.c,19 :: 		TASKS_add(&PAINEL_COMANDO_init, &PAINEL_COMANDO_main, TASK_PAINEL_COMANDO);
	MOVLW       _PAINEL_COMANDO_init+0
	MOVWF       FARG_TASKS_add_init+0 
	MOVLW       hi_addr(_PAINEL_COMANDO_init+0)
	MOVWF       FARG_TASKS_add_init+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+3 
	MOVLW       _PAINEL_COMANDO_main+0
	MOVWF       FARG_TASKS_add_main+0 
	MOVLW       hi_addr(_PAINEL_COMANDO_main+0)
	MOVWF       FARG_TASKS_add_main+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+3 
	MOVLW       2
	MOVWF       FARG_TASKS_add_id_task+0 
	MOVLW       0
	MOVWF       FARG_TASKS_add_id_task+1 
	CALL        _TASKS_add+0, 0
;main.c,20 :: 		TASKS_add(&CONTROLE_ON_OFF_init, &CONTROLE_ON_OFF_main, TASK_CONTROLE_ON_OFF);
	MOVLW       _CONTROLE_ON_OFF_init+0
	MOVWF       FARG_TASKS_add_init+0 
	MOVLW       hi_addr(_CONTROLE_ON_OFF_init+0)
	MOVWF       FARG_TASKS_add_init+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_init+3 
	MOVLW       _CONTROLE_ON_OFF_main+0
	MOVWF       FARG_TASKS_add_main+0 
	MOVLW       hi_addr(_CONTROLE_ON_OFF_main+0)
	MOVWF       FARG_TASKS_add_main+1 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+2 
	MOVLW       0
	MOVWF       FARG_TASKS_add_main+3 
	MOVLW       6
	MOVWF       FARG_TASKS_add_id_task+0 
	MOVLW       0
	MOVWF       FARG_TASKS_add_id_task+1 
	CALL        _TASKS_add+0, 0
;main.c,23 :: 		system_init();
	CALL        _system_init+0, 0
;main.c,26 :: 		MODO_FUNCIONAMENTO_R = TASK_LIVRE;
	CLRF        _readBuffer+5 
;main.c,28 :: 		for (;;)
L_main0:
;main.c,31 :: 		if (timer0.is_finalizado[TIMER0_1MS])
	MOVF        _timer0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;main.c,33 :: 		USB_READ_BUFF();
	CALL        _HID_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _usb_available+0 
;main.c,34 :: 		timer0.is_finalizado[TIMER0_1MS] = false;
	CLRF        _timer0+0 
;main.c,35 :: 		}
L_main3:
;main.c,38 :: 		if (timer0.is_finalizado[TIMER0_3MS])
	MOVF        _timer0+2, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;main.c,40 :: 		USB_index_data();
	CALL        _USB_index_data+0, 0
;main.c,41 :: 		USB_SEND_DATA();
	MOVLW       _writeBuffer+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writeBuffer+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;main.c,42 :: 		ADC_read_all();
	CALL        _ADC_read_all+0, 0
;main.c,43 :: 		timer0.is_finalizado[TIMER0_3MS] = false;
	CLRF        _timer0+2 
;main.c,44 :: 		}
L_main4:
;main.c,45 :: 		}
	GOTO        L_main0
;main.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_system_init:

;main.c,48 :: 		void system_init()
;main.c,52 :: 		ADC_init();
	CALL        _ADC_init+0, 0
;main.c,55 :: 		GPIO_init();
	CALL        _GPIO_init+0, 0
;main.c,56 :: 		PWM_init(3E3);
	MOVLW       0
	MOVWF       FARG_PWM_init_freq_pwm+0 
	MOVLW       128
	MOVWF       FARG_PWM_init_freq_pwm+1 
	MOVLW       59
	MOVWF       FARG_PWM_init_freq_pwm+2 
	MOVLW       138
	MOVWF       FARG_PWM_init_freq_pwm+3 
	CALL        _PWM_init+0, 0
;main.c,59 :: 		USB_init();
	CALL        _USB_init+0, 0
;main.c,62 :: 		TIMER0_init(1E-3);
	MOVLW       111
	MOVWF       FARG_TIMER0_init_tempo_desejado+0 
	MOVLW       18
	MOVWF       FARG_TIMER0_init_tempo_desejado+1 
	MOVLW       3
	MOVWF       FARG_TIMER0_init_tempo_desejado+2 
	MOVLW       117
	MOVWF       FARG_TIMER0_init_tempo_desejado+3 
	CALL        _TIMER0_init+0, 0
;main.c,63 :: 		TIMER0_start(true);
	MOVLW       1
	MOVWF       FARG_TIMER0_start_val+0 
	CALL        _TIMER0_start+0, 0
;main.c,66 :: 		INTERRUPT_init();
	CALL        _INTERRUPT_init+0, 0
;main.c,88 :: 		}
L_end_system_init:
	RETURN      0
; end of _system_init
