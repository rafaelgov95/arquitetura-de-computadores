.data
$msg_valor: .asciiz "\nInsira a primeira nota:\n"
$msg_valor2: .asciiz "\nInsira a segunda nota:\n"

.text
main:
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

        jal divi
        jal fim_fim
        
divi:
	div $s2, $s0, $s1
	jal fim_e_impressao
		
fim_e_impressao:
	li $v0,1
	la $a0, ($s2)
	syscall 
	
	
fim_fim:
        li $v0, 10 
	syscall
	
