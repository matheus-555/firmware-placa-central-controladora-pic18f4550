#include "usb.h"

uint8_t readBuffer[USB_BUFFER_LENGTH]  absolute 0x500;
uint8_t writeBuffer[USB_BUFFER_LENGTH] absolute 0x540;
struct {
    bool is_usb_available;
} USB_variable;


void USB_init()
{
    // Habilita comunicacao USB HID
    HID_Enable(&readBuffer, &writeBuffer);
}

void USB_index_data()
{
    // Envia status do byte PB
    writeBuffer[13] = PORTB;

    // Envia status do byte PD
    writeBuffer[14] = PORTD;

    // Obtem valor do AN0
    writeBuffer[10] = ADC_variable.an[0];
    writeBuffer[11] = (ADC_variable.an[0] >> 8);

    // // Obtem valor do AN1
    writeBuffer[11] |= (ADC_variable.an[1] << 2);
    writeBuffer[12] = (ADC_variable.an[1] >> 6);

    // Obtem valor do AN2
    writeBuffer[15] = ADC_variable.an[2];
    writeBuffer[16] = (ADC_variable.an[2] >> 8);
}
