.text
# Implement a subprogram which takes 4 numbers in the argument registers $a0...$a3, and
# returns the largest value and the average in $v0 and $v1 to the calling program.

largestAndAverage:

move $t0, $a0 
move $t1, $a1
jal getLarger
move $s1, $s0 

move $t0, $s0
move $t1, $a2
jal getLarger

move $t0, $s0
move $t1, $a3
jal getLarger

add $v1, $a0, $a1
add $v1, $v1, $a2
add $v1, $v1, $a3

div $v1, $v1, 4

addi $t1, $zero, 4194356
jr $t1

getLarger:
add $s0, $zero, $t0
bge $t1, $t0, greater
jr $ra

greater:
add $s0, $zero, $t1
jr $ra

# Implement a subprogram that prompt the user for 3 numbers, finds the median (middle value)
# of the 3, and returns that value to the calling program.

median:
# take in 3 numbers
li $v0, 5
syscall
move $t1, $v0

li $v0, 5
syscall
move $t2, $v0

li $v0, 5
syscall
move $t3, $v0

# find median
ble $t1, $t2, branch3	# if t1 > t2
bge $t1, $t3, branch1	# if t1 > t2 and t1 < t3
add $s0, $zero, $t1
j found

branch3: 
ble $t1, $t3, branch1
add $s0, $zero, $t1 # if t1 < t2 and t1 > t3
j found

branch1:
bge $t2, $t3, branch2 
add $s0, $zero, $t2
j found

branch2: 
add $s0, $zero, $t3 
j found

found:
jr $ra

# Implement a subprogram that prompts a user to enter values from 0..100 until a sentinel
# value of -1 is entered. Return the average of the numbers to the calling program.

avg:
add $s0, $zero, $zero
add $s1, $zero, $zero
addi $t1, $zero, -1

while: 
li $v0, 5
syscall
move $t0, $v0
beq $t0, $t1, stop
add $s0, $s0, $t0
addi $s1, $s1, 1
j while

stop:
div $s0, $s0, $s1
jr $ra

# In the utils.asm file, fix the PrintInt subprogram so that it can call the PrintNewLine
# subprogram to print a new line character.

PrintInt:
li $v0, 1
syscall
j nl

nl:
li $v0, 4
la $a0, nline
syscall
jr $ra

End: 
li $v0, 10
syscall

.data
nline: .asciiz "\n"
