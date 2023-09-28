# Identidad de Bezout
> Dados dos enteros a y b diferentes de cero, existen $x,y \in Z$ tales que:
> $$
ax+by=mcd(a,b)
$$

Es en realidad un caso especial de un tipo de ecuaciones llamadas [[Ecuaciones Diofánticas]], las cuales tienen la forma $ax+by=c$. Se puede utilizar esta identidad para encontrar sus soluciones en las que a y b sean enteros.
## Ejemplos
$$
mcd(102,38)=102x+38y
$$

Primero se calcula el MCD por euclides:
$$
102=38\cdot2+26
$$
$$
38=26\cdot1+12
$$
$$
26=12\cdot2+2
$$
$$
12=2\cdot6+0
$$

Entonces el MCD es 2.

Ahora para encontrar x,y se toma la última ecuación que tiene residuo distinto de 0 y se despeja en términos del r:
$$
2=26-12\cdot2
$$

Ahora se reemplaza el 12 por el 12 que es residuo:
$$
12=38-26\cdot1
$$
$$
2=26-2(38-26)
$$

Se sigue sustituyendo hasta llegar al final en donde ya se tiene 102 y 38. Simplificar hasta obtener la forma de:
$$
102x+38y
$$

En este caso $x=3$ $y=-8$.
