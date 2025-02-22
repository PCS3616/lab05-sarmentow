LV   /000    ; AC <- 0
MM   /180    ; mem[180] <- 0      ; n = 0
LV   /100    ; AC <- 0x100        ; start of perfect squares table
MM   /1FF    ; mem[1FF] <- 0x100   ; table pointer
LD   /180    ; AC <- n
LV   /040    ; AC <- 64 (0x40)
SB   /180    ; AC = 64 - n
JZ   /028   ; if 64 - n == 0, jump to halt (n reached 64)
JN   /028   ; if 64 - n < 0, jump to halt
LD   /180    ; AC <- n (argument for subroutine)
SC   /030   ; call subroutine SQUARE at 0030 
LD   /1FF    ; AC <- current table pointer
STIND /182   ; store mem[182] (n²) at memory address held in AC
LV   /002    ; AC <- 2
AD   /1FF   ; AC = 2 + mem[1FF]  ; add 2 to pointer
MM   /1FF   ; update table pointer in mem[1FF]
LV   /001    ; AC <- 1
AD   /180   ; AC = n + 1
MM   /180   ; increment n (store back in mem[180])
JP   /008   ; jump back to start of main loop
HM   /000   ; halt machine
MM   /186    ; mem[186] <- n   ; save argument n for use in subroutine
LD   /186    ; AC <- n
JZ   /062   ; if n == 0, jump to SQUARE_END (nothing to add)
LV   /000    ; AC <- 0
MM   /182   ; mem[182] <- 0    ; initialize result = 0
LV   /000    ; AC <- 0
MM   /1F0   ; mem[1F0] <- 0    ; initialize loop counter i = 0
LD   /186    ; AC <- n
SB   /1F0   ; AC = n - i
JZ   /060   ; if (n - i) == 0, jump to subroutine return
JN   /060   ; if (n - i) is negative, jump to subroutine return
LD   /1F0   ; AC <- i
AD   /1F0   ; AC = i + i = 2*i
MM   /1F2   ; mem[1F2] <- 2*i
LV   /001   ; AC <- 1
AD   /1F2   ; AC = 1 + 2*i   ; compute odd number (2*i+1)
MM   /1F4   ; mem[1F4] <- (2*i+1)
LD   /182   ; AC <- result
AD   /1F4   ; AC = result + (2*i+1)
MM   /182   ; update result in mem[182]
LV   /001   ; AC <- 1
AD   /1F0   ; AC = i + 1
MM   /1F0   ; update i in mem[1F0]
JP   /03E   ; jump back to start of loop (S_LOOP)
RS   /000   ; return from subroutine (exit loop)
RS   /000   ; return from subroutine (if n was 0)
