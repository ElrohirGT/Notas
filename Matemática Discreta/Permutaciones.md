# Permutación

Se le llama permutación a una forma de ordenar los números dentro de un
conjunto. Su fórmula es la siguiente: $$ n!=n\\cdot(n-1)! $$

También se le puede llamar **r-permutación** en el caso en donde no se permuten
a todos los elementos del conjunto. La fórmula para una r-permutación es: $$
n\\cdot(n-1)\\cdot(n-2)\\cdot...\\cdot(n-(r-1))=\\frac{n!}{(n-r)!} $$

## Permutación Circular

Son las permutaciones que se realizan cuando ordenamos los elementos en un
círculo, lo cual hace que varias permutaciones lineales sean realmente la misma
configuración circular girada. Se pueden contar utilizando el principio de
funciones-k. Su fórmula utilizando el principio de funciones k: $$ (n-1)! $$

### Funciones k a 1

Se dice que $f:X\\rightarrow Y$ es una función k a 1 si asigna k elementos de X
a un Y único. Si esta función existe, entonces: $$ |X|=k|Y| $$ Como mínimo.

## Permutar con elementos repetidos

Dado un conjunto con n objetos en el que hay $n_1$ elementos del tipo 1 y $n_2$
objetos iguales del tipo 2... Hasta $n_k$. Entonces la cantidad de permutaciones
que se pueden realizar es: $$ \\frac{n!}{n_1!n_2!n_3!...n_k!} $$
