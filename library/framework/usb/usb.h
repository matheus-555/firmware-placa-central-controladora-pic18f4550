#ifndef __USB_H__
#define __USB_H__

//  VIDE MAPEAMENTO PARA ENCONTRAR OS ENDERECO CORRESPONDENTE A CADA FUNCIONALIDADE
//

#include "../macros/macros.h"
#include "../adc/adc.h"

#define USB_ISR() USB_Interrupt_Proc()
#define USB_READ() HID_Read()
#define USB_SEND_DATA() HID_Write(&writeBuffer, 64)
#define USB_READ_BUFF() usb_available = USB_READ()

// Variaveis declaradas no usb.c
extern unsigned char readBuffer[64];
extern unsigned char writeBuffer[64];
extern unsigned char usb_available;

//------------------------------------------------------------------------------
// --- USB HID
// - Output
#define Flag_Usb_On (writeBuffer[5] |= (1 << 0))
#define Flag_Usb_Off (writeBuffer[5] &= ~(1 << 0))
#define Flag_SolicDados_On (writeBuffer[5] |= (1 << 1))
#define Flag_SolicDados_Off (writeBuffer[5] &= ~(1 << 1))
// - Input
//------------------------------------------------------------------------------
// ---  Modo de funionamento
// - Input
#define MODO_FUNCIONAMENTO_R (readBuffer[5])
// - Output
#define MODO_FUNCIONAMENTO_T (writeBuffer[6])
//------------------------------------------------------------------------------
//--- Mapemento de Hardware (PORTD)
#define USB_PORTD (readBuffer[8])
//------------------------------------------------------------------------------
// --- Controle PWM
#define USB_PWM1_DUTY_PORCENT readBuffer[10]
#define USB_PWM1_GET_DUTY() (USB_PWM1_DUTY_PORCENT)
#define USB_PWM2_DUTY_PORCENT readBuffer[17]
#define USB_PWM2_GET_DUTY() (USB_PWM2_DUTY_PORCENT)

void USB_init();
void USB_index_data();

#endif