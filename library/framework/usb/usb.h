#ifndef __USB_H__
#define __USB_H__

//  VIDE MAPEAMENTO PARA ENCONTRAR OS ENDERECOS CORRESPONDENTE A CADA FUNCIONALIDADE
//

#include <stdbool.h>
#include "../macros/macros.h"
#include "../adc/adc.h"

#define USB_BUFFER_LENGTH 64

#define USB_ISR() USB_Interrupt_Proc()
#define USB_READ() HID_Read()
#define USB_SEND_DATA() HID_Write(&writeBuffer, USB_BUFFER_LENGTH)
#define USB_READ_BUFF() USB_variable.is_usb_available = USB_READ()

// Variaveis declaradas no usb.c
extern uint8_t readBuffer[USB_BUFFER_LENGTH];
extern uint8_t writeBuffer[USB_BUFFER_LENGTH];
extern struct {
    bool is_usb_available;
} USB_variable;


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