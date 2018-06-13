
.data

	V: .word 1, 2, 3
	M: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
	R: .word 0, 0, 0
	
.text
	addi $s0, $s0, 0 # i
	addi $s1, $s0, 0 # j
	
for_1:  slti $t0, $s0, 3
        beq $t0, $zero, endfor_1
        addi $s0, $s0, 1
        for_2:
        	slti $t1, $s1, 3
        	beq $t1, $zero, endfor_1
        	addi $s1, $s1, 1
        	j for_2
        endfor_2:
        addi $s1, $s0, 0 # j
        j for_1
endfor_1:
	
	