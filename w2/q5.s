// Squares a number, unless its square is too big for a 32-bit integer.
// If it is too big, prints an error message instead.

#include <stdio.h>
#define SQUARE_MAX 46340

#int main(void) {
#    int x, y;
#
#    printf("Enter a number: ");
#    scanf("%d", &x);
#
#    if (x > SQUARE_MAX) {
#        printf("square too big for 32 bits\n");
#    } else {
#        y = x * x;
#        printf("%d\n", y);
#    }
#
#    return 0;
#}

SQUARE_MAX = 46340

.data
string1:
	.asciiz "Enter a number: "

string2:
	.asciiz "square too big for 32 bits\n"


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


	ble	$t0, SQUARE_MAX, square # if (x <= SQUARE_MAX)

	la	$a0, string2
	li	$v0, 4
	syscall

	b	epilogue

	blt	$t0, 50, print_fl
	blt	$t0, 50, print_fl

print_fl:
	...
	...
	syscall

square:
	mul	$t1, $t0, $t0
	#printf("%d\n", y)
	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

epilogue:
	jr $ra
