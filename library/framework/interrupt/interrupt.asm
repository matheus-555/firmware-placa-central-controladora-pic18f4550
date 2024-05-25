
_INTERRUPT_init:

;interrupt.c,5 :: 		void INTERRUPT_init()
;interrupt.c,8 :: 		clr_bit(RCON, IPEN);
	BCF         RCON+0, 7 
;interrupt.c,11 :: 		set_bit(INTCON, GIE);
	BSF         INTCON+0, 7 
;interrupt.c,12 :: 		set_bit(INTCON, PEIE);
	BSF         INTCON+0, 6 
;interrupt.c,13 :: 		}
L_end_INTERRUPT_init:
	RETURN      0
; end of _INTERRUPT_init

_interrupt:

;interrupt.c,16 :: 		void interrupt()
;interrupt.c,19 :: 		if (cmp_bit(INTCON, TMR0IF))
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;interrupt.c,22 :: 		TASKS_main();
	CALL        _TASKS_main+0, 0
;interrupt.c,28 :: 		TIMER0_ISR();
	CALL        _TIMER0_ISR+0, 0
;interrupt.c,31 :: 		clr_bit(INTCON, TMR0IF);
	BCF         INTCON+0, 2 
;interrupt.c,32 :: 		}
L_interrupt0:
;interrupt.c,35 :: 		if (cmp_bit(PIR2, USBIF))
	BTFSS       PIR2+0, 5 
	GOTO        L_interrupt1
;interrupt.c,38 :: 		USB_ISR();
	CALL        _USB_Interrupt_Proc+0, 0
;interrupt.c,41 :: 		clr_bit(PIR2, USBIF);
	BCF         PIR2+0, 5 
;interrupt.c,42 :: 		}
L_interrupt1:
;interrupt.c,43 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt
