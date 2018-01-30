INCLUDE Irvine32.inc

Get_frequencies PROTO,
	pString:PTR BYTE,
	pTable:PTR DWORD

.data
freqTable DWORD 256 DUP(0)


aString BYTE 80 DUP(0),0

str1 BYTE "Tabela de Frequencia de números/letras: ",0
target BYTE "AAEBDCFBBC",0
.code
main PROC

	call Clrscr
	mov  edx,OFFSET str1
	call WriteString


	INVOKE Get_frequencies, ADDR target, ADDR freqTable
	call DisplayTable

	exit
main ENDP

Get_frequencies PROC,
	pString:PTR BYTE,
	pTable:PTR DWORD


	mov esi,pString
	mov edi,pTable
	cld

L1:	mov eax,0
	lodsb
	cmp al,0
	je  Exit_proc
	shl eax,2
	inc DWORD PTR [edi + eax]
	jmp L1

Exit_proc:
	ret
Get_frequencies ENDP


DisplayTable PROC

.data
doisp BYTE ": ",0
.code
	call Crlf
	mov ecx,LENGTHOF freqTable
	mov esi,OFFSET freqTable
	mov ebx,0

L1:	mov eax,[esi]
	cmp eax,0
	jna L2

	mov eax,ebx
	call WriteChar
	mov edx,OFFSET doisp
	call WriteString
	mov eax,[esi]
	call WriteDec
	call Crlf

L2:	add esi,TYPE freqTable
	inc ebx
	loop L1

	call Crlf
	ret
DisplayTable ENDP

END main
