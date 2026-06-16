#include <stdio.h>

#int main(void) {
#    int x, y;
#
#    printf("Enter a number: ");
#    scanf("%d", &x);
#
#    y = x * x;
#
#    printf("%d\n", y);
#
#    return 0;
#}

.data
string1:
	.asciiz "Enter a number: "


# t0 = x
# t1 = y
.text
main:
	la	$t2, string1
	li	$v0, 4
	move	$a0, $t2 # a0 = t2
	syscall   # printf(string1)

	li	$v0, 5
	syscall 	#scanf(%d, x)
	move	$t0, $v0 # t0 = v0 -> x = v0

	mul	$t1, $t0, $t0

	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

	jr $ra


