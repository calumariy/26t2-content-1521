#int main(void) {
#    // This 'for' loop is effectively equivalent to a while loop.
#    // i.e. it is a while loop with a counter built in.
#    for (int x = 24; x < 42; x += 3) {
#        printf("%d\n", x);
#    }

#    int x = 24; # init
#    while (x < 42) { # cond
#        printf(%d\n, x) # body
#        x += 3; # inc
#    # end
#}

#x = t0
.text
main:

loop_init:
	li	$t0, 24
loop_cond:
	bge	$t0, 42, loop_end
loop_body:
	li	$v0, 1
	move	$a0, $t0
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall
loop_inc:
	addi	$t0, $t0, 3
	b	loop_cond
loop_end:
	jr	$ra

