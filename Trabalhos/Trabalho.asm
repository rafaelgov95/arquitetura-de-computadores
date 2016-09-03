.data
eol:	.asciiz	"\n"


# Some test data
eight:	.word	312
five:	.word	5
four:	.word	4
nine:	.word	31231
one:	.word	1
seven:	.word	444
six:	.word	6
ten:	.word	10
three:	.word	3
two:	.word	2

# An array of pointers (indirect array)
length:	.word	10	# Array length
info:	.word	seven
	.word	three
	.word	ten
	.word	one
	.word	five
	.word	two
	.word	nine
	.word	eight
	.word	four
	.word	six
#Array
Array:  .space 2000    

#msgs para menus principais
$menu_ordena: .asciiz "\Escolha uma das Opçoẽs abaixo: \n1 - Buuble Sort \n2 - Insert Sort \n3 - Select Sort \n4 - Meger Sort \n0 - Voltar\n"
$menu: .asciiz "\nOlá Seja bem Vindo a MegaMaster Ordenador da nave Apollo-18 \n Agora escolhe uma das Opçoẽs abaixo: \n 1 - Criar Novo Vetor  \n 2 - Ver Vetor \n 3 - Ordenar Vetor \n 0 - Sair \n"
#msgs para montar vetor
$informa_quantidadeDeVetor: .asciiz "INFORME A QUANTIDADE DE POSICAO NO SEU VETOR "
$informa_posicao: .asciiz "O VETOR NA POSIÇÃO: "
$informa_Numero: .asciiz " COTÉM O NUMERO "
$informa_Numero_para_posicao: .asciiz " INFORME UM INTEIRO PARA COLOCAR NA POSIÇÃO: "
#msg para quebrar linha
$quebraLinha: .asciiz "\n"
# Menus para ordenação
$menu_ordena_buublesort: .asciiz "\nORDENAÇÃO UTILIZANDO BUUBLESORT\n"
$menu_ordena_insertsort: .asciiz "\nORDENAÇÃO UTILIZANDO INSERTSORT\n"
$menu_ordena_mergesort: .asciiz "\nORDENAÇAO UTILIZANDO MERGESORT\n"
$menu_ordena_quicksort: .asciiz "\nORDENAÇÃO UTILIZANDO QUICKSORT\n"
# Ordenacao Comparacao
$informa_comparacao: .asciiz " Compações\n"
.text 
inicio:
	li $v0,4 
	la $a0, $menu 
	syscall 
	li $v0, 5 
	syscall 
        beq $v0,0,fim_programa
        beq $v0,1,prepara_criar_vetor
        beq $v0,2,prepara_imprimi_vetor
	beq $v0,3,menu_ordenar_vetor
        jal inicio     
prepara_criar_vetor: 
	li $v0,4 
	la $a0, $informa_quantidadeDeVetor
	syscall 
	li $v0,5   
	syscall
	sll $t0,$v0,2 
	addi $t1,$zero,0 
        j inicio_criar_vetor	
inicio_criar_vetor:
        beq $t0,$t1,inicio       
	li $v0,4 
	la $a0, $informa_Numero_para_posicao
	syscall 	
        li $v0,1   
        div $a0,$t1,4	
	syscall 
        li $v0,4 
	la $a0, $quebraLinha
	syscall 	                   
        li $v0,5   
	syscall 
	sw $v0,Array($t1)
	addi $t1,$t1,4                       
	jal inicio_criar_vetor	
prepara_imprimi_vetor:
        addi $t1,$zero,0 
        j inicia_imprimi_vetor	
inicia_imprimi_vetor:
        beq $t0,$t1,inicio
       	li $v0,4 
	la $a0, $informa_posicao
	syscall 	
        li $v0,1   
        div $a0,$t1,4	
	syscall 
	li $v0,4 
	la $a0, $informa_Numero
	syscall 	
        li $v0,1   
        lw $a0,Array($t1)	
	syscall 
	addi $t1,$t1,4    
        li $v0,4 
	la $a0, $quebraLinha
	syscall 	                   
	jal inicia_imprimi_vetor	
