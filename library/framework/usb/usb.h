#ifndef __USB_H__
#define __USB_H__

#include "../inc.h"

#define USB_ISR() USB_Interrupt_Proc()
#define USB_READ() HID_Read()
#define USB_SEND_DATA() HID_Write(&writeBuffer, 64);

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
#define USB_PWM_BYTE_1 readBuffer[10]
#define USB_PWM_BYTE_2 readBuffer[11]
#define USB_PWM_GET_DUTY() ((USB_PWM_BYTE_2 << 8) | USB_PWM_BYTE_1)
#define USB_PWM_On readBuffer[12] & (1 << 0)

void USB_init();
void USB_index_data();

#endif