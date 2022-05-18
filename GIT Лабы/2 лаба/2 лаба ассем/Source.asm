.686
.model flat,stdcall
.stack 100h
.data
arr dw 0B8F7h,03DA6h,0E77Fh,06633h ; массив исходных данных
m dw 0000000010000000b ; обьявление маски для инверсии младших байтов у X Y Z Q
.code
ExitProcess PROTO STDCALL :DWORD
Start:
xor eax,eax ;очистка регистра EAX 
xor ebx,ebx ;очистка регистра EBX 
xor ecx,ecx ;очистка регистра ECX 
xor edx,edx ;очистка регистра EDX 
lea esi,[arr] ; для вычисления адреса
lea edi,[arr] ; для вычисления адреса 
mov cx,4 ; указываем в регистре ECX 4
mov bx,m ; записал маску в bx
@cycle: ; начало цикла
lodsw ; прочитал число из строки
xor ax,bx ; умножил число на маску, которая находится в bx
stosw ; записал число в массив
loop @cycle ; конец цикла
lea esi,[arr]
mov edx,eax ; значение в регистре EAX в регистр EDX Q
lodsw
mov edi,eax ; значение в регистре EAX в регистр EDI X
lodsw
mov ebx,eax ; значение в регистре EAX в регистр EBX Y
lodsw
mov ecx,eax ; значение в регистре EAX в регистр ECX Z
mov eax,edi ; значение в регистре EAX в регистр EDI X
and eax,ebx ; X & Y
or ecx,edx ; Z or Q
add eax,ecx ; сложение результатов (М)
mov ecx,4
xor edx,edx ; очищение EDX
mov dl,al ; значение младшего байта записывается в EDX
cmp edx,ecx ; условие (мл M < 4)
jb pp1
jae pp2

pp1:
mov ecx,4h ; значение 4 записывается в регистр ECX
add eax,ebx ; выполнение 1 условия
;mov eax,-2 ; для проверки перехода к adr1
jmp foma
jmp exit

pp2:
mov edx,999h ; значение 999 записывается в регистр EDX
sub eax,edx ; вычитается из M значение 999
mov edx,eax ; значение в регистре EAX в регистр EDX
xor eax,eax ; очищение регистра EAX
xor ecx,ecx ; очищение регистра EСX
lahf ; запись значений флагов в регистр EAX
mov cl,ah ; значение в регистре EAX в регистр ECX
shl cl,7 ; сдвиг влево на 7 битов
shr cl,7 ; сдвиг вправо на 7 битов
sub edx,ecx ; вычитание из М значение флага CY
mov eax,edx ; значение в регистре EDX в регистр EAX
jmp foma

foma:
mov ebx,0
cmp eax,ebx ; сравнение (R < 0)
jl adr1
jg adr2

adr1:
xor eax,edi
jmp exit

adr2:
xor eax,1011h

exit:
Invoke ExitProcess,1
End Start