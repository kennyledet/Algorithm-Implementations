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
 * Implementation of NQueen Problem in C language. 
 */

#include<stdio.h>
#include<math.h>

int x[10];
int flag = 0;

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
		flag = 1;
		printf("The solutions are :\n");
		for(j=1; j<=n; j++)
			printf("%d ", x[j]);
		printf("\n");
	}
}

int main() {
	int n;
	printf("Enter the number of queens : ");
	scanf("%d", &n);

	nQueen(1, n);
	
	if(flag == 0)
		printf("Queens cannot be placed. Please! Try again with other number.\n");
	
	return 0;
}
