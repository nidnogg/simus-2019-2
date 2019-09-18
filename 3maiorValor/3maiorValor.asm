;---------------------------------------------------
; Programa: 3maiorValor.asm
; Autor: Henrique
; Desc: 
;---------------------------------------------------

ORG 104
    PTR_A: DW A
    A: DB 1

   
    PTR_B: DW B
    B: DB 2Bh


    ;ARR_SIZE: DB 20
    ;ARR: DB 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 
    ;CONT: DB 0 
ORG 1000 
    
    PTR_STR: DW TO_PRINT
    TO_PRINT: STR "Return value = "
              DB 0

ORG 0 
START:
    OUT CLEARBANNER

ITER: 
    ;LDA ARR_SIZE
    ;SUB CONT
    ;JZ END
PRINT: 
    ; printa primeiro byte 
    LDA @PTR_B
                        
    SHR 
    SHR   
    SHR
    SHR            ; shifta 4 primeiros bits pra direita 
    JSR EVAL_PRINT    ; avalia se é num ou letra

    ; printa segundo byte 
    LDA @PTR_B
                        
    AND #15             ; mask com 11110000 pra pegar segunda metade 
    JSR EVAL_PRINT    ; avalia se é num ou letra
    
    JMP END
                          
 

EVAL_PRINT: 
    SUB #10           ; se negativo, é número
    JN PRINT_NUM
    JNZ PRINT_LETTER
    JZ PRINT_LETTER 

PRINT_NUM:
    ADD #10      ; soma 10 que foi subtraido no teste letra/num 
    ADD #30h     ; soma 30h, que é a posicao de 0 em ASCII
    OUT BANNER   ; imprime
    RET          ; volta pra loop de print  

PRINT_LETTER: 
    ADD #41h     ; soma 41h, posicao de A em ASCII
    OUT BANNER 
    ADD #10
    RET
    
PRINT_STR:
    ;LDA PTR_STR
    ;PUSH
    LDA @PTR_STR
     
    OR #0
    JZ PRINT_VALUE
    
    OUT BANNER
  
    LDA PTR_STR
    ADD #1   
    STA PTR_STR
    JMP PRINT

PRINT_VALUE:
  
END: 
    HLT 



;------------------------------------------------------
; constantes de hardware
CLEARBANNER   EQU 3
BANNER        EQU 2
; constantes de trap
CONSOLEWRITE  EQU 2
;------------------------------------------------------

