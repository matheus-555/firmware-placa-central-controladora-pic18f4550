
_INTERRUPT_init:

;interrupt.c,6 :: 		void INTERRUPT_init()
;interrupt.c,9 :: 		RCON &= ~(1 << IPEN);
	BCF         RCON+0, 7 
;interrupt.c,12 :: 		INTCON |= (1 << GIE) | (1 << PEIE);
	MOVLW       192
	IORWF       INTCON+0, 1 
;interrupt.c,13 :: 		}
L_end_INTERRUPT_init:
	RETURN      0
; end of _INTERRUPT_init

_interrupt:

;interrupt.c,16 :: 		void interrupt()
;interrupt.c,19 :: 		if (INTCON & (1 << TMR0IF))
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;interrupt.c,21 :: 		TASKS_main();
	CALL        _TASKS_main+0, 0
;interrupt.c,24 :: 		TIMER0_ISR(&timer0);
	MOVLW       _timer0+0
	MOVWF       FARG_TIMER0_ISR_timer+0 
	MOVLW       hi_addr(_timer0+0)
	MOVWF       FARG_TIMER0_ISR_timer+1 
	CALL        _TIMER0_ISR+0, 0
;interrupt.c,27 :: 		INTCON &= ~(1 << TMR0IF);
	BCF         INTCON+0, 2 
;interrupt.c,28 :: 		}
L_interrupt0:
;interrupt.c,31 :: 		if (PIR2 & (1 << USBIF))
	BTFSS       PIR2+0, 5 
	GOTO        L_interrupt1
;interrupt.c,34 :: 		USB_ISR();
	CALL        _USB_Interrupt_Proc+0, 0
;interrupt.c,37 :: 		PIR2 &= ~(1 << USBIF);
	BCF         PIR2+0, 5 
;interrupt.c,38 :: 		}
L_interrupt1:
;interrupt.c,39 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt
