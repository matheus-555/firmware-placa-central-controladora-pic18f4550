
_GPIO_init:

;gpio.c,4 :: 		void GPIO_init()
;gpio.c,7 :: 		TRISA    = 0xB7;
	MOVLW       183
	MOVWF       TRISA+0 
;gpio.c,10 :: 		TRISB    = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;gpio.c,13 :: 		clr_bit(INTCON2, RBPU);
	BCF         INTCON2+0, 7 
;gpio.c,16 :: 		TRISD    = 0x00;
	CLRF        TRISD+0 
;gpio.c,19 :: 		LATD     = 0x00;
	CLRF        LATD+0 
;gpio.c,20 :: 		}
L_end_GPIO_init:
	RETURN      0
; end of _GPIO_init
