.globl main
main:

.data
array: .word 89, 19, 91, 23, 31, 96, 3, 67, 17, 11, 43, 75  #array

msg1: .asciiz "Index of the largest number: "
msg2: .asciiz "The Largest number: "
nl: .asciiz "\n"

.text

la $s7, array            #address of array
addi $s0, $zero, 0     #max=0
addi $s1, $zero, 0     #maxIndex=0
addi $s2, $zero, 0     #i=0
addi $t3, $zero, 0
addi $t4, $zero, 1

STARTLOOP:
addi $s3, $s2, -12  #s3 = s2-12
beq $s3, $t3 ENDLOOP   #branch if s3 ==12
add $s4, $s2, $s2   #temp = 2i
add $s4, $s4, $s4
add $s5, $s7, $s4   #compute address

lw $s6, 0($s5)      #load arr[i]

slt $t0, $s0, $s6	#set t0=1 if arr[i] < max
addi $s2, $s2, 1    #increment i
beq $t0, $zero, STARTLOOP	#jump to top if less
lw $s0, 0($s5)		#else set max=arr[i]
sub $s1, $s1, $s1	#subtrat the max index by itself
add $s1, $s1, $s2	#set max index to current index
sub $s1, $s1, $t4

j STARTLOOP
ENDLOOP:

la $a0, msg1    #load msg1 to a0
li $v0, 4	#print string
syscall 

move $a0, $s1	#move s1 to a0
li $v0, 1	#print int
syscall 

la $a0, nl	#load nl to a0
li $v0, 4	#print string
syscall 
syscall		#double space

la $a0, msg2	#load msg2 to a0
li $v0, 4	#print string
syscall 

move $a0, $s0	#move s0 to a0
li $v0, 1	#print int
syscall 

