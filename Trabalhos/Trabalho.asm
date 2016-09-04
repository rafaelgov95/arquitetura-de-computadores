#
.data
#Array
Array:  .space 2000    
#msgs para menus principais
$menu_ordena: .asciiz "\nEscolha uma das Opçoẽs abaixo: \n1 - Buuble Sort \n2 - Insert Sort \n3 - Select Sort \n4 - Meger Sort \n0 - Voltar\n"
#
$menu: .asciiz "\nOlá Seja bem Vindo a MegaMaster Ordenador da nave Apollo-18 \n Agora escolhe uma das Opçoẽs abaixo: \n 1 - Criar Novo Vetor\n 2 - Ver Vetor \n 3 - Ordenar Vetor \n 0 - Sair \n"
#msgs para montar vetor
$informa_opcaoinvalida: .asciiz "Opção invalida"
#
$informa_vetorNaoCriado: .asciiz "VETOR NAO CRIADO\n"
#
$informa_quantidadeDeVetor: .asciiz "INFORME A QUANTIDADE DE POSICAO NO SEU VETOR "
#
$informa_posicao: .asciiz "O VETOR NA POSIÇÃO: "
#
$informa_Numero: .asciiz " COTÉM O NUMERO "
#
$informa_Numero_para_posicao: .asciiz " INFORME UM INTEIRO PARA COLOCAR NA POSIÇÃO: "
# msg para quebrar linha
$quebraLinha: .asciiz "\n"
# Menus para ordenação
$menu_ordena_insertsort: .asciiz "\nORDENAÇÃO UTILIZANDO INSERTSORT\n"
#
$menu_ordena_selectsort: .asciiz "\nORDENAÇÃO UTILIZANDO SELECTSORT\n"
#
$menu_ordena_mergesort: .asciiz "\nORDENAÇAO UTILIZANDO MERGESORT\n"
# Ordenacao Comparacao
$informa_trocas: .asciiz " -> Troca Efetuadas nessa Bagaça\n"
#
.text 
#Menu Incicial onde tem uma sequencia de beq para definir as opcôes
inicio:
#inicia chamada do sistema para imprimir o menu
	li $v0,4 
# a0 recebe mensagem 
	la $a0, $menu 
# chamada para o sistema para imprimir 
	syscall 
# inicia chamada do sistema para ler um inteiro	
	li $v0, 5 
# faz chamada de sistema para pegar numero
	syscall 
# se v0 igual 0 entao acaba programa	
        beq $v0,0,fim_programa
# se v0 igual 1 vai para bloco de criação de vetor
        beq $v0,1,prepara_criar_vetor
# se v0 igual 2 vai para bloco de imprimir vetor         
        beq $v0,2,prepara_imprimi_vetor
# se v0 igual 3 vai para o SubMenu Ordenar        
	beq $v0,3,menu_ordenar_vetor
# se V0 nao e nem um desses 4 entao o v0 nao foi informado corretamente	
	li $v0,4 
# a0 recebe mensagem de msg invalida
	la $a0, $informa_opcaoinvalida 
# faz chamada de systema para imprimir a msg
	syscall 
# pula para inicio ja que nao entro em nem uma, para pegar um novo valor correto        
        jal inicio     
# Prepara para criar um vetor, fazendo chamaada de sistema para imprimir as msgs
prepara_criar_vetor: 
 # faz chamada de sistema para imprimir uma msg
	li $v0,4 
# a0 recebe essa mensag	
	la $a0, $informa_quantidadeDeVetor
# chamada de sistema para imprimir msg	
	syscall 
# chamda de sistema pedindo um inteiro	
	li $v0,5
# chamda de sitema	   
	syscall
# pega o valor e multiplica por 4 (usando deslocamento)	
	sll $t0,$v0,2 
# zera T1 para ser incrementado futuramente	
	addi $t1,$zero,0 
# pula para inicio_criar vetor        
        j inicio_criar_vetor
