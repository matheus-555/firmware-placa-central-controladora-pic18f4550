
_ADC_inicia:

;adc.c,8 :: 		void ADC_inicia()
;adc.c,12 :: 		set_bit(TRISA, ADC_PIN_AD_CH_0);
	BSF         TRISA+0, 0 
;adc.c,13 :: 		set_bit(TRISA, ADC_PIN_AD_CH_1);
	BSF         TRISA+0, 1 
;adc.c,14 :: 		set_bit(TRISA, ADC_PIN_AD_CH_2);
	BSF         TRISA+0, 2 
;adc.c,17 :: 		ADCON1 = 0x0C;
	MOVLW       12
	MOVWF       ADCON1+0 
;adc.c,19 :: 		for (i = 0; i < ADC_QTDE_CH; ++i)
	CLRF        ADC_inicia_i_L0+0 
	CLRF        ADC_inicia_i_L0+1 
L_ADC_inicia0:
	MOVLW       128
	XORWF       ADC_inicia_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ADC_inicia7
	MOVLW       3
	SUBWF       ADC_inicia_i_L0+0, 0 
L__ADC_inicia7:
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_inicia1
;adc.c,20 :: 		ADC_variable.an[i] = 0;
	MOVF        ADC_inicia_i_L0+0, 0 
	MOVWF       R0 
	MOVF        ADC_inicia_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ADC_variable+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_ADC_variable+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;adc.c,19 :: 		for (i = 0; i < ADC_QTDE_CH; ++i)
	INFSNZ      ADC_inicia_i_L0+0, 1 
	INCF        ADC_inicia_i_L0+1, 1 
;adc.c,20 :: 		ADC_variable.an[i] = 0;
	GOTO        L_ADC_inicia0
L_ADC_inicia1:
;adc.c,27 :: 		ADC_init();
	CALL        _ADC_Init+0, 0
;adc.c,28 :: 		}
L_end_ADC_inicia:
	RETURN      0
; end of _ADC_inicia

_ADC_read_all:

;adc.c,30 :: 		void ADC_read_all()
;adc.c,34 :: 		for(i=0; i < ADC_QTDE_CH; ++i)
	CLRF        ADC_read_all_i_L0+0 
L_ADC_read_all3:
	MOVLW       3
	SUBWF       ADC_read_all_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_read_all4
;adc.c,35 :: 		ADC_variable.an[i] = ADC_LER_CANAL(i);
	MOVF        ADC_read_all_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ADC_variable+0
	ADDWF       R0, 0 
	MOVWF       FLOC__ADC_read_all+0 
	MOVLW       hi_addr(_ADC_variable+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__ADC_read_all+1 
	MOVF        ADC_read_all_i_L0+0, 0 
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVFF       FLOC__ADC_read_all+0, FSR1L+0
	MOVFF       FLOC__ADC_read_all+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;adc.c,34 :: 		for(i=0; i < ADC_QTDE_CH; ++i)
	INCF        ADC_read_all_i_L0+0, 1 
;adc.c,35 :: 		ADC_variable.an[i] = ADC_LER_CANAL(i);
	GOTO        L_ADC_read_all3
L_ADC_read_all4:
;adc.c,36 :: 		}
L_end_ADC_read_all:
	RETURN      0
; end of _ADC_read_all