fim_programa:
        li $v0,10
        syscall        
menu_ordenar_vetor:
	li $v0,4 
	la $a0, $menu_ordena
	syscall 
	li $v0, 5 
	syscall 
	move $s0, $v0
        beq $s0,0,inicio
        beq $s0,1,inicia_ordena_bubblesort
        beq $s0,2,inicia_ordena_insertsort
	beq $s0,3,inicia_ordena_selectsort
        beq $s0,4,inicia_ordena_mergesort
        j menu_ordenar_vetor
#Ordenação com Bubble Começa aqui

inicia_ordena_bubblesort:
	li $v0,4 
	la $a0, $menu_ordena_buublesort 
	syscall 
        add $s1,$t0,$zero    
        add $s3,$zero,$zero    
        
        j primeiro_for
        
primeiro_for:
	beq $s1,0,imprimi_comp
        addi $s2,$zero,0   
	j segundo_for
		
		
segundo_for:
	slt $t3,$s2,$s1
	bne $t3,1,segundo_primeiro_for
        jal verifica_troca
	addi $s2,$s2,4
        addi $s3,$s3,1
	jal segundo_for
	
segundo_primeiro_for:
	subi $s1,$s1,4
	jal primeiro_for


verifica_troca:        

        lw $t3,Array($s2)
        subi $t4,$s2,4	  
	lw $t5,Array($t4)
	
	
        slt $t7,$t3,$t5
	
	beq $t7,1,troca
	jr $ra
	

  troca:
        sw $t3,Array($t4)
        sw $t5,Array($s2)
      
       jr $ra

imprimi_comp:
	li $v0,1
	move $a0,$s3
	syscall
	
	li $v0,4
	la $a0,$informa_comparacao
	syscall
	j inicio       
inicia_ordena_insertsort:
	li $v0,4 
	la $a0, $menu_ordena_insertsort 
	syscall 
        add $t1,$zero,$zero   
        add $s6,$zero,$zero   
        j primeiro_for_insert
soma_primeiro_for_insert:
        add $t1,$t1,4
	j primeiro_for_insert
primeiro_for_insert:
        beq $t1,$t0,imprimi_comp
        add $t2,$t1,$zero
        j segundo_for_insert 	
segundo_for_insert:        
	slt $t3,$zero,$t2
        beq $t3,0,soma_primeiro_for_insert
        
        jal if_insert
        j sub_segundo_for_insert
sub_segundo_for_insert:
 	subi $t2,$t2,4
 	j segundo_for_insert
if_insert:
	lw $s1,Array($t2) 
	subi $s4,$t2,4
	lw $s2,Array($s4)
	sltu $t4,$s2,$s1
	bne $t4,1,troca_insert
        jr $ra
troca_insert:
addi $s6,$s6,1	
	sw $s2,Array($t2)
	sw $s1,Array($s4)
	jr $ra
inicia_ordena_selectsort:
	li $v0,4 
	la $a0, $menu_ordena_mergesort
	syscall 	
	add $s6,$zero,$zero
	add $t2,$zero,$zero
	subi $t1,$t0,4              
        j primeiro_for_select
soma_primeiro_for_select:
        addi $t2,$t2,4
        j primeiro_for_select     
primeiro_for_select:
        beq $t1,$t2,imprimi_comp
        add $t3,$t2,$zero
        addi $t4,$t2,4
        j segundo_for_select
segundo_for_select:
        beq $t4,$t0,soma_primeiro_for_select
        addi $s6,$s6,1
        jal if_select
        lw $s3,Array($t3)
        lw $s4,Array($t2)
        sw $s4,Array($t3)
        sw,$s3,Array($t2)
        j soma_segundo_for_select
soma_segundo_for_select:      
        addi $t4,$t4,4
        j segundo_for_select     
if_select:
	lw $s1,Array($t4)
	lw $s2,Array($t3)
	slt $t6,$s1,$s2
	beq $t6,1,troca_select
        jr $ra
troca_select:
	add $t3,$t4,$zero
	jr $ra
inicia_ordena_mergesort:

