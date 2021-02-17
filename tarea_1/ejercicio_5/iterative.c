// Carnet: 15-10420
// X = 4
// Y = 2
// Z = 0
// alpha = ((X + Y) % 5) + 3 = 4 
// beta  = ((Z + Y) % 5) + 3 = 5
#include <stdio.h>
#include <assert.h>

int f_iterative(int n) {
    if (n < 20) return n;

    // Base es el i tal que es el primero en retornar su caso base desde la llamada 
    // recursiva, lo necesitamos para hacer una busqueda bottom up.
    int base = 20 + n % 5; 

    // i es el indice que usabamos en f_aux_tail para marcar qué f(i) estabamos calculando
    // en ese momento, hasta llegar al f(n) aumentando a i de 5 en 5
    int i = base;

    // Las variables nj tienen los resultados para f(i-5*j), que anteriorment manteniamos 
    // en los argumentos de la funcion f_aux_tail 
    int n1 = base - 20, n2 = base - 15, n3 = base - 10, n4 = base - 5;

    // cada iteracion del while es una llamada a f_aux_tail
    while(i < n) { // caso base de f_aux_tail
        int temp = n1 + n2 + n3 + n4;           // cuerpo y argumentos de f_aux_tail
        n1 = n2; n2 = n3; n3 = n4; n4 = temp;

        i += 5;
    }

    assert(i == n && "Oh no, i no deberia ser mayor que n");

    return n1 + n2 + n3 + n4; // i == target, devuelve la suma de los 4 anteriores, tal como en f_aux_tail
}

int main() {

    int input = 100;
    int x = f_iterative(input);
    printf("iterative: %d, input: %d\n",x, input);

    return 0;
}