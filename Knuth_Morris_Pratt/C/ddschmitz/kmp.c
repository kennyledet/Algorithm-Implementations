/*
    Author: Darrin Schmitz
    Sources/resources to help you better understand the algorithm:
    https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm <-- code was made using the psuedocode found here.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

// Input: pattern - the word to be analyzed.
int* kmp_table(char* pattern)
{
    int pos = 2; // The current position we are computing in T.
    int cnd = 0; // The zero-based index in W of the next character of the current candidate substring.
    int* T = malloc(sizeof(int) * strlen(pattern)); // The table to be filled
    if (!T)
    {
        return NULL;
    }

    // The first few values are fixed but different from what the algorithm might suggest.
    T[0] = -1;
    T[1] = 0;
    
    while (pos < strlen(pattern))
    {
        // First case: the substring continues.
        if (pattern[pos-1] == pattern[cnd])
        {
            T[pos] = cnd + 1;
            cnd = cnd + 1;
            pos = pos + 1;
        }
        // Second case: it doesn't, but we can fall back.
        else if (cnd > 0)
        {
            cnd = T[cnd];
        }
        // Third case: we have run out of candidates.  Note cnd = 0;
        else
        {
            T[pos] = 0;
            pos = pos + 1;
        }
    }
       
    return T;
}

// Input: text - the text to be searched.
//        pattern - the pattern to find in the text.
//        T - The table made from kmp_table().
int kmp_search(char* text, char* pattern, int* T)
{
    int m = 0; // The beginning of the current match in text.
    int i = 0; // The position of the current character in pattern.
    
    while (m + i < strlen(text))
    {
        if (pattern[i] == text[m+i])
        {
            if (i == (strlen(pattern) - 1))
            {
                return m;
            }
            i++;
        }
        else
        {
            if (T[i] > -1)
            {
                m = m + i - T[i];
                i = T[i];
            }
            else
            {
                m++;
                i = 0;
            }
        }
    }
    
    // If we reach here, we have searched all of S unsuccessfully.
    return strlen(text);
}

int main(void)
{
    char text[] = "ABCdefdeGdefdefHIJ";
    char pattern[] = "defdef";
    int* T = kmp_table(pattern);
    
    if (kmp_search(text, pattern, T) == strlen(text))
    {
        printf("The pattern was not found in the string.\n");
    }
    else
    {
        printf("The pattern is found at position %d in the text.\n", kmp_search(text, pattern, T)); 
    }
    assert(kmp_search(text, pattern, T) == 9);
    
    free(T);
    return 0;
}
