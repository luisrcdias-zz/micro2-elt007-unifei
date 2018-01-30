INCLUDE Irvine32.inc

.data
msgMenu BYTE "|Calculadora de Booleano|",0dh,0ah
	BYTE 0dh,0ah
	BYTE "1. x AND y"     ,0dh,0ah
	BYTE "2. x OR y"      ,0dh,0ah
	BYTE "3. NOT x"       ,0dh,0ah
	BYTE "4. x XOR y"     ,0dh,0ah
	BYTE "5. Sair",0

msgAND BYTE "AND Booleano",0
msgOR  BYTE "OR Booleano",0
msgNOT BYTE "NOT Booleano",0
msgXOR BYTE "XOR Booleano",0

msgInteger1 BYTE "Digite o primeiro numero  ",0
msgInteger2 BYTE "Digite o segundo numero ",0
msgResult   BYTE "O resultado da operacao e:",0

caseTable BYTE '1'
	DWORD AND_op
EntrySize = ($ - caseTable )
	BYTE '2'
	DWORD OR_op
	BYTE '3'
	DWORD NOT_op
	BYTE '4'
	DWORD XOR_op
	BYTE '5'
	DWORD ExitProgram
NumberOfEntries = ($ - caseTable) / EntrySize

.code
main PROC
	call Clrscr

Menu:
	mov edx, OFFSET msgMenu
	call WriteString
	call Crlf

L1:	call ReadChar
	cmp al, '5'
	ja L1
	cmp al, '1'
	jb L1

	call Crlf
	call PickProc
	jc quit

	call Crlf
	jmp Menu

quit: exit
main ENDP

PickProc PROC

	push ebx
	push ecx

	mov ebx, OFFSET caseTable
	mov ecx, NumberOfEntries

L1:	cmp al, [ebx]
	jne L2
	call NEAR PTR [ebx + 1]
	jmp L3

L2:	add ebx, EntrySize
	loop L1

L3:	pop ecx
	pop ebx

	ret

PickProc ENDP

AND_op PROC

	pushad

	mov edx, OFFSET msgAND
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1
	call WriteString
	call ReadHex
	mov ebx, eax

	mov edx, OFFSET msgInteger2
	call WriteString
	call ReadHex

	and eax, ebx

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret

AND_op ENDP

OR_op PROC

	pushad

	mov edx, OFFSET msgOR
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1
	call WriteString
	call ReadHex
	mov ebx, eax

	mov edx, OFFSET msgInteger2
	call WriteString
	call ReadHex

	or eax, ebx

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret
OR_op ENDP

NOT_op PROC

	pushad

	mov edx, OFFSET msgNOT
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1
	call WriteString
	call ReadHex

	not eax

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret

NOT_op ENDP

XOR_op PROC

	pushad

	mov edx, OFFSET msgXOR
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1
	call WriteString
	call ReadHex
	mov ebx, eax

	mov edx, OFFSET msgInteger2
	call WriteString
	call ReadHex

	xor eax, ebx

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret

XOR_op ENDP

ExitProgram PROC

	stc
	ret

ExitProgram ENDP

END main
