# Mila Kuang
# 05/08/2023

.text
main:
#1

li $v0, 5
syscall
move $a0, $v0

li $v0, 5
syscall
move $a1, $v0

li $v0, 5
syscall
move $a2, $v0

li $v0, 5
syscall
move $a3, $v0

jal largestAndAverage

li $v0, 4
la $a0, biggestNum
syscall

move $a0, $s0
jal PrintInt

li $v0, 4
la $a0, averageNum
syscall

move $a0, $v1
jal PrintInt

#3

jal median 

li $v0, 4
la $a0, medianNum
syscall

move $a0, $s0
jal PrintInt

#4

jal avg

li $v0, 4
la $a0, averageNum
syscall

move $a0, $s0
jal PrintInt

jal End


.data
biggestNum: .asciiz "Biggest number: "
averageNum: .asciiz "Average number: "
medianNum: .asciiz "Median number: "
.include "utils.asm"
