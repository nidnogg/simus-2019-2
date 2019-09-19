;---------------------------------------------------
; Programa: Contador de zeros e uns
; Autor: Leonardo 
; Desc: Le uma palavra de 32 bits, conta zeros e uns dela
;---------------------------------------------------

ORG 128
   WORD: DW 101, 3973 ;32 bits a serem contados 11 uns, 21 zeros
   PTR_WORD: DW WORD ;Endereco
   CONT: DW 0
   TEMP: DB 1
   TEMPSIZE: DB 0
   SIZE: DB 8
   NUMWORDS: DB 3
   END: DB 100

ORG 0

INICIO:
;conta 0
  LDA PTR_WORD
  PUSH
  LDA #0 ;Contar 1's
  JSR ContaUnsZeros

;conta 1
  LDA PTR_WORD
  PUSH
  LDA #1 ;Contar 1's
  JSR ContaUnsZeros

  HLT


 

 

;------------------------------------------------------
; Rotina para impressão de uma string no banner
; Declaração das variáveis da rotina
 
ORG  200 
SP:  DW 0; Guarda o valor do stack pointer 
PTR:   DW 0; Ponteiro com o endereço da string a ser impressa 
FLAG:  DB 0
SPINC: DW 0




   
INC:
  STS SPINC
  LDS #64808
  PUSH ;salva acc
  LDA CONT
  ADD #1
  STA CONT
  POP
  LDS SPINC
  RET     

ContaUnsZeros:
  STS SP
  
;Inicializacao
  STA FLAG
  POP  ;DESCARTAR RIP


  POP  ;DESCARTAR
  POP
  STA PTR
  LDS #65348 ;novo stak
  
  LDA TEMP
  AND #0 ;Primeiro bit setado
  ADD #1
  STA TEMP
  LDA TEMPSIZE
  AND #0
  STA TEMPSIZE
  LDA CONT
  AND #0
  STA CONT

;decidir se e para contar 1 ou 0
  LDA FLAG
  OR #0
  JNZ CONTUM
  JMP CONTZERO

CONTZERO:
  LDA TEMP; BITS A SER TESTADO (2 ^TEMP)
  OR #0 ;TESTA SE TEMP==0, se ja testou os 8 bits
  JZ TESTE
  LDA @PTR ;Pega a palavra
  AND TEMP ;And com Temp(so tem um bit setado)
  OR #0 ;testo se o bit era zero
  JNZ EHUM
  JSR INC
EHUM:
  LDA TEMP
  SHL
  STA TEMP
  JMP CONTZERO


CONTUM:
  LDA TEMP; BITS A SER TESTADO (2 ^TEMP)
  OR #0 ;TESTA SE TEMP==0, se ja testou os 8 bits
  JZ TESTE
  LDA @PTR ;Pega a palavra
  AND TEMP ;And com Temp(so tem um bit setado)
  OR #0 ;testo se o bit era zero
  JZ EHZERO
  JSR INC
EHZERO:
  LDA TEMP
  SHL
  STA TEMP
  JMP CONTUM

TESTE:
  LDA TEMPSIZE
  SUB NUMWORDS
  JZ  FIM

;NOVA PALAVRA

  LDA TEMPSIZE
  ADD #1 
  STA TEMPSIZE

;Novo Ponteiro

  LDA PTR
  ADD #1
  STA PTR

;TEMP EM 1
  LDA TEMP
  AND #0
  ADD #1
  STA TEMP
  LDA FLAG
  OR #0
  JNZ CONTUM
  JMP CONTZERO
FIM:
  LDA CONT
  OUT 0
  LDS SP
  RET