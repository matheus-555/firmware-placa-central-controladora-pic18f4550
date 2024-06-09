
_ADC_init:

;adc.c,21 :: 		void ADC_init()
;adc.c,26 :: 		set_bit(TRISA, ADC_PIN_AD_CH_0);
	BSF         TRISA+0, 0 
;adc.c,27 :: 		set_bit(TRISA, ADC_PIN_AD_CH_1);
	BSF         TRISA+0, 1 
;adc.c,28 :: 		set_bit(TRISA, ADC_PIN_AD_CH_2);
	BSF         TRISA+0, 2 
;adc.c,30 :: 		for (i = 0; i < ADC_QTDE_CH; ++i)
	CLRF        R3 
	CLRF        R4 
L_ADC_init0:
	MOVLW       128
	XORWF       R4, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ADC_init13
	MOVLW       3
	SUBWF       R3, 0 
L__ADC_init13:
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_init1
;adc.c,31 :: 		ADC_variable.an[i] = 0;
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
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
;adc.c,30 :: 		for (i = 0; i < ADC_QTDE_CH; ++i)
	INFSNZ      R3, 1 
	INCF        R4, 1 
;adc.c,31 :: 		ADC_variable.an[i] = 0;
	GOTO        L_ADC_init0
L_ADC_init1:
;adc.c,34 :: 		ADCON1 = 0x0C;
	MOVLW       12
	MOVWF       ADCON1+0 
;adc.c,38 :: 		set_bit(ADCON2, ADFM);
	BSF         ADCON2+0, 7 
;adc.c,41 :: 		set_bit(ADCON2, ACQT2);
	BSF         ADCON2+0, 5 
;adc.c,42 :: 		set_bit(ADCON2, ACQT1);
	BSF         ADCON2+0, 4 
;adc.c,43 :: 		clr_bit(ADCON2, ACQT0);
	BCF         ADCON2+0, 3 
;adc.c,46 :: 		clr_bit(ADCON2, ADCS2);
	BCF         ADCON2+0, 2 
;adc.c,47 :: 		clr_bit(ADCON2, ADCS1);
	BCF         ADCON2+0, 1 
;adc.c,48 :: 		set_bit(ADCON2, ADCS0);
	BSF         ADCON2+0, 0 
;adc.c,51 :: 		set_bit(ADCON0, ADON);
	BSF         ADCON0+0, 0 
;adc.c,54 :: 		}
L_end_ADC_init:
	RETURN      0
; end of _ADC_init

_ADC_read_channel:

;adc.c,57 :: 		unsigned ADC_read_channel(unsigned char ch)
;adc.c,60 :: 		ADCON0 |= (ch << 2);
	MOVF        FARG_ADC_read_channel_ch+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	IORWF       ADCON0+0, 1 
;adc.c,66 :: 		MOVLW 14                //Carrega o literal 10 em WREG (1 ciclo)
	MOVLW       14
;adc.c,67 :: 		MOVWF __ASM_CICLOS      //Move WREG para o registrador __ASM_CICLOS (1 ciclo)
	MOVWF       32, 1
;adc.c,69 :: 		DELAY_LOOP:
DELAY_LOOP:
;adc.c,70 :: 		NOP                     //No Operation (1 ciclo)
	NOP
;adc.c,71 :: 		DECFSZ __ASM_CICLOS, 1  //Decrementa __ASM_CICLOS e salta se zero (2 ciclos se não saltar, 1 ciclo se saltar)
	DECFSZ      32, 1, 1
;adc.c,72 :: 		GOTO DELAY_LOOP         //Vai para DELAY_LOOP (2 ciclos)
	GOTO        DELAY_LOOP
;adc.c,77 :: 		set_bit(ADCON0, GO_DONE);
	BSF         ADCON0+0, 1 
;adc.c,80 :: 		while (cmp_bit(ADCON0, GO_DONE));
L_ADC_read_channel4:
	BTFSS       ADCON0+0, 1 
	GOTO        L_ADC_read_channel5
	GOTO        L_ADC_read_channel4
L_ADC_read_channel5:
;adc.c,83 :: 		ADCON0 &= 0x03;
	MOVLW       3
	ANDWF       ADCON0+0, 1 
;adc.c,86 :: 		return ((ADRESH << 8) + ADRESL);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
;adc.c,87 :: 		}
L_end_ADC_read_channel:
	RETURN      0
; end of _ADC_read_channel

_ADC_read_all:

;adc.c,89 :: 		void ADC_read_all()
;adc.c,100 :: 		for (canal = 0; canal < ADC_QTDE_CH; ++canal)
	CLRF        ADC_read_all_canal_L0+0 
L_ADC_read_all6:
	MOVLW       3
	SUBWF       ADC_read_all_canal_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_read_all7
;adc.c,102 :: 		tmp_val = 0;
	CLRF        ADC_read_all_tmp_val_L0+0 
	CLRF        ADC_read_all_tmp_val_L0+1 
	CLRF        ADC_read_all_tmp_val_L0+2 
	CLRF        ADC_read_all_tmp_val_L0+3 
;adc.c,104 :: 		for (i = 0; i < QTDE_LEITURA; ++i)
	CLRF        ADC_read_all_i_L0+0 
L_ADC_read_all9:
	MOVLW       16
	SUBWF       ADC_read_all_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ADC_read_all10
;adc.c,105 :: 		tmp_val += ADC_read_channel(canal);
	MOVF        ADC_read_all_canal_L0+0, 0 
	MOVWF       FARG_ADC_read_channel_ch+0 
	CALL        _ADC_read_channel+0, 0
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
;adc.c,104 :: 		for (i = 0; i < QTDE_LEITURA; ++i)
	INCF        ADC_read_all_i_L0+0, 1 
;adc.c,105 :: 		tmp_val += ADC_read_channel(canal);
	GOTO        L_ADC_read_all9
L_ADC_read_all10:
;adc.c,107 :: 		ADC_variable.an[canal] = (tmp_val / QTDE_LEITURA);
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
;adc.c,100 :: 		for (canal = 0; canal < ADC_QTDE_CH; ++canal)
	INCF        ADC_read_all_canal_L0+0, 1 
;adc.c,108 :: 		}
	GOTO        L_ADC_read_all6
L_ADC_read_all7:
;adc.c,110 :: 		}
L_end_ADC_read_all:
	RETURN      0
; end of _ADC_read_all
