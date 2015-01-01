/* C implementation of ROT13 cipher algorithm
 * http://en.wikipedia.org/wiki/ROT13
 */

#include <stdio.h>

char input_string[512] = {'\0'};

void caesar_cipher(char *input_string, int key)
{
	while(*input_string) {
		if ((*input_string + key) > 'Z' && *input_string <= 'Z') {
			*input_string = *input_string -'Z' + 'A' + key - 1;
		} else if ((*input_string + key) > 'z' && *input_string <= 'z') {
			*input_string = *input_string -'z' + 'a' + key - 1;
		} else if ((*input_string + key) < 'A' && *input_string >= 'A') {
			*input_string = *input_string -'A' + 'Z' + key + 1;
		} else if ((*input_string + key) < 'a' && *input_string >= 'a') {
			*input_string = *input_string -'a' + 'z' + key + 1;
		} else if ((*input_string >= 'A' && *input_string <= 'Z') ||
			   (*input_string >= 'a' && *input_string <= 'z')) {
			*input_string = *input_string + key;
		}
		input_string++;
	}
}

int main()
{
	printf("Enter plain text to cipher (max length 511 character):\n");
	gets(input_string);
	if (input_string[511] != '\0') {
		printf("Follow instructions\n");
		/* Show exit door when they don't follow instructions. */
		goto EXIT;
	}
	/* ROT13 is caesar cipher with key 13 */
	caesar_cipher(input_string, 13);
	printf("ROT13 Cipher text:\n");
	printf("%s\n", input_string);
EXIT:
	return 0;
}
