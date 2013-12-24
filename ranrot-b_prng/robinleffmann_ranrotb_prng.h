/*
    RANROT-B/32 PRNG

    Call with 1 or higher to set seed; call with 0 to fetch values.

    Robin Leffmann 2005 / <robin at stolendata dot net>
*/

#include <stdint.h>

static uint32_t rrbRand( uint32_t rrbSeed )
{
    static uint32_t rrbLo, rrbHi;

    if( rrbSeed != 0 )
    {
        rrbLo = rrbSeed;
        rrbHi = ~rrbSeed;
    }
    else
    {
        rrbHi = ( rrbHi << 16 ) + ( rrbHi >> 16 );
        rrbHi += rrbLo;
        rrbLo += rrbHi;
    }

    return rrbHi;
}
