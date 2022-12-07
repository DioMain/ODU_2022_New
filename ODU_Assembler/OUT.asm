.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "..\Debug\ODU_lib.lib"
ExitProcess PROTO:DWORD 
.stack 4096

 outnum PROTO : DWORD

 outstr PROTO : DWORD

 outstrline PROTO : DWORD

 outnumline PROTO : DWORD

 inttostr PROTO : DWORD

 concat PROTO : DWORD, : DWORD

 copy PROTO : DWORD

 system_pause PROTO 

 random PROTO  : DWORD

 strLen PROTO  : DWORD

 inputInt PROTO 

 inputString PROTO 

 inputChar PROTO 

 power PROTO : DWORD, : DWORD
.const
 null_division BYTE 'ERROR: DIVISION BY ZERO', 0
 overflow BYTE 'ERROR: VARIABLE OVERFLOW', 0 
	L1 BYTE 'STR ', 0
	L2 BYTE 'str', 0
	L3 SDWORD 1
	L4 BYTE '1 == 1', 0
	L5 SDWORD 2
	L6 BYTE '1 != 2', 0
	L7 BYTE '2 > 1', 0
	L8 BYTE '1 < 2', 0
	L9 BYTE '1 >= 1', 0
	L10 BYTE '1 <= 1', 0
	L11 BYTE 'ERROR!', 0
	L12 BYTE '2 !!= 2 AND LAYERNESS WORK!', 0
	L13 BYTE '2', 0
	L14 BYTE 'i and l', 0
	L15 BYTE '3', 0
	L16 BYTE 'l and i', 0
	L17 BYTE 'i and i', 0
	L18 SDWORD 0
	L19 SDWORD 10
	L20 BYTE ' ', 0
.data
	mainstr0 DWORD ?
	mainstr1 DWORD ?
	mainstr2 DWORD ?
	mainstr3 DWORD ?
	mainsomevar DWORD ?
	maini SDWORD 0

.code

main PROC
	push offset L1
	pop mainstr0

	push offset L2
	pop mainstr1

	push offset concat
	push mainstr0
	push mainstr1
	pop edx
	pop edx
	pop edx
	push mainstr1
	push mainstr0
		call concat
	push eax
	pop mainstr2

	push offset copy
	push mainstr1
	pop edx
	pop edx
	push mainstr1
		call copy
	push eax
	pop mainstr3


	push mainstr2
	call outstrline

	push mainstr3
	call outstrline
	mov eax, L3
	mov ebx, L3
	.IF SDWORD PTR eax  ==  SDWORD PTR ebx

	push offset L4
	call outstrline

	.ENDIF
	mov eax, L3
	mov ebx, L5
	.IF SDWORD PTR eax  !=  SDWORD PTR ebx

	push offset L6
	call outstrline

	.ENDIF
	mov eax, L5
	mov ebx, L3
	.IF SDWORD PTR eax  >  SDWORD PTR ebx

	push offset L7
	call outstrline

	.ENDIF
	mov eax, L3
	mov ebx, L5
	.IF SDWORD PTR eax  <  SDWORD PTR ebx

	push offset L8
	call outstrline

	.ENDIF
	mov eax, L3
	mov ebx, L3
	.IF SDWORD PTR eax  >=  SDWORD PTR ebx

	push offset L9
	call outstrline

	.ENDIF
	mov eax, L3
	mov ebx, L3
	.IF SDWORD PTR eax  <=  SDWORD PTR ebx

	push offset L10
	call outstrline
	mov eax, L5
	mov ebx, L5
	.IF SDWORD PTR eax  !=  SDWORD PTR ebx

	push offset L11
	call outstrline
	.ELSE

	push offset L12
	call outstrline

	.ENDIF

	.ENDIF
	push offset L13
	pop mainsomevar

	mov esi, mainsomevar
	mov edi, offset L13
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  ==  bl

	push offset L14
	call outstrline

	.ENDIF
	mov esi, offset L15
	mov edi, mainsomevar
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  !=  bl

	push offset L16
	call outstrline

	.ENDIF
	mov esi, mainsomevar
	mov edi, mainsomevar
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  ==  bl

	push offset L17
	call outstrline

	.ENDIF
	push L18
	pop maini

while1:
	mov eax, maini
	mov ebx, L19

	.IF SDWORD PTR eax  >=  SDWORD PTR ebx
		jmp endwhile1
	.ENDIF


	push maini
	call outnum

	push offset L20
	call outstr
	push maini
	push L3
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop maini

	jmp while1

endwhile1:

	push offset L20
	call outstrline
call system_pause
push 0
call ExitProcess
SOMETHINGWRONG:
push offset null_division
call outstrline
call system_pause
push -1
call ExitProcess
EXIT_OVERFLOW:
push offset overflow
call outstrline
call system_pause
push -2
call ExitProcess
main ENDP
end main