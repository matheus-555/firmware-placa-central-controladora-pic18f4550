
_LIVRE_init:

;livre.c,4 :: 		void LIVRE_init()
;livre.c,6 :: 		LATD = 0x00;
	CLRF        LATD+0 
;livre.c,7 :: 		PWM1_set_duty_cycle(0);
	CLRF        FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;livre.c,8 :: 		PWM2_set_duty_cycle(0);
	CLRF        FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;livre.c,9 :: 		}
L_end_LIVRE_init:
	RETURN      0
; end of _LIVRE_init

_LIVRE_main:

;livre.c,11 :: 		void LIVRE_main()
;livre.c,13 :: 		MODO_FUNCIONAMENTO_T = TASK_LIVRE;
	CLRF        _writeBuffer+6 
;livre.c,15 :: 		if (usb_available)
	MOVF        _usb_available+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_LIVRE_main0
;livre.c,17 :: 		LATD = (PORTD ^ USB_PORTD);
	MOVF        _readBuffer+8, 0 
	XORWF       PORTD+0, 0 
	MOVWF       LATD+0 
;livre.c,19 :: 		PWM1_set_duty_cycle(USB_PWM1_GET_DUTY());
	MOVF        _readBuffer+10, 0 
	MOVWF       FARG_PWM1_set_duty_cycle_duty_porcent+0 
	CALL        _PWM1_set_duty_cycle+0, 0
;livre.c,20 :: 		PWM2_set_duty_cycle(USB_PWM2_GET_DUTY());
	MOVF        _readBuffer+17, 0 
	MOVWF       FARG_PWM2_set_duty_cycle_duty_porcent+0 
	CALL        _PWM2_set_duty_cycle+0, 0
;livre.c,21 :: 		}
L_LIVRE_main0:
;livre.c,24 :: 		}
L_end_LIVRE_main:
	RETURN      0
; end of _LIVRE_main
