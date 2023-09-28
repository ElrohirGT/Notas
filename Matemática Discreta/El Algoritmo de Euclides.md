# El Algoritmo de Euclides

Existe un procedimiento mucho más eficiente para poder calcular el MCD de dos números. Se basa en el siguiente teorema:
> Sea $a$ y $b$ enteros tales que $a=qb+r$ en donde $0\leq r\lt b$. Entonces:
> $$
mcd(a,b)=mcd(b,r)
$$

Por consiguiente los pasos del algoritmo son:
1. Sean a y b enteros positivos tales que $a\gt b$ y $a\ne 0$.
2. Por el algoritmo de la división de Euclides:
$$
a=qb+r, 0\le r\lt b
$$
3. Asignamos $a=b$ y $b=r$.
4. Repetir los pasos 2 y 3 hasta que $r=0$.
5. $mcd(a,b)$ será igual al valor de $b$ al finalizar el algoritmo.

Utilizando este algoritmo es fácil poner en práctica lo propuesto por [[La Identidad de Bézout]].
## Teorema Fundamental de la Aritmética
Todo entero positivo $n>1$ es un número primo o bien un único producto de números primos.

## Cálculo del MCM
Para calcular el MCM de dos números, a y b, se realiza:
$$
\frac{ab}{mcd(a,b)}
$$