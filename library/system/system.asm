
_SYSTEM_init:

;system.c,3 :: 		void SYSTEM_init()
;system.c,6 :: 		GPIO_init();
	CALL        _GPIO_init+0, 0
;system.c,9 :: 		PWM_init(5E3);
	MOVLW       0
	MOVWF       FARG_PWM_init_freq_pwm+0 
	MOVLW       64
	MOVWF       FARG_PWM_init_freq_pwm+1 
	MOVLW       28
	MOVWF       FARG_PWM_init_freq_pwm+2 
	MOVLW       139
	MOVWF       FARG_PWM_init_freq_pwm+3 
	CALL        _PWM_init+0, 0
;system.c,12 :: 		USB_init();
	CALL        _USB_init+0, 0
;system.c,15 :: 		TIMER0_init();
	CALL        _TIMER0_init+0, 0
;system.c,16 :: 		TIMER0_start(true);
	MOVLW       1
	MOVWF       FARG_TIMER0_start_val+0 
	CALL        _TIMER0_start+0, 0
;system.c,19 :: 		INTERRUPT_init();
	CALL        _INTERRUPT_init+0, 0
;system.c,20 :: 		}
L_end_SYSTEM_init:
	RETURN      0
; end of _SYSTEM_init
