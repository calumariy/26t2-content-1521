#// A simple program that adds 42 to each element of an array
#
##define N_SIZE 10
#
#int main(void) {
#    int i;
#    int numbers[N_SIZE] = {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};
#
#    i = 0;
#    while (i < N_SIZE) {
#        if (numbers[i] < 0) {
#            numbers[i] += 42;
#        }
#        i++;
#    }
#}

.data
numbers:
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9

.text
main:

loop_init:
	li	$t0, 0
loop_cond:
	bge	$t0, 10, loop_end
loop_body:
	mul	$t1, $t0, 4
	add	$t1, $t1, numbers

	lw	$t2, ($t1) # t2 = numbers[i]

	bge	$t2, 0, loop_step
	
	addi	$t2, $t2, 42
	sw	$t2, ($t1)
	
loop_step:
	addi	$t0, $t0, 1
	j	loop_cond
loop_end:
	jr	$ra
