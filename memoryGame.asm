.data 

revealed : .word 0, 0, 0, 0,
		 		 0, 0, 0, 0,
		 		 0, 0, 0, 0,
		 	  	 0, 0, 0, 0

board : .word 1, 1, 2, 2, 
	     	  3, 3, 4 ,4, 
	      	  5, 5, 6, 6, 
	      	  7, 7, 8, 8
	      

header1:     .asciiz "*********************************************\n"
header2:     .asciiz "*         JOGO DA MEMÓRIA EM MIPS           *\n"
header3:	 .asciiz "*                                           *\n"
header4:     .asciiz "*  Bem-vindo ao desafio da memória!         *\n"
header5:     .asciiz "*  Encontre os pares escondidos e mostre    *\n"
header6:     .asciiz "*  suas habilidades de raciocínio!          *\n"
header7:     .asciiz "*                                           *\n"
header8:     .asciiz "*  Desenvolvido por: Bruno e Sebastião      *\n"
header9:     .asciiz "*  Disciplina: Arquitetura de Computadores  *\n"
header10:    .asciiz "*                                           *\n"
header11:    .asciiz "*********************************************\n"
	    
asteris : .asciiz "* "
breakLine : .asciiz "\n"
space : .asciiz " "
correct : .asciiz "\nPares iguais, acertou!!"
incorrect: .asciiz "\nOps! Incorreto. Tente novamente"
end_game: .asciiz "\n \tPARABÉNS!! \n FIM DE JOGO."

n_firstRow: .word 0
n_firstColumn: .word 0 
n_secondRow: .word 0
n_secondColumn: .word 0

s_firstRow: .asciiz "\nEnter the row coordinate of first card: "
s_firstColumn: .asciiz "Enter the column coordinate of first card: "
s_secondRow: .asciiz "\nEnter the row coordinate of second card: "
s_secondColumn: .asciiz "Enter the column coordinate of second card: "

.text

li $v0, 4
la $a0, header1
syscall
la $a0, header2
syscall
la $a0, header3
syscall
la $a0, header4
syscall
la $a0, header5
syscall
la $a0, header6
syscall
la $a0, header7
syscall
la $a0, header8
syscall
la $a0, header9
syscall
la $a0, header10
syscall
la $a0, header11
syscall

li $k0, 0 # pares
inicio:
beq $k0, 8, fim
	jal display_board
	li $v0, 4
	la $a0, s_firstRow
	syscall
	li $v0, 5
	syscall
	la $t1, n_firstRow
	sw $v0, 0($t1)
	add $s1, $zero, $v0

	li $v0, 4
	la $a0, s_firstColumn
	syscall
	li $v0, 5
	syscall
	la $t2, n_firstColumn
	sw $v0, 0($t2)
	add $s2, $zero, $v0

	sll $t0, $s1, 2
	add $t0, $t0, $s2
	sll $t0, $t0, 2
	
	la $s4, revealed
	add $s4, $s4, $t0 # s4 endereco do primeiro elemento na tabela revelado
	la $s5, board
	add $s5, $s5, $t0 # s5 endereco do primeiro elemento na tabela original

	addi $t0, $zero, 1
	sw $t0, 0($s4) # revelando o primeiro elemento 
	jal display_board
	

	li $v0, 4
	la $a0, s_secondRow
	syscall
	li $v0, 5
	syscall
	la $t1, n_secondRow
	sw $v0, 0($t1)
	add $s1, $zero, $v0

	li $v0, 4
	la $a0, s_secondColumn
	syscall
	li $v0, 5
	syscall
	la $t2, n_secondColumn
	sw $v0, 0($t2)
	add $s2, $zero, $v0

	sll $t0, $s1, 2
	add $t0, $t0, $s2
	sll $t0, $t0, 2
	
	la $s6, revealed 
	add $s6, $s6, $t0 # s6 endereco do segundo elemento na tabela revelado
	la $s7, board 
	add $s7, $s7, $t0 # s7 endereco do segundo elemento na tabela original
	
	addi $t0, $zero, 1 
	sw $t0, 0($s6) # revelando o segundo elemento 
	jal display_board
	

	
	#buscando meus valores revelados na tabela original
	lw $s1, 0($s5)
	lw $s2, 0($s7)
	#comparando eles
	beq $s1, $s2, acerto
		sw $zero, 0($s4)
		sw $zero, 0($s6) 
		li $v0, 4
		la $a0, incorrect
		syscall
		j inicio
	acerto:
		li $v0, 4
		la $a0, correct
		syscall
		addi $k0, $k0, 1
		j inicio
	
fim:
li $v0, 4
la $a0, end_game
syscall
addi $v0, $zero, 10
syscall


display_board:
	li $v0, 4
	la $a0, breakLine
	syscall
	li $v0, 4
	la $a0, breakLine
	syscall
	
	addi $s2, $zero, 0
	li $v0, 4
	la $a0, space
	syscall
	li $v0, 4
	la $a0, space
	syscall
	begin_cordenada_j:
		bge $s2, 4, end_cordenada_j
		li $v0, 1
		add $a0, $zero, $s2
		syscall
		li $v0, 4
		la $a0, space
		syscall
		addi $s2, $s2, 1
		j begin_cordenada_j
	end_cordenada_j:
	
	addi $s0, $zero, 0 
	addi $s3, $zero, 0
	begin_for_i:
		bge $s0, 4, end_for_i 
		li $v0, 4
		la $a0, breakLine
		syscall
		addi $s1, $zero, 0
		
		li $v0, 1
		add $a0, $zero, $s3
		syscall
		addi $s3, $s3, 1
		li $v0, 4
		la $a0, space
		syscall
	
		begin_for_j:
			bge $s1, 4, end_for_j
			sll $t0, $s0, 2
			add $t0, $s1, $t0
			sll $t0, $t0, 2
			
			la $t1, board
			add $t1, $t0, $t1
		
			la $t2, revealed
			add $t2, $t0, $t2
			lw $t2, 0($t2)
			beq $t2, $zero, escondido # se for igual a zero pule para o escondido		
				lw $a0, 0($t1)
				li $v0, 1
				syscall
				li $v0, 4
				la $a0, space
				syscall
				j proximo
			
			escondido:
			li $v0, 4
			la $a0, asteris
			syscall
			
			proximo:
			addi $s1, $s1, 1
			j begin_for_j
		end_for_j:
		
		addi $s0, $s0, 1
		j begin_for_i
	end_for_i:
	li $v0, 4
	la $a0, breakLine
	syscall
	jr $ra