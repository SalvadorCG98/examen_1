
.data

	V: .word 1, 2, 3
	M: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
	R: .word 0, 0, 0
	
.text
	addi $s0, $s0, 0 # i
	addi $s1, $s0, 0 # j
	addi $t7, $t7, 0 # auxiliar 
	
	la $s5, V # Dirección V
	la $s6, M # Dirección M
	la $s7, R # Dirección R 
	
	
for_1:  slti $t0, $s0, 3
        beq $t0, $zero, endfor_1
        for_2:
        	slti $t1, $s1, 3
        	beq $t1, $zero, endfor_2
        	add $t7, $t7, $s1
        	
        	sll $t2, $s1, 2		# Shift left j
		add $t2, $t2, $s5	# Adding an offset to the base address
		lw $t3, 0($t2)		# Loading V[j]
		
		sll $t2, $t7, 2		# Shift left i
		add $t2, $t2, $s6	# Adding an offset to the base address
		lw $t4, 0($t2)		# Loading data from memory
        	
        	mul $t5, $t3, $t4       # M[i][j]* V[j]
        	
        	sll $t2, $s7, 2		# Shift left i
		add $t2, $t2, $s7	# Adding an offset to the base address
		lw $t6, 0($t2)		# Loading R[i]
        	
        	add $t6, $t6, $t5       # R[i]=R[i]+M[i][j]* V[j]
        	
        	sll $t2, $s7, 2		# Shift left i
		add $t2, $t2, $s7	# Adding an offset to the base address
		sw $t6, 0($t2)		# Storing R[i]
        	
        	addi $s1, $s1, 1
        	j for_2
        endfor_2:
        addi $t7, $t7, 3 # auxiliar matriz
        addi $s1, $s0, 0 # j
        addi $s0, $s0, 1
        j for_1
endfor_1:
	
	