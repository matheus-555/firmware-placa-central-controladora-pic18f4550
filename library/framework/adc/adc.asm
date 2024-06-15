
_ADC_init:

;adc.c,24 :: 		void ADC_init()
;adc.c,29 :: 		ADC_QTDE_LEITURA_BINARIO = MATH_get_exponte_base_2((uint16_t) ADC_QTDE_LEITURA);
	MOVLW       16
	MOVWF       FARG_MATH_get_exponte_base_2_valor+0 
	MOVLW       0
	MOVWF       FARG_MATH_get_exponte_base_2_valor+1 
	CALL        _MATH_get_exponte_base_2+0, 0
	MOVF        R0, 0 
	MOVWF       adc_ADC_QTDE_LEITURA_BINARIO+0 
;adc.c,33 :: 		set_bit(TRISA, ADC_PIN_AD_CH_0);
	BSF         TRISA+0, 0 
;adc.c,34 :: 		set_bit(TRISA, ADC_PIN_AD_CH_1);
	BSF         TRISA+0, 1 
;adc.c,35 :: 		set_bit(TRISA, ADC_PIN_AD_CH_2);
	BSF         TRISA+0, 2 
;adc.c,38 :: 		ADCON1 = 0x0C;
	MOVLW       12
	MOVWF       ADCON1+0 
;adc.c,40 :: 		for (i = 0; i < ADC_QTDE_CH; ++i)
	CLRF        ADC_init_i_L0+0 
	CLRF        ADC_init_i_L0+1 
L_ADC_init0:
	MOVLW       128
	XORWF       ADC_init_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ADC_init13
	MOVLW       3
	SUBWF       ADC_init_i_L0+0, 0 
L__ADC_init13:
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_init1
;adc.c,41 :: 		ADC_variable.an[i] = 0;
	MOVF        ADC_init_i_L0+0, 0 
	MOVWF       R0 
	MOVF        ADC_init_i_L0+1, 0 
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
;adc.c,40 :: 		for (i = 0; i < ADC_QTDE_CH; ++i)
	INFSNZ      ADC_init_i_L0+0, 1 
	INCF        ADC_init_i_L0+1, 1 
;adc.c,41 :: 		ADC_variable.an[i] = 0;
	GOTO        L_ADC_init0
L_ADC_init1:
;adc.c,45 :: 		set_bit(ADCON2, ADFM);
	BSF         ADCON2+0, 7 
;adc.c,48 :: 		clr_bit(ADCON2, ACQT2);
	BCF         ADCON2+0, 5 
;adc.c,49 :: 		set_bit(ADCON2, ACQT1);
	BSF         ADCON2+0, 4 
;adc.c,50 :: 		clr_bit(ADCON2, ACQT0);
	BCF         ADCON2+0, 3 
;adc.c,53 :: 		set_bit(ADCON2, ADCS2);
	BSF         ADCON2+0, 2 
;adc.c,54 :: 		clr_bit(ADCON2, ADCS1);
	BCF         ADCON2+0, 1 
;adc.c,55 :: 		clr_bit(ADCON2, ADCS0);
	BCF         ADCON2+0, 0 
;adc.c,58 :: 		set_bit(ADCON0, ADON);
	BSF         ADCON0+0, 0 
;adc.c,59 :: 		}
L_end_ADC_init:
	RETURN      0
; end of _ADC_init

_ADC_read_channel:

;adc.c,64 :: 		uint16_t ADC_read_channel(uint8_t ch)
;adc.c,67 :: 		ADCON0 |= (ch << 2);
	MOVF        FARG_ADC_read_channel_ch+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	IORWF       ADCON0+0, 1 
;adc.c,76 :: 		MOVLW __ASM_QTDE_CICLO            //Carrega o literal 10 em WREG (1 ciclo)
	MOVLW       6
;adc.c,77 :: 		MOVWF __ASM_REG_AUX //Move WREG para o registrador __ASM_REG_AUX (1 ciclo)
	MOVWF       R20, 1
;adc.c,78 :: 		DELAY_LOOP:
DELAY_LOOP:
;adc.c,79 :: 		NOP                     //No Operation (1 ciclo)
	NOP
;adc.c,80 :: 		DECFSZ __ASM_REG_AUX, 1 //Decrementa __ASM_REG_AUX e salta se zero (2 ciclos se não saltar, 1 ciclo se saltar)
	DECFSZ      R20, 1, 1
