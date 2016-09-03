.data
$msg_valor: .asciiz "\nInsira o primeiro valor:\n"
$msg_valor2: .asciiz "\n Insira o segundo valor:\n"
.text

main:
        li $v0,4 
	la $a0, $msg_valor
	syscall 
	
	li $v0, 5
	syscall 
	
	move $t0, $v0
	
	li $v0,4
	la $a0, $msg_valor2
	syscall 
	li $v0, 5
	syscall 	
	move $t1, $v0 

        jal compara
j fim_fim
           


compara:

bge $t0, $t1, seformaior       
jal seformenor


seformaior:
	li $v0,1
	la $a0, ($t2)
	syscall 
        
seformenor:

	li $v0,1
	la $a0, ($t1)
	syscall 
	
fim_fim:
        li $v0, 10 
	syscall	