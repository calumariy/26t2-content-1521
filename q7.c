#include <stdio.h>

int sum(int n);
int recursive_sum(int n);
int main(int argc, char *argv[]) {
        int n;
        printf("Enter a number: ");
        scanf("%d", &n);

        int result = recursive_sum(n);
        printf("Sum of all numbers up to %d = %d\n", n, result);

        return 0;
}

int sum(int n) {
    int result = 0;
    for (int i = 0; i <= n; i++) {
        result += i;
    }
    return result;
}


int recursive_sum(int n) {
	if (n == 0) {
		return 0;
	}

	return n + recursive_sum(n - 1);
}
