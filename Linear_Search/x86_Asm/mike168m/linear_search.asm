TITLE Linear/Sequential search implemented in x86 assembly (MASM)
; Search for a value in an array of bytes by comparing each value with a key
; return the position of the key
; O(n) time complexity
; the address of the first element in the array must be in the edx
; and the arrays length in the ecx register
; the index of the key is returned in the eax register

.386	; minimum CPU required to run the program
.model flat, stdcall ; identifies the memory model for the program,
					; in this case its protected mode. It also tells which 
					; calling convention to use for procedures
.stack 4096

.data
data db 42, 40, 70, 90, 62, 70, 40 ; our array of data

.code
; implementation of sequential search
SequentialSearch PROC
	xor eax, eax 			; clear eax register just in case
BEGIN_LOOP:					
	cmp BYTE PTR[edx], bl   ; if [edx] == bl
	je FOUND				;    then goto FOUND
	inc eax                 ; else increment eax
	inc edx                 ; increment edx
	loop BEGIN_LOOP			; automatically decrements ecx register
FOUND:
	ret
SequentialSearch ENDP

; entry point
main PROC
	mov bl, 90 ; search for 92 in array
	mov edx, OFFSET data
	mov ecx, LENGTHOF data
	call SequentialSearch
main ENDP

END main
