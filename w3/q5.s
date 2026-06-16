#// A simple program that will read 10 numbers into an array
#
##define N_SIZE 10
#
##include <stdio.h>
#
#int main(void) {
#    int i;
#    int numbers[N_SIZE] = {0};
#
#    i = 0;
#    while (i < N_SIZE) {
#        scanf("%d", &numbers[i]);
#        i++;
#    }
#}

.data
numbers:
	.word 0:10

.text
main:
loop_init:
	li	$t0, 0 #i = 0
loop_cond:
	bge	$t0, 10, loop_end
loop_body:
	li	$v0, 5
	syscall

	# compute &numbers[i] -> i * 4 + numbers
	mul	$t1, $t0, 4
	sw	$v0, numbers($t1)
loop_step:
	addi	$t0, $t0, 1
	j	loop_cond
loop_end:
	jr	$ra

