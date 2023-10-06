# Aritmética Modular

El operador módulo, $a\ mod\ m$, se define como una función que devuelve el residuo cuando a se divide por m.

Por el algoritmo de Euclides se sabe que:
$$
0\leq a\ mod\ m \lt m
$$

Todos los números módulo m se pueden agrupar en un conjunto:
$$
Z_m=\{0,1,2,3,\cdots,m-1\}
$$

## Congruencia Módulo
Decimos que a y b son congruentes si y solo si:
$$
a\ mod\ m=b\ mod\ m
$$

El símbolo para representar congruencia es:
$$
a\cong b
$$

El que dos números sean congruentes significa que:
$$
a-b=km
$$
Es decir, la diferencia de a y b es un múltiplo de m.

## Multiplicación por inversos
La división no está definida en $Z_m$, sin embargo se puede mutliplicar por un número que de una resultado congruente con 1. Como si se hubiera dividido por el inverso.

$$
a\cdot b\cong1\ (mod\ m)
$$

Por lo que se dice, el 0 no tiene inverso y el 1 siempre es su propio inverso.

Para que un número a tenga inverso en algún módulo m, tanto el número como el módulo deben ser coprimos.

## Ejemplos
Dé una descripción del conjunto $Z_5$.
$$
[0]=\{5k, k\in Z\}
$$
$$
[1]=\{5k+1, k\in Z\}
$$
$$
\cdots
$$
$$
[4]=\{5k+4,k\in Z\}
$$

---

Determine si el 5 tiene inverso en $Z_{13}$.

Por la definición de congruencia tenemos:
$$
5x\cong 1\ (mod\ 13)
$$

Usando la propiedad de congruencia la podemos convertir a:
$$
5x-1=13k
$$

Ahora podemos definir a $y=-k$ y reescribir:
$$
5x+13y=1
$$

Lo cual es una ecuación diofántica. Si esta ecuación se puede resolver, el valor de x será el inverso.

Por lo que resolviendo tenemos que $x=-5;\ y=2$. Ahora obtenemos la solución general, particularmente la de x porque es la que nos importa.

$$
x=-5+\frac{13}{1}\lambda=-5+13\lambda
$$

Pasando a clases de equivalencia del $Z_{13}$:
$$
x=8+13\lambda\ (mod\ 13)
$$

Por lo que el inverso de 5 en $Z_{13}$ es igual a 8.
