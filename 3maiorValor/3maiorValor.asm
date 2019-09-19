;---------------------------------------------------
; Programa: 3maiorValor.asm
; Autor: Henrique
; Desc: Esse programa define um vetor de vars de 16 bits, e encontra
;       o maior valor encontrado nesse vetor, imprimindo-o no console 
;       em hexadecimal. O resultado esperado é 63 (99 em decimal), 
;       conforme o vetor.
;---------------------------------------------------

ORG 1000

    PTR_LARGEST: DW LARGEST
    LARGEST: DB 0

    ARR_SIZE: DB 20
    PTR_ARR: DW ARR           ;
    ARR: DB 1, 80, 3, 4, 5, 6, 7, 8, 9, 10, 11, 90, 13, 14, 15, 99, 17, 18, 19, 20 
    COUNT: DB 0 

ORG 0 
START:
    OUT CLEARBANNER 
    LDA @PTR_ARR
    STA @PTR_LARGEST  ; primeiro elemento é o maior

MAIN:
    LDA ARR
    PUSH       ; passa end do vetor na pilha
    ; checa se chegou ao fim do vetor    
    LDA ARR_SIZE   ; passa tamanho do vetor no acumulador  

    SUB COUNT      ; Se array - counter = 0, chegou ao fim do array
    JZ PRINT       ; printa maior

ITER: 
    LDA #1
    ADD COUNT
    STA COUNT

    JMP LOOP

LOOP:
    LDA PTR_ARR      ; pega proximo elem do vetor 
    ADD #1
    STA PTR_ARR 
    LDA @PTR_LARGEST ; carrega maior elem no vetor
    SUB @PTR_ARR     ; subtrai do proximo elem
  
    JN UPDATE_LARGEST ; se elem maior > elem atual, N = 1 (result neg)
   
    ;LDA #1
    ;ADD PTR_ARR
    ;STA PTR_ARR
    JMP MAIN

UPDATE_LARGEST:
    LDA @PTR_ARR
    STA @PTR_LARGEST
    JMP MAIN
   
PRINT: 
    ; printa primeiro byte 
    LDA @PTR_LARGEST
                        
    SHR 
    SHR   
    SHR
    SHR            ; shifta 4 primeiros bits pra direita 
    JSR EVAL_PRINT    ; avalia se é num ou letra

    ; printa segundo byte 
    LDA @PTR_LARGEST 
                        
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
    
END: 
    HLT 



;------------------------------------------------------
; constantes de hardware
CLEARBANNER   EQU 3
BANNER        EQU 2
;------------------------------------------------------

