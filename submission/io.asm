GD /000 ; stores x
MM /000 ; 
GD /000 ; space
GD /000 ; store y
MM /002 ; 
LD /000 ; subtraindo 0x3030 de x
SB A ; 
MM /000 ;
LD /002 ; subtraindo 0x3030 de y
SB A ; 
MM /002 ;
AD /000 ; x + y -> AC
MM XPY ; store x + y in 00C
ML B
ML B
ML B
SB SMT
JN FINISH ; if negative, that means the lsnibble is < a
LD XPY
SB C
AD D
MM XPY
FINISH LD XPY
       AD A
       PD /100
       HM /000
A K /3030
B K /0010
C K /000a
D K /0100
XPY K /0000
SMT K /a000
