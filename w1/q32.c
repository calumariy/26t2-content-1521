#include <stdio.h>
#include <stdlib.h>

int *get_num_ptr(void);

int main(void) {
    int *n = get_num_ptr();
    printf("%d\n", *n);
    free(n);
}

int *get_num_ptr(void) {
    int *num = malloc(sizeof int);
    *num = 42;
    return num;
}


