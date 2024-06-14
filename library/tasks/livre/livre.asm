
_LIVRE_init:

;livre.c,4 :: 		void LIVRE_init()
;livre.c,6 :: 		LATD = 0x00;
	CLRF        LATD+0 
;livre.c,12 :: 		}
L_end_LIVRE_init:
	RETURN      0
; end of _LIVRE_init

_LIVRE_main:

;livre.c,14 :: 		void LIVRE_main()
;livre.c,16 :: 		MODO_FUNCIONAMENTO_T = TASK_LIVRE;
	CLRF        _writeBuffer+6 
;livre.c,18 :: 		if (usb_available)
	MOVF        _usb_available+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_LIVRE_main0
;livre.c,20 :: 		LATD = (PORTD ^ USB_PORTD);
	MOVF        _readBuffer+8, 0 
	XORWF       PORTD+0, 0 
	MOVWF       LATD+0 
;livre.c,26 :: 		}
L_LIVRE_main0:
;livre.c,29 :: 		}
L_end_LIVRE_main:
	RETURN      0
; end of _LIVRE_main
