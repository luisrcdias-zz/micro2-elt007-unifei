INCLUDE Irvine32.inc

.DATA
	L DWORD 10
    Message BYTE 100 dup(0)

.CODE
main PROC

    call Randomize
    mov edi, 0
	mov eax, L
	mov ecx, eax
	L1:
    call GenerateString
		inc edi
	loop L1
    mov edx,offset Message
    call WriteString

    exit

main ENDP

GenerateString PROC

    mov eax, 26
    call RandomRange
    add eax, 65
    mov Message[edi],al
	ret
GenerateString ENDP

END main
