
_LIVRE_init:

;livre.c,4 :: 		void LIVRE_init()
;livre.c,6 :: 		MODO_FUNCIONAMENTO_T = TASK_LIVRE;
	CLRF        _writeBuffer+6 
;livre.c,8 :: 		LATD = 0x00;
	CLRF        LATD+0 
;livre.c,11 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;livre.c,12 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;livre.c,14 :: 		}
L_end_LIVRE_init:
	RETURN      0
; end of _LIVRE_init

_LIVRE_main:

;livre.c,16 :: 		void LIVRE_main()
;livre.c,18 :: 		if (USB_variable.is_usb_available)
	MOVF        _USB_variable+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_LIVRE_main0
;livre.c,20 :: 		LATD = (PORTD ^ USB_PORTD);
	MOVF        _readBuffer+8, 0 
	XORWF       PORTD+0, 0 
	MOVWF       LATD+0 
;livre.c,23 :: 		PWM1_set_duty_cycle(USB_PWM1_GET_DUTY());
	MOVF        _readBuffer+10, 0 
	MOVWF       FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;livre.c,24 :: 		PWM2_set_duty_cycle(USB_PWM2_GET_DUTY());
	MOVF        _readBuffer+17, 0 
	MOVWF       FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;livre.c,26 :: 		}
L_LIVRE_main0:
;livre.c,29 :: 		}
L_end_LIVRE_main:
	RETURN      0
; end of _LIVRE_main