# Iniciar a Leitura do vetor ate que t0 ser menor que t1 (T0 quarda quantidade de elementos 4*N)	
inicio_criar_vetor:
# se T0 igual T1 entao pula para inicio
        beq $t0,$t1,inicio       
# chamada de sistema para imprimir msq       
	li $v0,4 
# a0 recebe a msg a ser escrita	
	la $a0, $informa_Numero_para_posicao
# chamada de sistema para impressao de msg	
	syscall
#chamada de sistema para imprimir um inteiro	 	
        li $v0,1
# a0 recebe t1 dividido por 4 (quantidade de numeros no nosso vetor)           
        div $a0,$t1,4	
# chamada sistema para imprimir inteiro de a0
	syscall 
# chamada de sistema para imprimir um msq	
        li $v0,4 
# a0 recebe msq        
	la $a0, $quebraLinha
# chamada de sistema
	syscall
# chamda de sistema pra ler um inteiro	               
        li $v0,5
# chamada de sistema           
	syscall 
# V0 e salvo em Array com index $t1	
	sw $v0,Array($t1)
# T1 recebe T1+4	
	addi $t1,$t1,4
# pula para inicio_criavetor	                       
	j inicio_criar_vetor	
# a Impressao Começa aqui criasse um t1 e zera ele;
prepara_imprimi_vetor:
# nosso t1 e zerado para ser nosso index 
        addi $t1,$zero,0 
# pula para inicia_imprimi_vetor
        j inicia_imprimi_vetor	
# percorre o Array ate que T1 seja igual a T0        
inicia_imprimi_vetor:
# se t0 igual t1 pula para inicio
        beq $t0,$t1,inicio
# prepara chamda de sistema para imprimir msg
       	li $v0,4 
# a0 recebe msq
	la $a0,$informa_posicao
# chamada de sistema 
 	syscall 	
# prepara chamada de sistema para imprimir um inteiro       
        li $v0,1   
# a0 recebe t1 dividido por 4 (quantidade de numeros no vetor)
        div $a0,$t1,4	
# chamdad de sistema
        syscall
# prepara chamda de sistema para imprimir msg
	li $v0,4
# a0 recebe msq 
	la $a0, $informa_Numero
# chamada de sistema
	syscall
# prepara chamada de sistema para imprimir um inteiro       
        li $v0,1   
# a0 recebe Valor que esta em Array index T1
        lw $a0,Array($t1)	
# chamada de sistema 
	syscall
# t1 recebe t1+4
	addi $t1,$t1,4  
# prepara chamda de sistema para imprimir msg  
        li $v0,4 
# a0 recebe msq 
	la $a0, $quebraLinha
#chamada de sistema
	syscall 	                   
#pula para inicio_imprimir_vetor	
	j inicia_imprimi_vetor
# Sub menu para escolher qual ordenação deseja        
menu_ordenar_vetor:
# chamada de sistema para imprimir msq
	li $v0,4 
# a0 recebe a msq
	la $a0, $menu_ordena
# chamada de sistema
	syscall
# chamda de sistema para ler um inteiro 
	li $v0, 5
# faz chamada de sistema 
	syscall 
# se v0 igual 0 entao inicio	
        beq $v0,0,inicio
# se v0 igual 1 entao vai para bubbleSort
        beq $v0,1,inicia_ordena_bubblesort
# se v0 igual 2 entao vai para insertort
        beq $v0,2,inicia_ordena_insertsort
# se v0 igual 3 entao vai para selectSort
	beq $v0,3,inicia_ordena_selectsort
# se v0 igual 4 entao vai para mergeSort	
        beq $v0,4,inicia_ordena_mergesort
# chamada de sistema para imprimir msg
        li $v0,4 
# a0 recebe a msq
	la $a0, $informa_opcaoinvalida
# chamada de sistema	
	syscall
# se v0 nao entro em nem um beq ele pula para ele mesmo ja que a msg foi errada        
        j menu_ordenar_vetor
#Ordenação com Bubble Começa aqui
inicia_ordena_bubblesort:
#inicia chamada do sistema para imprimir o menu
	li $v0,4 
