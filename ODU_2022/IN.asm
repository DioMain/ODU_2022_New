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
	L1 SDWORD 2
	L2 SDWORD 5
	L3 SDWORD 0
	L4 BYTE 'Anton', 0
	L5 SDWORD 1
	L6 BYTE 'Dima', 0
	L7 BYTE 'Andrey', 0
	L8 SDWORD 3
	L9 BYTE 'Jotaro', 0
	L10 SDWORD 4
	L11 BYTE 'Nikita', 0
	L12 BYTE 'Default case', 0
	L13 DWORD 1
	L14 DWORD 0
	L15 SDWORD 100
	L16 BYTE 'a - attack, h - healing [-5 money], p - exit [NO CAPSLOCK]', 0
	L17 BYTE 'Enter your nick name: ', 0
	L18 BYTE 'Name length: ', 0
	L19 SDWORD 6
	L20 SDWORD 25
	L21 BYTE '<---------------------------------------------->', 0
	L22 BYTE ' : ', 0
	L23 BYTE 'HEAL = ', 0
	L24 BYTE 'MONEY = ', 0
	L25 BYTE ';', 0
	L26 BYTE ' ', 0
	L27 BYTE 'ENEMY: ', 0
	L28 BYTE 'DAMAGE = ', 0
	L29 BYTE 'a - Attack, h - healing, p - exit', 0
	L30 BYTE ': ', 0
	L31 BYTE 'a', 0
	L32 BYTE 'h', 0
	L33 BYTE 'You healing on 20 hp!', 0
	L34 SDWORD 20
	L35 BYTE 'You dont have money!', 0
	L36 BYTE 'p', 0
	L37 BYTE 'You take ', 0
	L38 BYTE ' dmg!', 0
	L39 BYTE 'You killed the enemy!', 0
	L40 BYTE 'You lose!', 0
	L41 BYTE 'You killed: ', 0
	L42 BYTE 'Game over!', 0
.data
	_getDamageresult SDWORD 0
	_getNamerandnum SDWORD 0
	mainisOpen DWORD 0
	mainisChosed DWORD 0
	mainkey DWORD ?
	mainPlayerName DWORD ?
	mainPlayerMoney SDWORD 0
	mainPlayerHeal SDWORD 0
	mainPlayerHealMax SDWORD 0
	mainPlayerDmg SDWORD 0
	mainPlayerKills SDWORD 0
	mainEnemyName DWORD ?
	mainEnemyHeal SDWORD 0
	mainEnemyDamage SDWORD 0
	mainEnemyDmgBuf SDWORD 0
	mainnameBuffer DWORD ?
	mainnameLenght SDWORD 0
	mainnameLenghtStr DWORD ?
	maindevoutput DWORD ?

.code

_getDamage PROC _getDamagedmg :  SDWORD 
	push random
	push _getDamagedmg
	pop edx
	pop edx
	push _getDamagedmg
		call random
	push eax
	push _getDamagedmg
	push L1
	pop ebx
	pop eax
	cmp ebx,0
	je SOMETHINGWRONG
	cdq
	idiv ebx
	push eax
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop _getDamageresult

	mov eax, _getDamageresult
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
_getDamage ENDP
_getName PROC 
	push random
	push L2
	pop edx
	pop edx
	push L2
		call random
	push eax
	pop _getNamerandnum

	mov eax, _getNamerandnum
	mov ebx, L3
	.IF SDWORD PTR eax  ==  SDWORD PTR ebx
	mov eax,offset L4
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

	.ENDIF
	mov eax, _getNamerandnum
	mov ebx, L5
	.IF SDWORD PTR eax  ==  SDWORD PTR ebx
	mov eax,offset L6
	ret

	.ENDIF
	mov eax, _getNamerandnum
	mov ebx, L1
	.IF SDWORD PTR eax  ==  SDWORD PTR ebx
	mov eax,offset L7
	ret

	.ENDIF
	mov eax, _getNamerandnum
	mov ebx, L8
	.IF SDWORD PTR eax  ==  SDWORD PTR ebx
	mov eax,offset L9
	ret

	.ENDIF
	mov eax, _getNamerandnum
	mov ebx, L10
	.IF SDWORD PTR eax  ==  SDWORD PTR ebx
	mov eax,offset L11
	ret

	.ENDIF
	mov eax,offset L12
	ret
_getName ENDP
_Clamp PROC _Clampvalue :  SDWORD , _Clampmin :  SDWORD , _Clampmax :  SDWORD 
	mov eax, _Clampvalue
	mov ebx, _Clampmax
	.IF SDWORD PTR eax  >  SDWORD PTR ebx
	push _Clampmax
	pop _Clampvalue

	.ELSE
	mov eax, _Clampvalue
	mov ebx, _Clampmin
	.IF SDWORD PTR eax  <  SDWORD PTR ebx
	push _Clampmin
	pop _Clampvalue


	.ENDIF

	.ENDIF
	mov eax, _Clampvalue
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
_Clamp ENDP
main PROC
	push L13
	pop mainisOpen

	push L14
	pop mainisChosed

	push L15
	pop mainPlayerHealMax

	push L2
	pop mainPlayerDmg

	push L3
	pop mainPlayerKills

	push L3
	pop mainEnemyHeal

	push L3
	pop mainEnemyDamage


	push offset L16
	call outstrline

	push offset L17
	call outstr
	push offset inputString
	pop edx
		call inputString
	push eax
	pop mainnameBuffer

	push strLen
	push mainnameBuffer
	pop edx
	pop edx
	push mainnameBuffer
		call strLen
	push eax
	pop mainnameLenght

	push offset intToStr
	push mainnameLenght
	pop edx
	pop edx
	push mainnameLenght
		call intToStr
	push eax
	pop mainnameLenghtStr

	push offset concat
	push offset L18
	push mainnameLenghtStr
	pop edx
	pop edx
	pop edx
	push mainnameLenghtStr
	push offset L18
		call concat
	push eax
	pop maindevoutput


	push maindevoutput
	call outstrline
	push offset copy
	push mainnameBuffer
	pop edx
	pop edx
	push mainnameBuffer
		call copy
	push eax
	pop mainPlayerName

	push mainPlayerHealMax
	pop mainPlayerHeal

	push random
	push L2
	pop edx
	pop edx
	push L2
		call random
	push eax
	push L2
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop mainPlayerMoney

while1:
	mov eax, mainisOpen
	mov ebx, L13

	.IF eax  !=  ebx
		jmp endwhile1
	.ENDIF

	mov eax, mainEnemyHeal
	mov ebx, L3
	.IF SDWORD PTR eax  <=  SDWORD PTR ebx
	push _getName
	pop edx
		call _getName
	push eax
	pop mainEnemyName

	push random
	push L19
	pop edx
	pop edx
	push L19
		call random
	push eax
	push L1
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop mainEnemyDamage

	push random
	push L20
	pop edx
	pop edx
	push L20
		call random
	push eax
	push L20
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop mainEnemyHeal


	.ENDIF

	push offset L21
	call outstrline

	push mainPlayerName
	call outstr

	push offset L22
	call outstr

	push offset L23
	call outstr

	push mainPlayerHeal
	call outnum

	push offset L22
	call outstr

	push offset L24
	call outstr

	push mainPlayerMoney
	call outnum

	push offset L25
	call outstrline

	push offset L26
	call outstrline

	push offset L27
	call outstr

	push mainEnemyName
	call outstr

	push offset L22
	call outstr

	push offset L23
	call outstr

	push mainEnemyHeal
	call outnum

	push offset L22
	call outstr

	push offset L28
	call outstr

	push mainEnemyDamage
	call outnum

	push offset L25
	call outstrline

	push offset L26
	call outstrline

	push offset L29
	call outstrline

	push offset L30
	call outstr
	push offset inputChar
	pop edx
		call inputChar
	push eax
	pop mainkey

	mov esi, mainkey
	mov edi, offset L31
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  ==  bl
	push mainEnemyHeal
	push _getDamage
	push mainPlayerDmg
	pop edx
	pop edx
	push mainPlayerDmg
		call _getDamage
	push eax
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop mainEnemyHeal


	.ENDIF
	mov esi, mainkey
	mov edi, offset L32
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  ==  bl
	mov eax, mainPlayerMoney
	mov ebx, L2
	.IF SDWORD PTR eax  >=  SDWORD PTR ebx

	push offset L33
	call outstrline
	push mainPlayerHeal
	push L34
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop mainPlayerHeal

	push _Clamp
	push mainPlayerHeal
	push L3
	push mainPlayerHealMax
	pop edx
	pop edx
	pop edx
	pop edx
	push mainPlayerHealMax
	push L3
	push mainPlayerHeal
		call _Clamp
	push eax
	pop mainPlayerHeal

	push mainPlayerMoney
	push L2
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop mainPlayerMoney

	.ELSE

	push offset L35
	call outstrline

	.ENDIF

	.ENDIF
	mov esi, mainkey
	mov edi, offset L36
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  ==  bl
	push L14
	pop mainisOpen


	.ENDIF
	push _getDamage
	push mainEnemyDamage
	pop edx
	pop edx
	push mainEnemyDamage
		call _getDamage
	push eax
	pop mainEnemyDmgBuf


	push offset L37
	call outstr

	push mainEnemyDmgBuf
	call outnum

	push offset L38
	call outstrline
	push mainPlayerHeal
	push mainEnemyDmgBuf
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop mainPlayerHeal

	mov eax, mainEnemyHeal
	mov ebx, L3
	.IF SDWORD PTR eax  <=  SDWORD PTR ebx

	push offset L39
	call outstrline
	push mainPlayerKills
	push L5
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop mainPlayerKills


	.ENDIF
	mov eax, mainPlayerHeal
	mov ebx, L3
	.IF SDWORD PTR eax  <=  SDWORD PTR ebx
	push L14
	pop mainisOpen


	.ENDIF
	jmp while1

endwhile1:

	push offset L40
	call outstrline

	push offset L41
	call outstr

	push mainPlayerKills
	call outnumline

	push offset L42
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