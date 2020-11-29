from decimalToFraction import decimalToFraction

test_input = [2.34, 2.45, "hola", "mundo", 3.90]
test_output_err = [None, None, 'error', 'error', None]

for number, error  in zip(test_input,test_output_err):
    ans = decimalToFraction(number)
    if(ans[0] != error):
        print('the code is wrong!!')
    else:
        print(number,' -> ',ans[1])
    