# prepara a msg	
	la $a0, $menu_ordena_buublesort 
#lança pro sistema a msg	
	syscall 
# T1 recebe o valor de nosso Array para que ele seja nosso  Index i	
        add $t1,$t0,$zero 
# zera nosso  contador s6         
        add $s6,$zero,$zero
# pula para o primeiro for            
        j primeiro_for_bubble
# 2º Parte bubble        
primeiro_for_bubble:
# se T1 ta zerado entao acabo o primeiro for e ja pode imprimir_trocas
	beq $t1,0,imprimi_troca
# se T1 nao esta zerado ele zera T2 	
        addi $t2,$zero,0   
#pula para segundo_for
	j segundo_for_bubble
# 3º Parte bubble		
segundo_for_bubble:
#pergunda se t2 < t1
	slt $s1,$t2,$t1
# se nao for ele pula para subrair T1 em menos 4 	
	bne $s1,1,sub_primeiro_for_bubble
#pula para o if (ESTE BLOCO ESTA EM CODIGOS REUTILIZADOS NO FIM DO ARQUIVO)	
        jal if
# Adiciona + 4 em T2
	addi $t2,$t2,4
#pula para 	
 	jal segundo_for_bubble
# bloco de subtração do t1
sub_primeiro_for_bubble:
#subtrai t1 em - 4
	subi $t1,$t1,4
#pula para bloco primeiro for bubble	
	jal primeiro_for_bubble
#Ordenação com Insert Começa aqui
inicia_ordena_insertsort:
#inicia chamada do sistema para imprimir o menu
	li $v0,4 
# prepara a msg	
	la $a0, $menu_ordena_insertsort 
#faz camada de sistema
	syscall 
# T1 recebe e zerado para ser usado como index i    
        add $t1,$zero,$zero   
# S6 sera usado para ser nosso contador de trocas        
        add $s6,$zero,$zero   
#faz um pulo para o começo do laço for
        j primeiro_for_insert
# 1º Parte Insert
soma_primeiro_for_insert:
# nosso Index i relacioando ao registrador T1 esta sendo incrementado!
        add $t1,$t1,4
#faz um pulo para o começo do laço for
	j primeiro_for_insert
# 1º Laço do nosso 
primeiro_for_insert:
# T1 que e nosso i pergunta se e do tamanho do vetor caso seja ele pula para o imprimi trocas
        beq $t1,$t0,imprimi_troca
# caso T1 não seja igual ao tamanho do vetor ele incrementa o registrador T2 com valor de T1         
        add $t2,$t1,$zero
# pula para o começo do segundo laço        
        j segundo_for_insert
# 2º Laço do nosso
segundo_for_insert:        
#T3 recebe 0 se T2 for maior que zero 
	slt $t3,$zero,$t2
#Se T3 for igual a 0 entao pula para o metodo de incremento do primeiro for	
        beq $t3,0,soma_primeiro_for_insert
#T2 maior entao pula para if  (CODIGO DO IF ESTA POR ULTIMO NO CAMPO DE CODIGO REULTILIZADO)
        jal if
#caso nao T2 nao seja entao vai para funcao sub_segundo_for        
        j sub_segundo_for_insert
#subtrai 4 de T2        
sub_segundo_for_insert:
 	subi $t2,$t2,4
#pula para segundo_for 	
 	j segundo_for_insert
#aqui começa a ordenacao 
inicia_ordena_selectsort:
#inicia chamada do sistema para imprimir o menu
	li $v0,4 
# prepara a msg	
	la $a0, $menu_ordena_selectsort
#faz chamda de sistema	
	syscall 	
# zera nosso contador s6	
	add $s6,$zero,$zero
# zera nosso index T2
	add $t2,$zero,$zero
# T1 recebe tamanho do menos 1	
	subi $t1,$t0,4
# pula para primeiro for 	              
        j primeiro_for_select
# bloco de soma do select       
soma_primeiro_for_select:
# incrementa o t2 em +4
        addi $t2,$t2,4
# pula para primeiro_for-select        
        j primeiro_for_select     
