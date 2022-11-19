.586
.model flat, stdcall
includelib kernel32.lib

MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD

ExitProcess PROTO:DWORD 

.stack 4096

.const

.data

int0	DWORD 150
int1	DWORD 150
bool0	BYTE 1 
bool1	BYTE 1 
str0	BYTE "TEXT 1", 0 
str1	BYTE "TEXT 1 ", 0 
char0	BYTE 'q', 0
char1	BYTE 'q', 0

Zero	BYTE '0', 0
One		BYTE '1', 0

N			EQU 0
TITTLE		DB "Tittle", 0
EXT			DD ?

.code

main PROC

	; INT

	mov eax, int0;
	mov ebx, int1;
	.IF eax != ebx
		INVOKE MessageBoxA, N, offset One, offset TITTLE, EXT
	.ELSE
		INVOKE MessageBoxA, N, offset Zero, offset TITTLE, EXT
	.ENDIF

	; CHAR

	mov al, char0[0];
	mov bl, char1[0];
	.IF eax == ebx
		INVOKE MessageBoxA, N, offset One, offset TITTLE, EXT
	.ELSE
		INVOKE MessageBoxA, N, offset Zero, offset TITTLE, EXT
	.ENDIF

	; BOOL

	mov al, bool0;
	mov bl, bool1;
	.IF eax == ebx
		INVOKE MessageBoxA, N, offset One, offset TITTLE, EXT
	.ELSE
		INVOKE MessageBoxA, N, offset Zero, offset TITTLE, EXT
	.ENDIF
	
	; STRING

	mov esi, offset str0
	mov edi, offset str1
	mov eax, 0
	
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

	.IF eax == 2
		INVOKE MessageBoxA, N, offset One, offset TITTLE, EXT
	.ELSE 
		INVOKE MessageBoxA, N, offset Zero, offset TITTLE, EXT
	.ENDIF

	push -2
	call ExitProcess
main ENDP
end main