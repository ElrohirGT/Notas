# Método de Coeficientes Indeterminados
## Caso 1: términos de $y_p$ no se repiten en $y_c$
Es aplicable solamente en EDO Lineales:
$$
a_ny^{(n)}+a_{n-1}y^{(n-1)}+...+a_0y=g(x)
$$

En donde $g(x)$ es un polinomio o una constante, aunque puede ser también $e^{ax}$ y $\sin ax$

1. Resolver ED Homogénea asociada -> $Y_c:\ Complementaria$.
2. Suponer una solución $Y_p$: Según tabla 4.4.1 (p. 146). Se busca la ecuación general de la ecuación.
![[y_p según g(x).png]]
3. Sustituir $Y_p^{n}$,$Y_p^{n-1}$,$Y_p^{n-2}$... y $Y_p$ en ED. Encontrar coeficientes
4. $Y=Y_c+Y_p$

## Ejemplos
Resolver:
$$
y''+4y'-2y=2x^2-3x+6
$$

Primero encontramos y resolvemos la ecuación homogénea asociada:
$$
y''+4y'-2y=0
$$
$$
m^2+4m-2=0
$$

dando:
$$
m_1=-2+\sqrt6;\ m_2=-2-\sqrt6
$$

por lo tanto
$$
y_c=C_1e^{(-2+\sqrt6)x}+C_1e^{(-2-\sqrt6)x}
$$

Ahora definimos $Y_p$, en este caso como siguiendo la tabla es:
$$
y_p=Ax^2+Bx+C
$$

Derivamos para encontrar $y'_p$:
$$
y'_p=2Ax+B
$$

Y también tenemos que encontrar $y''_p$:
$$
y''_p=2A
$$

Ahora sustituimos en la ecuación original:
$$
2A+4(2Ax+B)-2(Ax^2+Bx+C)
$$
$$
2A+8Ax+4B-2Ax^2+2Bx+2C
$$
$$
-2Ax^2+2Bx+8Ax+4B+2A+2C
$$

Esta ecuación debería de ser igual a $g(x)$, por lo que nos queda un sistema de ecuaciones:
$$
2x^2=-2Ax^2\therefore A=-1
$$
$$
-3x=2Bx+8Ax\therefore B=-\frac52
$$
$$
6=4B+2A+2C\therefore C=-9
$$

Por lo tanto $Y_p$ es:
$$
y_p=-x^2-\frac52x-9
$$

Por lo que y es:
$$
y=y_c+y_p=C_1e^{(-2+\sqrt6)x}+C_1e^{(-2-\sqrt6)x}-x^2-\frac52x-9
$$
