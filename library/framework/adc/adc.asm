
_ADC_inicia:

;adc.c,12 :: 		void ADC_inicia()
;adc.c,16 :: 		set_bit(TRISA, ADC_PIN_AD_CH_0);
	BSF         TRISA+0, 0 
;adc.c,17 :: 		set_bit(TRISA, ADC_PIN_AD_CH_1);
	BSF         TRISA+0, 1 
;adc.c,18 :: 		set_bit(TRISA, ADC_PIN_AD_CH_2);
	BSF         TRISA+0, 2 
;adc.c,21 :: 		ADCON1 = 0x0C;
	MOVLW       12
	MOVWF       ADCON1+0 
;adc.c,23 :: 		for (i = 0; i < ADC_QTDE_CH; ++i)
	CLRF        ADC_inicia_i_L0+0 
	CLRF        ADC_inicia_i_L0+1 
L_ADC_inicia0:
	MOVLW       128
	XORWF       ADC_inicia_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ADC_inicia10
	MOVLW       3
	SUBWF       ADC_inicia_i_L0+0, 0 
L__ADC_inicia10:
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_inicia1
;adc.c,24 :: 		ADC_variable.an[i] = 0;
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
;adc.c,23 :: 		for (i = 0; i < ADC_QTDE_CH; ++i)
	INFSNZ      ADC_inicia_i_L0+0, 1 
	INCF        ADC_inicia_i_L0+1, 1 
;adc.c,24 :: 		ADC_variable.an[i] = 0;
	GOTO        L_ADC_inicia0
L_ADC_inicia1:
;adc.c,31 :: 		ADC_init();
	CALL        _ADC_Init+0, 0
;adc.c,32 :: 		}
L_end_ADC_inicia:
	RETURN      0
; end of _ADC_inicia

_ADC_read_all:

;adc.c,34 :: 		void ADC_read_all()
;adc.c,45 :: 		for (canal = 0; canal < ADC_QTDE_CH; ++canal)
	CLRF        ADC_read_all_canal_L0+0 
L_ADC_read_all3:
	MOVLW       3
	SUBWF       ADC_read_all_canal_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_read_all4
;adc.c,47 :: 		tmp_val = 0;
	CLRF        ADC_read_all_tmp_val_L0+0 
	CLRF        ADC_read_all_tmp_val_L0+1 
	CLRF        ADC_read_all_tmp_val_L0+2 
	CLRF        ADC_read_all_tmp_val_L0+3 
;adc.c,49 :: 		for (i = 0; i < QTDE_LEITURA; ++i)
	CLRF        ADC_read_all_i_L0+0 
L_ADC_read_all6:
	MOVLW       16
	SUBWF       ADC_read_all_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_read_all7
;adc.c,50 :: 		tmp_val += ADC_LER_CANAL(canal);
	MOVF        ADC_read_all_canal_L0+0, 0 
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVF        ADC_read_all_tmp_val_L0+0, 0 
	MOVWF       R4 
	MOVF        ADC_read_all_tmp_val_L0+1, 0 
	MOVWF       R5 
	MOVF        ADC_read_all_tmp_val_L0+2, 0 
	MOVWF       R6 
	MOVF        ADC_read_all_tmp_val_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       ADC_read_all_tmp_val_L0+0 
	MOVF        R1, 0 
	MOVWF       ADC_read_all_tmp_val_L0+1 
	MOVF        R2, 0 
	MOVWF       ADC_read_all_tmp_val_L0+2 
	MOVF        R3, 0 
	MOVWF       ADC_read_all_tmp_val_L0+3 
;adc.c,49 :: 		for (i = 0; i < QTDE_LEITURA; ++i)
	INCF        ADC_read_all_i_L0+0, 1 
;adc.c,50 :: 		tmp_val += ADC_LER_CANAL(canal);
	GOTO        L_ADC_read_all6
L_ADC_read_all7:
;adc.c,52 :: 		ADC_variable.an[canal] = (tmp_val/QTDE_LEITURA);
	MOVF        ADC_read_all_canal_L0+0, 0 
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
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	MOVF        ADC_read_all_tmp_val_L0+0, 0 
	MOVWF       R0 
	MOVF        ADC_read_all_tmp_val_L0+1, 0 
	MOVWF       R1 
	MOVF        ADC_read_all_tmp_val_L0+2, 0 
	MOVWF       R2 
	MOVF        ADC_read_all_tmp_val_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVFF       FLOC__ADC_read_all+0, FSR1L+0
	MOVFF       FLOC__ADC_read_all+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;adc.c,45 :: 		for (canal = 0; canal < ADC_QTDE_CH; ++canal)
	INCF        ADC_read_all_canal_L0+0, 1 
;adc.c,53 :: 		}
	GOTO        L_ADC_read_all3
L_ADC_read_all4:
;adc.c,55 :: 		}
L_end_ADC_read_all:
	RETURN      0
; end of _ADC_read_all
