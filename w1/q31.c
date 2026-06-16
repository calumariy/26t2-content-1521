#include <stdio.h>

void get_num_ptr(int *n);

int main(void) {
    int n;
    get_num_ptr(&n);
    printf("%d\n", n);
}

void get_num_ptr(int *n) {
    *n = 42;
    return ;
}


