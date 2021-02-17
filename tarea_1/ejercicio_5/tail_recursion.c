// Carnet: 15-10420
// X = 4
// Y = 2
// Z = 0
// alpha = ((X + Y) % 5) + 3 = 4 
// beta  = ((Z + Y) % 5) + 3 = 5
#include <stdio.h>
#include <assert.h>
#include <time.h>

int f_aux_tail(int n1, int n2, int n3, int n4, int i, int target) {
    // asumiendo n >= 20

    assert( i <= target && "oh no, i no puede ser mayor que target");

    int temp = n1 + n2 + n3 + n4;

    if (i == target) return temp;

    f_aux_tail(n2,n3,n4, temp, i + 5, target);

}

int f_tail (int n){
    if ( n < 20 ) return n;

    // Calculamos el caso base
    int base = 20 + n % 5;

    return f_aux_tail(base - 20, base - 15, base - 10, base - 5, base, n);
} 

int main() {

    int input = 100000;
    clock_t t;
    t = clock();
    int x = f_tail(input);
    t = clock() - t;
    double ellapsed = ((double) t) / CLOCKS_PER_SEC;

    printf("tail recursive: %d, input: %d\n", x, input);
    printf("time: %f\n",ellapsed);

    return 0;
}