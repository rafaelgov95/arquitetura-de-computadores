.data
msg_menu: .ascii "Digite uma das opçoes: SOMAR,SUBITRAIR,DIVIDIR,MULTIPLICAR,SAIR"
msg_opc_invalida: .ascii "opçcao invalida"
msg_resultado: .ascii "Resultado:"

.text
 
 lop:
 li $v0,4
 la $a0,msg_menu
 syscall
 
 li $v0,5
 syscall
 move $t0,$v0
 # if($t0==0) 
 beq $t0, $zero,encerrar
 li $t1,1
 sub $t2, $t1,$t0
 # if($t0==1) 
 beq $t2,$zero,soma
 
 li $t1,2
 sub $t2, $t1,$t0
 # if($t0==2) 
 beq $t2,$zero,subtrair
 
 li $t1,2
 sub $t2, $t1,$t0
 # if($t0==3) 
 beq $t2,$zero,multiplicar
 li $t1,2
 sub $t2, $t1,$t0
 # if($t0==4) 
 beq $t2,$zero,dividir
 
 j lop
 dividir:
 multiplicar:
subtrair:
soma:
encerrar:
li $v0,10
 