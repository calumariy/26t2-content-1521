
#include <stdio.h>

FLAG_ROWS=6
FLAG_COLS=12

.data
flag:
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'

.text
# row = t0
main:

outer_loop__init:
	li	$t0, 0
outer_loop__cond:
	bge	$t0, FLAG_ROWS, outer_loop__end
outer_loop__body:

inner_loop__init:
	li	$t1, 0
inner_loop__cond:
	bge	$t1, FLAG_COLS, inner_loop__end
inner_loop__body:
	mul	$t2, $t0, FLAG_COLS
	add	$t2, $t2, $t1
	mul	$t2, $t2, 1
	lb	$t3, flag($t2)

	move	$a0, $t3
	li	$v0, 11
	syscall
	
inner_loop__step:
	addi	$t1, 1
	j	inner_loop__cond
inner_loop__end:

	li	$a0, '\n'
	li	$v0, 11
	syscall

outer_loop__step:
	addi	$t0, 1
	j	outer_loop__cond
outer_loop__end:
