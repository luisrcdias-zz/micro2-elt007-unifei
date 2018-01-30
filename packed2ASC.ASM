include Irvine32.inc

.data
	numbers DWORD 12345678h, 10203045h, 11223344h, 21222324h, 55345618h
	buffer BYTE 9 DUP(0)

.code
	main PROC
		mov esi ,offset numbers
		mov ecx, lengthof numbers
		L1:
		mov eax, [esi]
		mov edx, offset buffer
		call PackedToAsc
		call WriteString
		call Crlf
		add esi, TYPE numbers
		loop L1
		call ReadChar
		exit
main ENDP

PackedToAsc PROC
	pushad
	mov ecx, 8
	L2:
	mov ebx,eax
	and ebx,0F0000000h
	rol ebx,4
	or bl,30h
	mov [edx], bl
	inc edx
	shl eax, 4
	loop L2
	popad
	ret
PackedToAsc ENDP
END main
