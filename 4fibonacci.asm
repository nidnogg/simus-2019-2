;-----------------------------------------------------
; Program: Fibonacci Recursivo
; Author: Daigoro 
; Desc: Esse programa imprime no banner, em hexa, o valor da seq
;       de fibonacci até o valor que é dado no input, seguido de um #
;       para indicar o final da entrada.
;       Como existe a limitacao de 8 bits, o maior valor de entrada
;       é 13
;----------------------------------------------------- 

ORG 1000

TEMP1: DB 0
TEMP2: DB 0
TARGET: DB 0

PTR_TEMP3: DW TEMP3
TEMP3: DB 0

FIB_RESULT: DB 0
PTR_FIB_RESULT: DW FIB_RESULT

ORG 0
START:
    OUT CLEARBANNER
    IN  03
    ADD #0
    JZ  START

INPUT:
    TRAP 1
    IN  02        
    SUB #35         
    JZ  MAIN        ; se for #, jump pra rotina principal 
                    ; caso contrario, armazena na stack 
    SUB #13        
    PUSH      
    LDA TARGET      
    JZ STORE_TGT   
    JSR MULT_10     
    POP            
    ADD TARGET     
    STA TARGET
    JMP START
    
    RET

STORE_TGT:
    POP
    STA TARGET
    JMP START


MULT_10:
    SHL             
    SHL             
    SHL             ; multiplica por 8
    ADD TARGET         ;
    ADD TARGET         ; soma 2 vezes
    STA TARGET        
    RET

PRINT: 
    ; printa primeiro byte 
    STA TEMP3 
    LDA TEMP3
    STA FIB_RESULT
    LDA @PTR_FIB_RESULT
                
    SHR 
    SHR   
    SHR
    SHR            ; shifta 4 primeiros bits pra direita 
    JSR EVAL_PRINT    ; avalia se é num ou letra

    ; printa segundo byte 
    LDA @PTR_FIB_RESULT 
                        
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

MAIN:
    LDA TARGET      ; carrega o target
    JSR FIB         ; trata a rotina principal
    JMP PRINT       ; printa resultado

FIB:
    STA @PTR_TEMP3
    STA TEMP3 ;  
    SUB #0    ;
    JZ ZERO   ; caso input = 0, printa 0
    SUB #1    ;
    JZ ONE    ; mesma coisa para input 1
    LDA TEMP3 ; cc faz fib recursivamente
    PUSH  
    SUB #1    
    JSR FIB
    STA TEMP3  
    POP       
    STA TEMP1  
    LDA TEMP3  
    PUSH      
    LDA TEMP1  
    SUB #2
    JSR FIB
    STA TEMP2  
    POP          
    ADD TEMP2  
    RET

CALC: 
ZERO:
    LDA #0
    RET

ONE:
    LDA #1
    RET

END:
    HLT

;------------------------------------------------------
; constantes de hardware
CLEARBANNER   EQU 3
BANNER        EQU 2