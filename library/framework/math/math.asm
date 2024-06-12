
_MATH_get_exponte_base_2:

;math.c,4 :: 		uint8_t MATH_get_exponte_base_2(uint16_t valor)
;math.c,8 :: 		for(expoente = 0; valor > 1; ++expoente, valor >>=1);
	CLRF        R1 
L_MATH_get_exponte_base_20:
	MOVLW       0
	MOVWF       R0 
	MOVF        FARG_MATH_get_exponte_base_2_valor+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MATH_get_exponte_base_24
	MOVF        FARG_MATH_get_exponte_base_2_valor+0, 0 
	SUBLW       1
L__MATH_get_exponte_base_24:
	BTFSC       STATUS+0, 0 
	GOTO        L_MATH_get_exponte_base_21
	INCF        R1, 1 
	RRCF        FARG_MATH_get_exponte_base_2_valor+1, 1 
	RRCF        FARG_MATH_get_exponte_base_2_valor+0, 1 
	BCF         FARG_MATH_get_exponte_base_2_valor+1, 7 
	GOTO        L_MATH_get_exponte_base_20
L_MATH_get_exponte_base_21:
;math.c,10 :: 		return expoente;
	MOVF        R1, 0 
	MOVWF       R0 
;math.c,11 :: 		}
L_end_MATH_get_exponte_base_2:
	RETURN      0
; end of _MATH_get_exponte_base_2
