.586
.model flat, stdcall
includelib kernel32.lib

MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD

ExitProcess PROTO:DWORD 

.stack 4096

.const

.data

int0	DWORD 0
int1	DWORD 15
bool0	BYTE 1 
bool1	BYTE 1 
str0	BYTE "TEXT 1", 0 
str1	BYTE "TEXT 1 ", 0 
char0	BYTE 'q', 0
char1	BYTE 'e', 0

Zero	BYTE '0', 0
One		BYTE '1', 0

N			EQU 0
TITTLE		DB "Tittle", 0
EXT			DD ?

.code

main PROC

	; INT

while0:
	
	mov eax, int0
	mov ebx, int1

	.IF (eax >= ebx)
		jmp endwhile0
	.ENDIF

	mov eax, int0
	inc eax
	mov int0, eax

	jmp while0

endwhile0:

	; CHAR

	; STRING
	
	.WHILE eax == 0		
		
		mov dl, [edi]
		.IF dl == 0
			mov dl, [esi]
			.IF dl == 0
				mov eax, 2
			.ENDIF
		.ENDIF

		mov dl, [edi]
		mov bl, [esi]
		.IF dl != bl
			mov eax, 1
		.ENDIF

		inc esi;
		inc edi;
	.ENDW

	push -2
	call ExitProcess
main ENDP
end main