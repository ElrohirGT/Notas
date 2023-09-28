# Divisibilidad
Dados A y B enteros con B distinto de 0. Decimos que B divide a A si existe un entero K tal que:
$$
A=KB
$$

**Notación:**

Si B sí divide a A:
$$
b|a
$$

Si B no divide a A entonces podemos tachar la línea | para decir "no divide".

Un algoritmo para encontrar este tipo de divisibilidad es el de la **división de Euclides**:
> Todo par $a,b\in Z$ donde $b\neq 0$ puede escribirse como
$$
a=qb+r
$$
> En donde $q,r\in Z$ tal que $a\leq r \leq b$

Por lo tanto, se puede ver que q es el cociente y r es el resultado.

**Número Primo**

Un entero positivo p que solo tiene divisores triviales (los divisores triviales son 1 y el mismo número a) es un número primo. 

**Número Compuesto**

Es un número que no es primo. Es decir, tiene más divisores que los triviales.

En base a estos principios se obtiene [[El Algoritmo de Euclides]], el cual es uno muy eficiente para calcular el mcd entre dos números.
