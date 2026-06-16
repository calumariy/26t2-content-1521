#char *string = "....";
#char *s = &string[0];
#int   length = 0;
#while (*s != '\0') {
#   length++;  // increment length
#   s++;       // move to next char
#}

 .data
string:
   .asciiz  "...."

.text
main:
	la	$t0, string
	li	$t1, 0	# length

cond:
	lb	$t2, ($t0)
	beq	$t0, '\0', end

	addi	$t0, $t0, 1
	addi	$t1, $t1, 1

	j	cond

end:
	jr	$ra
