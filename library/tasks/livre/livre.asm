
_LIVRE_main:

;livre.c,3 :: 		void LIVRE_main()
;livre.c,5 :: 		MODO_FUNCIONAMENTO_T = TASK_LIVRE;
	CLRF        _writeBuffer+6 
;livre.c,7 :: 		if (usb_available)
	MOVF        _usb_available+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_LIVRE_main0
;livre.c,9 :: 		LATD = (PORTD ^ USB_PORTD);
	MOVF        _readBuffer+8, 0 
	XORWF       PORTD+0, 0 
	MOVWF       LATD+0 
;livre.c,11 :: 		PWM_set_duty_cycle(USB_PWM_GET_DUTY());
	MOVF        _readBuffer+10, 0 
	MOVWF       FARG_PWM_set_duty_cycle_duty_porcent+0 
	CALL        _PWM_set_duty_cycle+0, 0
;livre.c,12 :: 		}
L_LIVRE_main0:
;livre.c,15 :: 		}
L_end_LIVRE_main:
	RETURN      0
; end of _LIVRE_main
