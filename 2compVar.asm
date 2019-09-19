;---------------------------------------------------
; Programa: 2compVar.asm
; Autor: Henrique
; Desc: Esse programa compara duas variáveis de 16 bits com sinal.
;       O endereco é passado na pilha, e a estratégia utilizada foi a
;       de subtrair um do outro para ver se é negativo, 0, ou positivo
;       o resultado. Em cada caso há uma string a ser impressa, e 
;       é retornado no acumulador -1, 0, ou 1 respectivamente.
;       Definiu-se B maior do que A, logo, o valor esperado é 
;       e 1 no acumulador.
;---------------------------------------------------

ORG 2000 
   
    PTR_A: DW A
    A: DW 25         ; Valor A a ser comparado com B 
       DB 0          ; byte de sinal 
    
    PTR_B: DW B
    B: DW 20         ; Valor B a ser comparado com A     
       DB 0  

    GREATER_STR: STR "A é maior que B"
                 DB 0 
    PTR_IS_GREATER: DW GREATER_STR
    
    LOWER_STR: STR "A é menor que B"
               DB 0 
    PTR_IS_LOWER: DW LOWER_STR

    EQUAL_STR: STR "A é igual a B"
               DB 0 
    PTR_IS_EQUAL: DW EQUAL_STR

ORG 0
START:
    OUT CLEARBANNER

COMPARE: 
    LDA PTR_A
    PUSH 
    
    LDA PTR_B
    PUSH
    
    LDA @PTR_A  
    NOP
    SUB @PTR_B
    
    JZ PRINT_IS_EQUAL
    JN PRINT_IS_LOWER
    JNZ PRINT_IS_GREATER

    

PRINT_IS_EQUAL:
    LDA PTR_IS_EQUAL
    PUSH
    LDA @PTR_IS_EQUAL

    OR #0                 ; termina com null 
    JZ END_IS_EQUAL

    OUT BANNER 
    LDA #CONSOLEWRITE
    TRAP @PTR_IS_EQUAL
    LDA PTR_IS_EQUAL
    ADD #1
    STA PTR_IS_EQUAL
    JMP PRINT_IS_EQUAL

PRINT_IS_GREATER:
    LDA PTR_IS_GREATER
    PUSH
    LDA @PTR_IS_GREATER

    OR #0                 ; termina com null 
    JZ END_IS_GREATER

    OUT BANNER 
    LDA #CONSOLEWRITE
    TRAP @PTR_IS_GREATER
    LDA PTR_IS_GREATER
    ADD #1
    STA PTR_IS_GREATER
    JMP PRINT_IS_GREATER

PRINT_IS_LOWER:
    LDA PTR_IS_LOWER
    PUSH
    LDA @PTR_IS_LOWER

    OR #0                 ; termina com null 
    JZ END_IS_LOWER

    OUT BANNER 
    LDA #CONSOLEWRITE
    TRAP @PTR_IS_LOWER
    LDA PTR_IS_LOWER
    ADD #1
    STA PTR_IS_LOWER
    JMP PRINT_IS_LOWER

END_IS_EQUAL: 
    LDA #0 
    HLT 
END_IS_GREATER:
    LDA #1 
    HLT
END_IS_LOWER:
    LDA #-1 
    HLT


;------------------------------------------------------
; constantes de hardware
CLEARBANNER   EQU 3
BANNER        EQU 2
;------------------------------------------------------