primeiro_for_select:
#se T2 igual 1 T1 entao imprimir_troca
        beq $t1,$t2,imprimi_troca
# Se T2 != entao T3 recebe T2        
        add $t3,$t2,$zero
# T4 recebe T2 + 4        
        addi $t4,$t2,4
# pula para o segundo_for        
        j segundo_for_select
# bloco do segundo for
segundo_for_select:
# se T4 igual $t0 entao pula para soma_primeiro_for
        beq $t4,$t0,soma_primeiro_for_select
# se T4 for diferente de T0 entao pula para if_select        
        jal if_select
# Carrega Array com index T3 para S3        
        lw $s3,Array($t3)
# Carrega Array com index T2 para S4                
        lw $s4,Array($t2)
# Escreve na memoria S4 na possicao Array em index T3
	sw $s4,Array($t3)
# Escreve na memoria S3 na possicao Array em index T2
        sw $s3,Array($t2)
# Pula para para soma_segundo_for
        j soma_segundo_for_select
# Bloco de soma do index do segundo for       
soma_segundo_for_select:      
# T4 recebe T4+4
        addi $t4,$t4,4
# Pula para segundo_for_select
        j segundo_for_select     
# Bloco de IF
if_select:
# Carrega Array com index T4 para S1        
	lw $s1,Array($t4)
# Carrega Array com index T3 para s2        
	lw $s2,Array($t3)
# Se s1 menor que s2 entao T6 recebe 1	
	slt $t6,$s1,$s2
# se t6 igual 1 pula para troca Select	
	beq $t6,1,troca_select
# volta para quem chamo	
        jr $ra
# bloco de troca
troca_select:
# nosso contador de trocas s6 recebe +1
        addi $s6,$s6,1   
# t3 recebe t4        
	add $t3,$t4,$zero
#volta para quem chamo
	jr $ra
inicia_ordena_mergesort:
	li $v0,4 
	la $a0, $menu_ordena_mergesort
	syscall 
	j inicia_merge
inicia_merge:
	#s1 representa inicio
        add $s1,$zero,$zero
        #s3 representa fim
	sub $s3,$t0,1	
loop_merge:
	slt $t1,$s1,$s3
	beq $t1,0,inicio
	#se nao volto no inicio inicio e menor que fim entao fica vai rodar 
	#s2 representa meio
	add $v1,$s1,$s3
	div $s2,$v1,2
	jal loop_merge

#####################################################CÓDIGOS REUTILIZADOS ##############################################################	
# pega o contador S6 e imprimi junto a uma msg
imprimi_troca:
# chamada de sistema para imprimir inteiro
	li $v0,1
# a0 revebe S6(nosso contador de trocas)
	move $a0,$s6
# chamada de sistema	
	syscall
# chamada de sitema pra imprimir msg
	li $v0,4
# a0 recebe a msg
	la $a0,$informa_trocas
# chamada de sistema
	syscall
# pula para o menu principal
	j inicio  
#pergunta se oque esta em S1 for maior que s2 entao troca	     
if:
# acesso na memoria e valor no Array index t2 vai para s1 
	lw $s1,Array($t2) 
# s4 recebe (t2-4)
	subi $s4,$t2,4
# acesso na memoria e valor no Array index s4 vai para s2 
	lw $s2,Array($s4)
# se s2 menor que s1 entao t4 rebe 1
	sltu $t4,$s2,$s1
# se s2 for maior que s1 entao pula para troca
	bne $t4,1,troca
# retorna pra quem o chamou
        jr $ra
# operacao de troca       
troca:	
# nosso contador S6 recebe S6+1
        addi $s6,$s6,1
# Guarda valor de S2 em Array com index T2
	sw $s2,Array($t2)
# Guarda valor de S1 em Array com index S4
	sw $s1,Array($s4)
# retorna pra quem o chamou
	jr $ra
# Chamada pra fechar o progra	
fim_programa:
# chamada de encerramento do codigo
         li $v0,10
# chamada de sistema    
        syscall	
	