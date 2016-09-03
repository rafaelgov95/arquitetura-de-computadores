.data
$menu: .asciiz "\nOlá Seja bem Vindo a MegaMaster Ordenador da nave Apollo-18 \n Agora escolhe uma das Opçoẽs abaixo: \n 1 - Criar Novo Vetor  \n 2 - Ver Vetor \n 3 - Ordenar Vetor \n 0 - Sair \n"

$msg_primeiroNomuero: .asciiz "\nInsira um valor para primeira posição do vetor de numeros:\n"


#Array
Array:  .space 20    

.text
        
inicio:

	li $v0,4 
	la $a0, $menu 
	syscall 
	li $v0, 5 
	syscall 
	move $s2, $v0
        beq $s2,0,fim_fim
        beq $s2,1,criar_vetor
        beq $s2,2,ver_vetor
	beq $s2,3,ordenar_vetor
        jal inicio     
       
        
criar_vetor:
	
	la $t0,Array
	
	la $t1,12
	sw $t1,0($t0)
	
	la $t1,14
	sw $t1,4($t0)
		
	la $t1,13
	sw $t1,8($t0)
	
	la $t1,12
	sw $t1,12($t0)
	
	la $t1,11
	sw $t1,16($t0) 
	
ver_vetor:2
        la $t0,Array

	li $v0,1
	la $a0, 0($t0)
	syscall 
		
	jal inicio

ordenar_vetor:

	jal inicio
	
        
fim_e_impressao:

	jal inicio
	
fim_fim:
        li $v0, 10 
	syscall
	
