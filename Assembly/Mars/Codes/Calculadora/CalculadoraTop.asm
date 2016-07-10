.data
$menu: .asciiz "\nOlá Seja bem Vindo a MegaMaster Calculator \n Agora escolhe uma das Opçoẽs abaixo: \n 1-Soma \n 2-Subtracao \n 3-Multiplicacao\n 4-Divisao \n 5-Sair \n"
$msg_valor: .asciiz "\nInsira o primeiro valor:\n"
$msg_valor2: .asciiz "\n Insira o segundo valor:\n"
$msg_soma: .asciiz  "\n Resultado da Soma:\n" 
$msg_sub: .asciiz "\n Resultado da subtracao :\n" 
$msg_mult: .asciiz "\n Resultado da Multiplicacao:\n"
$msg_div: .asciiz "\nResultado da Divisao:" 


.text
        
inicio:

	li $v0,4 
	la $a0, $menu 
	syscall 
	li $v0, 5 
	syscall 
	move $s2, $v0
        beq $s2,5,fim_fim
        jal dados
       
 dados:
        li $v0,4 
	la $a0, $msg_valor
	syscall 
	
	li $v0, 5
	syscall 
	
	move $s0, $v0
	
	li $v0,4
	la $a0, $msg_valor2
	syscall 
	li $v0, 5
	syscall 	
	move $s1, $v0 

	beq $s2,1,soma
	beq $s2,2,sube
	beq $s2,3,multi
	beq $s2,4,divi
        beq $s2,5,fim_fim
        jal inicio
        
divi:
	li $v0,4 
	la $a0, $msg_div 
	syscall 
	div $s2, $s0, $s1
	jal fim_e_impressao
	
	
sube:
	li $v0,4
	la $a0, $msg_sub 
	syscall 
	sub $s2, $s0, $s1 
	jal fim_e_impressao 
	 
multi:
	li $v0,4
	la $a0, $msg_mult 
	syscall  
	mul $s2, $s0, $s1 
	jal fim_e_impressao 
		
soma:
	li $v0,4
	la $a0, $msg_soma 
	syscall 
	add $s2, $s0, $s1 
        jal fim_e_impressao 
        
fim_e_impressao:
	li $v0,1
	la $a0, ($s2)
	syscall 
	jal inicio
	
fim_fim:
        li $v0, 10 
	syscall
	
