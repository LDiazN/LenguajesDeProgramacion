// Carnet: 15-10420
// X = 4
// Y = 2
// Z = 0
// alpha = ((X + Y) % 5) + 3 = 4 
// beta  = ((Z + Y) % 5) + 3 = 5
#include <stdio.h>
#include <assert.h>
#include <time.h>

int f_recursive(int n) {
    if (0 <= n && n < 20) return n;

    int sum = 0;
    int i = 0;
    sum +=  f_recursive(n - 5)  + 
            f_recursive(n - 10) + 
            f_recursive(n - 15) +
            f_recursive(n - 20);

    return sum;
}

int main() {

    int input = 100;
    clock_t t;
    t = clock();
    int x = f_recursive(input);
    t = clock() - t;
    double ellapsed = ((double) t) / CLOCKS_PER_SEC;
    printf("recursive: %d, input: %d\n", x, input);
    printf("time: %f\n",ellapsed);
    
    return 0;
}