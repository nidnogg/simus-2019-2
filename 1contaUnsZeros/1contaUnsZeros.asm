;---------------------------------------------------
; Program: 1contaUnsZeros.asm
; Author: nidnogg
;---------------------------------------------------

org 0
start:
        in 0
        add #5
        or #99
        jnz end

        jmp main
end:    hlt

;---------------------------------------------------
; Hardware Constants
clearbanner   equ 3
banner        equ 2
; Trap Constants
consolewrite  equ 2
;---------------------------------------------------
