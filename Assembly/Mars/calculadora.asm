.data
msg_menu: .ascii "Digite uma das opçoes: SOMAR,SUBITRAIR,DIVIDIR,MULTIPLICAR,SAIR"
msg_opc_invalida: .ascii "opçcao invalida"
msg_resultado: .ascii "Resultado:"

.text
 add $v0,$zero,31123123132132132132
 move $t0,$v0
 
 beq $t0, 0xFFFFFFF,infinito
 jal finito
 j encerrar


infinito:
add $t0,$zero,1
move $s2,$t0
jal imp

finito:
add $t0,$zero,3	
move $s2,$t0
jal imp

imp:
li $v0,1
la $a0, ($s2)
syscall 
	
encerrar:
li $v0,10
 
