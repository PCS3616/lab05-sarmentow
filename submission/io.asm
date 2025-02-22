@ /0008
K /3030
K /0010
K /000a
K /0100
XPY K /0000
SMT K /a000

@ /10C
GD /000 ; stores x
MM /000 ; 
GD /000 ; 
MM /001 ;
GD /000 ; space
GD /000 ; store y
MM /002 ; 
GD /000 ;
MM /003 ;
LD /000 ; subtraindo 0x3030 de x
SB /008 ; 
MM /000 ;
LD /002 ; subtraindo 0x3030 de y
SB /008 ; 
MM /002 ;
AD /000 ; x + y -> AC
MM XPY ; store x + y in 00C
ML /00A
ML /00A
ML /00A
SB SMT
JN FINISH ; if negative, that means the lsnibble is < a
LD XPY
SB /00C
AD /00E
MM XPY
FINISH LD XPY
       AD /008
       PD /100
       HM /000
