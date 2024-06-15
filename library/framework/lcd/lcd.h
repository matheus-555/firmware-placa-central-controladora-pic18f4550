#ifndef __LCD_H__
#define __LCD_H__

#include "../Macros/macros.h"
#include <stdint.h>

// Pinos do LCD
#define LCD_PIN_RS RE2_bit
#define LCD_PIN_EN RE1_bit
#define LCD_PIN_D4 RE0_bit
#define LCD_PIN_D5 RA5_bit
#define LCD_PIN_D6 RA4_bit
#define LCD_PIN_D7 RA3_bit


void LCD_init();

#endif