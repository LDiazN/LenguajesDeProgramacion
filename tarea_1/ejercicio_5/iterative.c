// Carnet: 15-10420
// X = 4
// Y = 2
// Z = 0
// alpha = ((X + Y) % 5) + 3 = 4 
// beta  = ((Z + Y) % 5) + 3 = 5
#include <stdio.h>
#include <assert.h>
#include <time.h>

long long f_iterative(long long n) {
    if (n < 20) return n;

    // Base es el i tal que es el primero en retornar su caso base desde la llamada 
    // recursiva, lo necesitamos para hacer una busqueda bottom up.
    long long base = 20 + n % 5; 

    // i es el indice que usabamos en f_aux_tail para marcar qué f(i) estabamos calculando
    // en ese momento, hasta llegar al f(n) aumentando a i de 5 en 5
    long long i = base;

    // Las variables nj tienen los resultados para f(i-5*j), que anteriorment manteniamos 
    // en los argumentos de la funcion f_aux_tail 
    long long n1 = base - 20, n2 = base - 15, n3 = base - 10, n4 = base - 5;

    // cada iteracion del while es una llamada a f_aux_tail
    while(i < n) { // caso base de f_aux_tail
        long long temp = n1 + n2 + n3 + n4;           // cuerpo y argumentos de f_aux_tail
        n1 = n2; n2 = n3; n3 = n4; n4 = temp;

        i += 5;
    }

    assert(i == n && "Oh no, i no deberia ser mayor que n");

    return n1 + n2 + n3 + n4; // i == target, devuelve la suma de los 4 anteriores, tal como en f_aux_tail
}

int main() {

    long long input = 10000;
    clock_t t;
    t = clock();
    long long x = f_iterative(input);
    t = clock() - t;
    double ellapsed = ((double) t) / CLOCKS_PER_SEC;

    printf("iterative: %lld, input: %lld\n",x, input);
    printf("time: %f\n",ellapsed);

    return 0;
}