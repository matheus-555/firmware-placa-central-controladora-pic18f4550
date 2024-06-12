#include "math.h"


uint8_t MATH_get_exponte_base_2(uint16_t valor)
{
    uint8_t expoente;

    for(expoente = 0; valor > 1; ++expoente, valor >>=1);
    
    return expoente;
}