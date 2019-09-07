;---------------------------------------------------
; Program: 1contaUnsZeros.asm
; Author: nidnogg
;---------------------------------------------------

org 0
routine:
        in 0
        add #5
        sub #6
        jnz end ; Jumps to end if Z is 0 (result is not zero)

        jmp routine
end:    hlt

;---------------------------------------------------
; Hardware Constants
clearbanner   equ 3
banner        equ 2
; Trap Constants
consolewrite  equ 2
;---------------------------------------------------
