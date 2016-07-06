.data
msg_digite: .asciiz "Digite um Numero Inteiro:"
msg_resultado: .asciiz "O numero Digitado foi:"
txt_enter: .asciiz "\n"

.text
li $v0,4
la $a0, msg_digite
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0, txt_enter
syscall

li $v0,4
la $a0, msg_resultado
syscall

li $v0,1
add $a0,$zero,$t0
syscall
