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
	L1 SDWORD 0
	L2 SDWORD -1
	L3 DWORD 1
	L4 DWORD 0
	L5 SDWORD 100
	L6 SDWORD 5
	L7 BYTE 'Please input your name: ', 0
	L8 BYTE ' ', 0
	L9 BYTE 'NEW ENEMY!', 0
	L10 SDWORD 30
	L11 SDWORD 15
	L12 BYTE 'Enemy hp = ', 0
	L13 BYTE ' hp = ', 0
	L14 BYTE 'COMMANDS:', 0
	L15 BYTE 'f - FIGTH, d - DEFENCE', 0
	L16 BYTE 'f', 0
	L17 BYTE 'd', 0
	L18 SDWORD 2
	L19 BYTE 'Unknown command!', 0
	L20 BYTE 'You kill the enemy!', 0
	L21 BYTE 'GAME OVER', 0
.data
	_GetDamagerand0 SDWORD 0
	_GetDamagerand1 SDWORD 0
	_GetDamageGDresult SDWORD 0
	mainIsAlive DWORD 0
	mainIsHaveEnemy DWORD 0
	mainIsHaveCommand DWORD 0
	mainCommand DWORD ?
	mainPlayerName DWORD ?
	mainPlayerHp SDWORD 0
	mainPlayerDamage SDWORD 0
	mainFightsCount SDWORD 0
	mainEnemyHpBuf SDWORD 0
	mainEnemyDamageBuf SDWORD 0

.code

_GetDamage PROC _GetDamagedmg :  SDWORD 
	push random
	push _GetDamagedmg
	pop edx
	pop edx
	push _GetDamagedmg
		call random
	push eax
	pop _GetDamagerand0

	push random
	push _GetDamagedmg
	pop edx
	pop edx
	push _GetDamagedmg
		call random
	push eax
	pop _GetDamagerand1

	push _GetDamagedmg
	push random
	push _GetDamagedmg
	pop edx
	pop edx
	push _GetDamagedmg
		call random
	push eax
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	push _GetDamagerand1
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop _GetDamageGDresult

	mov eax, _GetDamageGDresult
	mov ebx, L1
	.IF SDWORD PTR eax  <  SDWORD PTR ebx
	push _GetDamageGDresult
	push L2
	pop eax
	pop ebx
	imul ebx
	jo EXIT_OVERFLOW
	push eax
	pop _GetDamageGDresult


	.ENDIF
	mov eax, _GetDamageGDresult
	ret

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
_GetDamage ENDP
main PROC
	push L3
	pop mainIsAlive

	push L4
	pop mainIsHaveEnemy

	push L4
	pop mainIsHaveCommand

	push L5
	pop mainPlayerHp

	push L6
	pop mainPlayerDamage

	push L1
	pop mainFightsCount


	push offset L7
	call outstr
	push offset inputString
	pop edx
		call inputString
	push eax
	pop mainPlayerName


	push offset L8
	call outstrline
while1:
	mov eax, mainIsAlive
	mov ebx, L3

	.IF eax  !=  ebx
		jmp endwhile1
	.ENDIF

	push L4
	pop mainIsHaveCommand

	mov eax, mainIsHaveEnemy
	mov ebx, L4
	.IF eax  ==  ebx

	push offset L8
	call outstrline

	push offset L9
	call outstrline

	push offset L8
	call outstrline
	push random
	push L10
	pop edx
	pop edx
	push L10
		call random
	push eax
	pop mainEnemyHpBuf

	push random
	push L11
	pop edx
	pop edx
	push L11
		call random
	push eax
	pop mainEnemyDamageBuf

	push L3
	pop mainIsHaveEnemy


	.ENDIF

	push offset L12
	call outstr

	push mainEnemyHpBuf
	call outnumline

	push offset L8
	call outstrline

	push mainPlayerName
	call outstr

	push offset L13
	call outstr

	push mainPlayerHp
	call outnumline

	push offset L8
	call outstrline

	push offset L14
	call outstrline

	push offset L15
	call outstrline
	push offset inputChar
	pop edx
		call inputChar
	push eax
	pop mainCommand

	mov esi, mainCommand
	mov edi, offset L16
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  ==  bl
	push mainEnemyHpBuf
	push _GetDamage
	push mainPlayerDamage
	pop edx
	pop edx
	push mainPlayerDamage
		call _GetDamage
	push eax
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop mainEnemyHpBuf

	push mainPlayerHp
	push _GetDamage
	push mainEnemyDamageBuf
	pop edx
	pop edx
	push mainEnemyDamageBuf
		call _GetDamage
	push eax
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop mainPlayerHp

	push L3
	pop mainIsHaveCommand


	.ENDIF
	mov esi, mainCommand
	mov edi, offset L17
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  ==  bl
	push mainPlayerHp
	push _GetDamage
	push mainEnemyDamageBuf
	pop edx
	pop edx
	push mainEnemyDamageBuf
		call _GetDamage
	push eax
	push L18
	pop ebx
	pop eax
	cmp ebx,0
	je SOMETHINGWRONG
	cdq
	idiv ebx
	push eax
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop mainPlayerHp

	push L3
	pop mainIsHaveCommand


	.ENDIF
	mov eax, mainIsHaveCommand
	mov ebx, L4
	.IF eax  ==  ebx

	push offset L19
	call outstrline

	.ENDIF
	mov eax, mainEnemyHpBuf
	mov ebx, L1
	.IF SDWORD PTR eax  <=  SDWORD PTR ebx

	push offset L20
	call outstrline
	push L4
	pop mainIsHaveEnemy


	.ENDIF
	mov eax, mainPlayerHp
	mov ebx, L1
	.IF SDWORD PTR eax  <=  SDWORD PTR ebx
	push L4
	pop mainIsAlive


	.ENDIF
	jmp while1

endwhile1:

	push offset L8
	call outstrline

	push offset L21
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