;adc.c,81 :: 		GOTO DELAY_LOOP         //Vai para DELAY_LOOP (2 ciclos)
	GOTO        DELAY_LOOP
;adc.c,82 :: 		NOP                     //No Operation (1 ciclo)
	NOP
;adc.c,83 :: 		NOP                     //No Operation (1 ciclo)
	NOP
;adc.c,84 :: 		NOP                     //No Operation (1 ciclo)
	NOP
;adc.c,90 :: 		set_bit(ADCON0, GO_DONE);
	BSF         ADCON0+0, 1 
;adc.c,93 :: 		while (cmp_bit(ADCON0, GO_DONE));
L_ADC_read_channel4:
	BTFSS       ADCON0+0, 1 
	GOTO        L_ADC_read_channel5
	GOTO        L_ADC_read_channel4
L_ADC_read_channel5:
;adc.c,96 :: 		ADCON0 &= 0x03;
	MOVLW       3
	ANDWF       ADCON0+0, 1 
;adc.c,99 :: 		return (ADRESH << 8) | ADRESL;
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	IORWF       R0, 1 
	MOVLW       0
	IORWF       R1, 1 
;adc.c,100 :: 		}
L_end_ADC_read_channel:
	RETURN      0
; end of _ADC_read_channel

_ADC_read_all:

;adc.c,105 :: 		void ADC_read_all()
;adc.c,116 :: 		for (canal = 0; canal < ADC_QTDE_CH; ++canal)
	CLRF        ADC_read_all_canal_L0+0 
	CLRF        ADC_read_all_canal_L0+1 
L_ADC_read_all6:
	MOVLW       128
	XORWF       ADC_read_all_canal_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ADC_read_all16
	MOVLW       3
	SUBWF       ADC_read_all_canal_L0+0, 0 
L__ADC_read_all16:
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_read_all7
;adc.c,118 :: 		tmp_val = 0;
	CLRF        ADC_read_all_tmp_val_L0+0 
	CLRF        ADC_read_all_tmp_val_L0+1 
;adc.c,120 :: 		for (i = 0; i < ADC_QTDE_LEITURA; ++i)
	CLRF        ADC_read_all_i_L0+0 
	CLRF        ADC_read_all_i_L0+1 
L_ADC_read_all9:
	MOVLW       128
	XORWF       ADC_read_all_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ADC_read_all17
	MOVLW       16
	SUBWF       ADC_read_all_i_L0+0, 0 
L__ADC_read_all17:
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_read_all10
;adc.c,121 :: 		tmp_val += ADC_read_channel(canal);
	MOVF        ADC_read_all_canal_L0+0, 0 
	MOVWF       FARG_ADC_read_channel_ch+0 
	CALL        _ADC_read_channel+0, 0
	MOVF        R0, 0 
	ADDWF       ADC_read_all_tmp_val_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      ADC_read_all_tmp_val_L0+1, 1 
;adc.c,120 :: 		for (i = 0; i < ADC_QTDE_LEITURA; ++i)
	INFSNZ      ADC_read_all_i_L0+0, 1 
	INCF        ADC_read_all_i_L0+1, 1 
;adc.c,121 :: 		tmp_val += ADC_read_channel(canal);
	GOTO        L_ADC_read_all9
L_ADC_read_all10:
;adc.c,123 :: 		ADC_variable.an[canal] = (tmp_val >> ADC_QTDE_LEITURA_BINARIO);
	MOVF        ADC_read_all_canal_L0+0, 0 
	MOVWF       R0 
	MOVF        ADC_read_all_canal_L0+1, 0 
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
	MOVF        adc_ADC_QTDE_LEITURA_BINARIO+0, 0 
	MOVWF       R2 
	MOVF        ADC_read_all_tmp_val_L0+0, 0 
	MOVWF       R0 
	MOVF        ADC_read_all_tmp_val_L0+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__ADC_read_all18:
	BZ          L__ADC_read_all19
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	ADDLW       255
	GOTO        L__ADC_read_all18
L__ADC_read_all19:
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;adc.c,116 :: 		for (canal = 0; canal < ADC_QTDE_CH; ++canal)
	INFSNZ      ADC_read_all_canal_L0+0, 1 
	INCF        ADC_read_all_canal_L0+1, 1 
;adc.c,124 :: 		}
	GOTO        L_ADC_read_all6
L_ADC_read_all7:
;adc.c,126 :: 		}
L_end_ADC_read_all:
	RETURN      0
; end of _ADC_read_all
