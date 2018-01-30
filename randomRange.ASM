Include Irvine32.inc

.data
random DWORD ?

.code

main PROC
call Randomize
mov ecx, 50
L1:
mov eax, 200 ;upper bound
mov ebx, -100 ;lower bound
call BetterRandomRange
mov eax, random
call WriteInt
call Crlf
loop L1
exit
main ENDP

BetterRandomRange PROC
sub eax, ebx
call RandomRange
mov random, eax
add random, ebx
ret
BetterRandomRange ENDP

END main
