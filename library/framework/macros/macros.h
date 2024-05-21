#ifndef __MACROS_H__
#define __MACROS_H__

#define set_bit(reg, bit) (reg |= (1 << bit))
#define clr_bit(reg, bit) (reg &= ~(1 << bit))
#define tgl_bit(reg, bit) (reg ^= (1 << bit))
#define cmp_bit(reg, bit) (reg & (1 << bit))

#endif