
_USB_init:

;usb.c,10 :: 		void USB_init()
;usb.c,13 :: 		HID_Enable(&readBuffer, &writeBuffer);
	MOVLW       _readBuffer+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readBuffer+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writeBuffer+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writeBuffer+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;usb.c,14 :: 		}
L_end_USB_init:
	RETURN      0
; end of _USB_init

_USB_index_data:

;usb.c,16 :: 		void USB_index_data()
;usb.c,19 :: 		writeBuffer[13] = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       1357 
;usb.c,22 :: 		writeBuffer[14] = PORTD;
	MOVF        PORTD+0, 0 
	MOVWF       1358 
;usb.c,25 :: 		writeBuffer[10] = ADC_variable.an[0];
	MOVF        _ADC_variable+0, 0 
	MOVWF       1354 
;usb.c,26 :: 		writeBuffer[11] = (ADC_variable.an[0] >> 8);
	MOVF        _ADC_variable+1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       1355 
;usb.c,29 :: 		writeBuffer[11] |= (ADC_variable.an[1] << 2);
	MOVF        _ADC_variable+2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	IORWF       R2, 0 
	MOVWF       1355 
;usb.c,30 :: 		writeBuffer[12] = (ADC_variable.an[1] >> 6);
	MOVLW       6
	MOVWF       R2 
	MOVF        _ADC_variable+2, 0 
	MOVWF       R0 
	MOVF        _ADC_variable+3, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__USB_index_data2:
	BZ          L__USB_index_data3
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	ADDLW       255
	GOTO        L__USB_index_data2
L__USB_index_data3:
	MOVF        R0, 0 
	MOVWF       1356 
;usb.c,33 :: 		writeBuffer[15] = ADC_variable.an[2];
	MOVF        _ADC_variable+4, 0 
	MOVWF       1359 
;usb.c,34 :: 		writeBuffer[16] = (ADC_variable.an[2] >> 8);
	MOVF        _ADC_variable+5, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       1360 
;usb.c,35 :: 		}
L_end_USB_index_data:
	RETURN      0
; end of _USB_index_data
