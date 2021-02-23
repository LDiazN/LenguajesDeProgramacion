// Carnet: 15-10420
// X = 4
// Y = 2
// Z = 0
// alpha = ((X + Y) % 5) + 3 = 4 
// beta  = ((Z + Y) % 5) + 3 = 5
#include <stdio.h>
#include <assert.h>
#include <time.h>

long long f_aux_tail(long long n1, long long n2, long long n3, long long n4, long long i, long long target) {
    // asumiendo n >= 20

    assert( i <= target && "oh no, i no puede ser mayor que target");

    long long temp = n1 + n2 + n3 + n4;

    if (i == target) return temp;

    f_aux_tail(n2,n3,n4, temp, i + 5, target);

}

long long f_tail (long long n){
    if ( n < 20 ) return n;

    // Calculamos el caso base
    long long base = 20 + n % 5;

    return f_aux_tail(base - 20, base - 15, base - 10, base - 5, base, n);
} 

int main() {

    long long input = 10000;
    clock_t t;
    t = clock();
    long long x = f_tail(input);
    t = clock() - t;
    double ellapsed = ((double) t) / CLOCKS_PER_SEC;

    printf("tail recursive: %lld, input: %lld\n", x, input);
    printf("time: %f\n",ellapsed);

    return 0;
}