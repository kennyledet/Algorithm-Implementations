/* C implementation of Caesar cipher algorithm
 * http://en.wikipedia.org/wiki/Caesar_cipher
 */

#include <stdio.h>

char input_string[512] = {'\0'};
int  key = 0;

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
	printf("Enter integer key to cipher (in range -26 to 26):\n");
	scanf("%d", &key);
	if (key > 26 || key < -26 || input_string[511] != '\0') {
		printf("Follow instructions\n");
		/* Show exit door when they don't follow instructions. */
		goto EXIT;
	}
	caesar_cipher(input_string, key);
	printf("Caesar Cipher text with key %d :\n", key);
	printf("%s\n", input_string);
EXIT:
	return 0;
}
