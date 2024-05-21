
_TASKS_init:

;tasks.c,5 :: 		void TASKS_init()
;tasks.c,7 :: 		task_function[TASK_LIVRE] = LIVRE_main;
	MOVLW       _LIVRE_main+0
	MOVWF       tasks_task_function+0 
	MOVLW       hi_addr(_LIVRE_main+0)
	MOVWF       tasks_task_function+1 
	MOVLW       0
	MOVWF       tasks_task_function+2 
	MOVLW       0
	MOVWF       tasks_task_function+3 
;tasks.c,8 :: 		task_function[TASK_BLINK_PORTD] = BLINK_PORTD_main;
	MOVLW       _BLINK_PORTD_main+0
	MOVWF       tasks_task_function+4 
	MOVLW       hi_addr(_BLINK_PORTD_main+0)
	MOVWF       tasks_task_function+5 
	MOVLW       0
	MOVWF       tasks_task_function+6 
	MOVLW       0
	MOVWF       tasks_task_function+7 
;tasks.c,9 :: 		task_function[TASK_CONTAGEM_BINARIA] = CONTAGEM_BINARIA_main;
	MOVLW       _CONTAGEM_BINARIA_main+0
	MOVWF       tasks_task_function+16 
	MOVLW       hi_addr(_CONTAGEM_BINARIA_main+0)
	MOVWF       tasks_task_function+17 
	MOVLW       0
	MOVWF       tasks_task_function+18 
	MOVLW       0
	MOVWF       tasks_task_function+19 
;tasks.c,10 :: 		task_function[TASK_CONTROLE_PID] = CONTROLE_PID_main;
	MOVLW       _CONTROLE_PID_main+0
	MOVWF       tasks_task_function+20 
	MOVLW       hi_addr(_CONTROLE_PID_main+0)
	MOVWF       tasks_task_function+21 
	MOVLW       0
	MOVWF       tasks_task_function+22 
	MOVLW       0
	MOVWF       tasks_task_function+23 
;tasks.c,11 :: 		task_function[TASK_SEMAFORO] = SEMAFORO_main;
	MOVLW       _SEMAFORO_main+0
	MOVWF       tasks_task_function+12 
	MOVLW       hi_addr(_SEMAFORO_main+0)
	MOVWF       tasks_task_function+13 
	MOVLW       0
	MOVWF       tasks_task_function+14 
	MOVLW       0
	MOVWF       tasks_task_function+15 
;tasks.c,12 :: 		task_function[TASK_PAINEL_COMANDO] = PAINEL_COMANDO_main;
	MOVLW       _PAINEL_COMANDO_main+0
	MOVWF       tasks_task_function+8 
	MOVLW       hi_addr(_PAINEL_COMANDO_main+0)
	MOVWF       tasks_task_function+9 
	MOVLW       0
	MOVWF       tasks_task_function+10 
	MOVLW       0
	MOVWF       tasks_task_function+11 
;tasks.c,13 :: 		}
L_end_TASKS_init:
	RETURN      0
; end of _TASKS_init

_TASKS_add:

;tasks.c,15 :: 		void TASKS_add(TASK_function_t func, unsigned id_task)
;tasks.c,17 :: 		task_function[id_task] = func;
	MOVF        FARG_TASKS_add_id_task+0, 0 
	MOVWF       R0 
	MOVF        FARG_TASKS_add_id_task+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       tasks_task_function+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(tasks_task_function+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG_TASKS_add_func+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_TASKS_add_func+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_TASKS_add_func+2, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_TASKS_add_func+3, 0 
	MOVWF       POSTINC1+0 
;tasks.c,18 :: 		}
L_end_TASKS_add:
	RETURN      0
; end of _TASKS_add

_TASKS_main:

;tasks.c,20 :: 		void TASKS_main()
;tasks.c,23 :: 		Flag_Usb_On;
	BSF         _writeBuffer+5, 0 
;tasks.c,26 :: 		task_function[MODO_FUNCIONAMENTO_R]();
	MOVF        _readBuffer+5, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       tasks_task_function+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(tasks_task_function+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;tasks.c,27 :: 		}
L_end_TASKS_main:
	RETURN      0
; end of _TASKS_main
