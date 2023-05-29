addi $t0, $0, 1		# a = [ 1, 3, 9, 27, ... ,729] 
add $t1, $0, $t0	# b = [ 1, 4, 16, 64, ...,4096] 
add $t2, $0, $t0	# c = [ 1, -1, 1, -1, ... ] 
addi $t3, $0, 7		# Sum from i=0 to i=6
add $s0, $0, $0		# i=0

loop:
slt $t4, $s0, $t3	# Check if i<7
beq $t4, $0, done	# i=7 - done, else continue
addi $t5, $0, 1		# Temp value storage
mul $t5, $t5, $t0	# 1*a[i]
mul $t5, $t5, $t1	# 1*b[i]*b[i]
mul $t5, $t5, $t2	# 1*a[i]*b[i]*c[i]
add $s1, $s1, $t5	# $s1 = $s1 + 1*a[i]*b[i]*c[i]
addi $t9, $0, 3		# For mult op
mul $t0, $t0, $t9	# A[i+1] = 3*a[i]
addi $t9, $0, 4		# For mult op
mul $t1, $t1, $t9	# B[i+1] = 4*b[i]
addi $t9, $0, -1	# For mult op
mul $t2, $t2, $t9	# C[i+1] = (-1)*c[i]
addi $s0, $s0, 1	# i++
j loop			# Jump back to the loop

done: