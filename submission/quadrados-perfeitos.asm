@ /0000
START LV =064
      SB I
      JZ HALT ; 
      LD I
      MM N ; n = i
      SC SQRP
      LV =001
      AD I 
      MM I ; i = i + 1
      JP START
HALT  HM /000
SQRP  JP /000 ; function definition
SLOOP LD N
      SB J
      JZ ELOOP
      LV =002 ;
      ML J    ;
      MM TJI  ; tji <- 2*j + 1
      LV =001 ;
      AD TJI  ;
      MM TJI  ;
      LD S    ;
      AD TJI  ; s += 2*j + 1
      MM S    ;
      LV =001 ;
      AD J    ; j = j + 1
      MM J    ;
      JP SLOOP;
ELOOP LD S 
      JP INSTR
      
@ /0180
I     K =0
N     K =0
S     K =0
J     K =0
TJI   K =0
ADDR  K /100
INSTR K /9100
      LV /002 
      AD INSTR
      MM INSTR
      RS SQRP
