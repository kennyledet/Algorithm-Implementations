/*
 * Copyleft (c) 2015 Mainak Roy Chowdhury https://about.me/mainak
 *
 * Permission is hereby granted, free of charge, to any person who receives a
 * copy of the work permission to reproduce, adapt, or distribute it, with the
 * accompanying requirement that any resulting copies or adaptations are also
 * bound by the same licensing agreement.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */
 
/*
 * Test file of the NQueen Problem in C language.
 */

#include<stdio.h>
#include<math.h>
#include<string.h>
#include<limits.h>
#include <assert.h>

int x[10];
int flag = 0;
char expected_output[149] = {"negetive numbers not allowed\nThe solutions are :\n2 4 1 3 \nThe solutions are :\n3 1 4 2 \nQueens cannot be placed. Please! Try again with other number.\n"};
char output[149] = {"\0"};

int test_assert(){
   assert(strcmp(output, expected_output) == 0);
}


int place(int k, int i) {
	int j;
	for(j=1; j<=k-1; j++) {
		if(x[j] == i || (abs(j-k)) == (abs(x[j]-i)))
			return 0;
	}
	return 1;
}

void nQueen(int k, int n) {
	int i, j;
	if(k<=n) {
		for(i=1; i<=n; i++) {
			if(place(k, i)) {
				x[k] = i;
				nQueen(k+1, n);
			}
		}
	}
	else {
		if(n>0) {
			flag = 1;
			
			char msg[] = {"The solutions are :\n"};
			strcat(output, msg);
			
			for(j=1; j<=n; j++) {
				char val[1];
				sprintf(val, "%d ", x[j]);
				strcat(output, val);
			}
			char newl[] = {"\n"};
			strcat(output, newl);
		}
		else {
			char neg_num[] = {"negetive numbers not allowed\n"};
			strcat(output, neg_num);
		}
	}
}

int main() {
	/*int n;
	printf("Enter the number of queens : ");
	scanf("%d", &n);
	
	if (n == INT_MIN || n == INT_MAX) {
		printf("Please make sure to enter an integer value as number of queens!!!\n");
		return 0;
	}

	nQueen(1, n);*/
	
	nQueen(1, 3);
	nQueen(1, -10);
	nQueen(1, 4);
	flag = 0;	
	
	if(flag == 0) {
			char not_placed[] = {"Queens cannot be placed. Please! Try again with other number.\n"};
			strcat(output, not_placed);
	}
	test_assert();
	
	return 0;
}
