INCLUDE Irvine32.inc
Str_concat PROTO,
 	source:PTR BYTE, 		; source string
 	target:PTR BYTE		; target string

.data
targetStr BYTE "ABCDE",10 DUP(0)
sourceStr BYTE "FGH",0

.code
main PROC
	call Clrscr

	INVOKE Str_concat, ADDR targetStr, ADDR sourceStr


	mov  edx,OFFSET targetStr
	call WriteString
	call Crlf

	exit
main ENDP

Str_concat PROC USES eax ecx esi edi,
 	target:PTR BYTE,
 	source:PTR BYTE

	INVOKE Str_length,target
	add target,eax
	INVOKE Str_length,source
	mov ecx,eax
	inc ecx
	mov esi,source
	mov edi,target
	cld
	rep movsb
	ret
Str_concat ENDP

END main
