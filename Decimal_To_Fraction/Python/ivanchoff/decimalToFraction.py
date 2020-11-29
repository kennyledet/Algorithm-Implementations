# Module that cast a decimal number to fraction notation
# Input:
#    number: number to cast
# return:
#    tuple[0]: is the error, None is returned when the process has no error
#              otherwise a string with message of error is returned
#    tuple[1]: is number in fraction notation


from fractions import Fraction

def decimalToFraction(number):
    if(isinstance(number,(int,float))):
        ans = Fraction(number).limit_denominator()
        return (None,str(ans))
    else:
        return ('error','arg must be number')

if __name__ == '__main__':
    print(decimalToFraction(3.45))

