.data

.text
li $v0,5
syscall 

move $t0,$v0
 
beq $t0, 0xFFFFFFF,infinito
jal finito
jal imp
j encerrar


infinito:
add $t0,$zero,1
move $s2,$t0
jr $ra

finito:
add $t0,$zero,$zero 	
move $s2,$t0
jr $ra

imp:
li $v0,1
la $a0, ($s2)
syscall 
jr $ra	
encerrar:
li $v0,10
 
