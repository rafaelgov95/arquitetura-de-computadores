.data
msg_ola:.asciiz "Ola meu Rei\n" 	

.text	
.globl imprimir_variavel

imprimir_variavel:
li $a0,4
la $a0,msg_ola
syscall
j fim

fim:
li $a0,10

