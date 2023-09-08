# Transformadas de Derivadas
Siempre se necesita que nos den o las funciones o los valores que devuelven las derivadas de $f$ hasta el $n-1$.

$$
L\left\{f^{(n)}(t)\right\}=s^nF(s)-s^{n-1}f(0)-s^{n-2}f'(0)-...-f^{(n-1)}(0)
$$

## Ejemplos
$$
y''-3y'+2y=e^{-4t}
$$

Con valores iniciales:
$$
f(0)=1
$$

$$
f'(0)=5
$$

Se aplica la transormada a cada término:
$$
S^2Y(s)-sf(0)-f'(0)-3[sY(s)-f(0)]+2Y(s)=\frac{1}{s+4}
$$

Una vez se tiene esto se resuelve el sistema de ecuaciones.
$$
Y(s)=\frac{s+2}{(s-1)(s-2)}+\frac{1}{(s-1)(s-2)(s-4)}=(\frac{(s+2)(s+4)+1}{(s-1)(s-2)(s-4)}
$$

Ahora se saca la transformada inversa de laplace para regresarla a la normalidad:
$$
y(t)=-\frac{16}{5}e^t+\frac{25}{6}e^{2t}+\frac{1}{30}e^{-4t}
$$
