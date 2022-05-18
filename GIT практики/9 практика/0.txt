$MOD51
jmp start
org 0bh
clr TCON.4
reti
org 20h
start:
clr C
mov TMOD,#01h
setb IE.7
setb IE.1
mov P2,#0h
Period:
mov A,#0h ; uroven impulsa nachalo
mov TL0,#0FFh
mov TH0,#0FFh
mov P2,A
setb TCON.4
next1:
jnb TCON.5, next1
mov A,#0h; uroven impulsa nachalo
mov TL0,#12h
mov TH0,#0FFh
mov P2,A
setb TCON.4
next2:
add A,#0h ; otklonenie impulsa nachalo
mov P2,A
jnb TCON.5,next2
mov A, #0FFh ; vusota impulsa
mov TL0,#12h
mov TH0,#0FFh
mov P2,A
setb TCON.4
next3:
jnb TCON.5,next3
mov A,#07Fh ; uroven impulsa konec
mov TL0,#12h
mov TH0,#0FFh
mov P2,A
setb TCON.4 
next4:
add A,#1h ; otklonenie impulsa konec
mov P2,A
jnb TCON.5,next4
mov TL0,#012h
mov TH0,#0FFh
mov P2,A
setb TCON.4 
next5:
add A,#-2h ; otklonenie impulsa konec2
mov P2,A
jnb TCON.5,next5
mov A,#0h; uroven impulsa konec  
mov TL0,#12h
mov TH0,#0FFh
mov P2,A
setb TCON.4
next6:
jnb TCON.5,next6
clr C
jmp Period 
END