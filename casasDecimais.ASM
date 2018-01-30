INCLUDE Irvine32.inc
 Decimal_Offset=5
 .data
 decimal1 BYTE "100123456789765"
 buffer BYTE (SIZEOF decimal1+1) DUP(?)

 .code
 main PROC
	 call Clrscr
 mov edx,OFFSET decimal1
 mov ecx,LENGTHOF decimal1
 mov ebx,Decimal_Offset
 call WriteScaled
  mov edx,OFFSET buffer
 call WriteString
 call Crlf
 exit
 main ENDP

 WriteScaled PROC
 mov eax,ecx
 mov esi,0
 sub eax, 5
 mov ecx,eax
 Loop1:
	mov al, decimal1[esi]
	mov buffer[esi], al
 inc esi
 loop Loop1
 mov buffer[esi],'.'
 inc esi
 mov ecx,5
 Loop2:
	mov al, decimal1[esi-1]
	mov buffer[esi], al
	inc esi
 loop Loop2
 ret
 WriteScaled ENDP


 END main
