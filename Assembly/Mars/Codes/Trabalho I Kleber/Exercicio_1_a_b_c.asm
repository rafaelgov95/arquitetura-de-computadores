.data
$Pergunta_a: .asciiz "\n1) Quais são essas classes ?\n"	
$Resposta_a: .asciiz "\nResposta: As instruções são divididas em três tipos do formato: Formato de R, de I e de J\n."
$Pergunta_b: .asciiz "\n2) Quais caracteristicas cada classe possui?\n"	
$Resposta_c: .asciiz "\nResposta:\nTIPO R opcode (6) rs (5) rt (5) rd (5) shamt (5) funct (6).\nTIPO I opcode (6) rs (5) rt (5) imediato (16). \nTIPO J opcode (6) endereço (26)\nTodos em bits\n."
$Pergunta_c: .asciiz "\n3) Como os campos são divididos nas instruções ?\n"	
$Resposta_b: .asciiz "\nResposta: O formato de R consiste em três registradores e campo funcional, o formato I contém dois registradores e o valor imediato de 16 bits, e por último o formato J, no qual seu opcode tem seis bits seguido de um valor imediato de 26 bits\n."

.text 
li $v0,4 
la $a0, $Pergunta_a
syscall 

li $v0,4 
la $a0, $Resposta_a
syscall 

li $v0,4 
la $a0, $Pergunta_b
syscall 

li $v0,4 
la $a0, $Resposta_b
syscall 

li $v0,4 
la $a0, $Pergunta_c
syscall 

li $v0,4 
la $a0, $Resposta_c
syscall 