# simus-2019-2
Os códigos estão organizados em pastas numeradas conforme suas respectivas questões.
## Links úteis:
* ### [Pasta com slides e seus bookmarks atualizados, e listas do restante da disciplina](https://drive.google.com/drive/folders/12un7rCe_YxG_v-BtJ3xsRKmhWVzI8mPv?usp=sharing)
* ### [Material completo de 2019.1](https://drive.google.com/open?id=1NPyAhqXkcdZgFNjW3hHIzO32yfqr0saK)
* ### [Exercícios SIMUS de 2017](https://github.com/grmano/Lista_Arq)
## Enunciados: 
### Questão 1
Escrever uma rotina ContaUnsZeros. Recebe o endereço de uma palavra de 32 bits na pilha e no acumulador um parâmetro, se for 0 conta o número de '0's, se for '1' conta o número de '1's na palavra. O resultado é devolvido no acumulador. Apresente um programa de exemplo. (1,0 ponto)

### Questão 2
Escrever uma rotina para comparar o valor de duas variáveis de 16 bits com sinal. O endereço das variáveis é passado na pilha. O resultado é retornado no acumulador. Se as variáveis forem iguais o valor retornado é zero, se a primeira variável for maior o resultado é 1, se for menor o resultado é -1. Apresentar um programa exemplo que imprima o resultado no "banner". (2,0 pontos)


### Questão 3 
Escrever um programa para encontrar o maior valor em um vetor com vetor com variáveis de 16 bits com sinal. O endereço inicial do vetor é passado na pilha e o seu tamanho no acumulador. O índice do maior elemento é retornado no acumulador. Apresentar um programa exemplo com um vetor de 20 posições que imprima o maior valor encontrado em hexadecimal no "banner". (2,0 pontos)

### Questão 4 
Escrever um programa que receba um valor inteiro decimal do teclado virtual, terminado por #,  e calcule o valor correspondente da série de Fibonacci usando um procedimento recursivo. Escrever o resultado no banner. (2,5 pontos)

### Questão 5
Escreva uma rotina para verificar se uma cadeia de caracteres é palíndrome, ou seja, se dá o mesmo resultado quando lida da direita para a esquerda ou da esquerda para a direita, ignorando brancos e pontuações (“a cara rajada da jararaca” é um exemplo). O endereço do início da cadeia é passado como parâmetro na pilha e a cadeia é terminada com NULL. Se  a cadeia for uma palíndrome, o acumulador deve valer zero ao final; caso contrário, deve ter o valor 1. Apresente um programa exemplo que leia a cadeia da console e escreva o resultado também na console. (2,5 pontos)