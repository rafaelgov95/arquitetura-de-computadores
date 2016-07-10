.data
Array:  .space 20    
.text

main:
#carregar array

	la $t0,Array

	la $t1,10
	sw $t1,0($t0)
	
	la $t1,10
	sw $t1,4($t0)
		
	la $t1,10
	sw $t1,8($t0)
	
	la $t1,10
	sw $t1,12($t0)
	
	la $t1,10
	sw $t1,16($t0) 
	jal soma
	jal final
soma:	
# linhas para soma
	lw $t1,0($t0) 
	add $t2,$t1,$zero 
	
	lw $t1,4($t0) 
	
	add $t2,$t1,$t2 
	
	lw $t1,8($t0) 
	add $t2,$t1,$t2 
	
	lw $t1,12($t0) 
	add $t2,$t1,$t2 
	
	lw $t1,16($t0) 
	add $t2,$t1,$t2 
	#melhor parte disvio condicional :D
	jr $ra
final:	
	li $v0,1
	move $a0,$t2 
	syscall