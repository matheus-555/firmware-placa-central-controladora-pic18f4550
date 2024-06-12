
_TASKS_add:

;tasks.c,10 :: 		void TASKS_add(TASK_function_t init, TASK_function_t main, uint8_t id_task)
;tasks.c,12 :: 		task_kernel.init[id_task] = init;
	MOVF        FARG_TASKS_add_id_task+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       tasks_task_kernel+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(tasks_task_kernel+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG_TASKS_add_init+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_TASKS_add_init+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_TASKS_add_init+2, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_TASKS_add_init+3, 0 
	MOVWF       POSTINC1+0 
;tasks.c,13 :: 		task_kernel.main[id_task] = main;
	MOVF        FARG_TASKS_add_id_task+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       tasks_task_kernel+28
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(tasks_task_kernel+28)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG_TASKS_add_main+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_TASKS_add_main+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_TASKS_add_main+2, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_TASKS_add_main+3, 0 
	MOVWF       POSTINC1+0 
;tasks.c,14 :: 		}
L_end_TASKS_add:
	RETURN      0
; end of _TASKS_add

_TASKS_main:

;tasks.c,16 :: 		void TASKS_main()
;tasks.c,21 :: 		Flag_Usb_On;
	BSF         _writeBuffer+5, 0 
;tasks.c,27 :: 		}
L_TASKS_main0:
;tasks.c,30 :: 		DEBUG_LIGA_PIN();
	BSF         LATC+0, 6 
;tasks.c,34 :: 		task_kernel.main[MODO_FUNCIONAMENTO_R]();
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
	MOVLW       tasks_task_kernel+28
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(tasks_task_kernel+28)
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
;tasks.c,37 :: 		DEBUG_DESLIGA_PIN();
	BCF         LATC+0, 6 
;tasks.c,39 :: 		}
L_end_TASKS_main:
	RETURN      0
; end of _TASKS_main
