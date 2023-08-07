# ED de Orden Superior
Tienen la forma de:
$$
a_n(x)\frac{d^ny}{dx^n}+a_{n-1}(x)\frac{d^{n-1}y}{dx^{n-1}}+...+a_1(x)y=g(x)
$$

Todos los términos de $a_n(x)$ deben ser lineales.

## Solución de una ED de Orden Superior Homogénea 
$$
ay''+by'+cy=0
$$

1. Construir la ecuación característica:
$$
am^2+bm+c=0
$$

2. Resolver la ecuación característica y la solución se expresa en base a:
* Si $m_1$ y $m_2$ son reales diferentes, entonces: $y=C_1e^{m_1x}+C_2e^{m_2x}$
* Si $m_1$ y $m_2$ son reales iguales, entonces: $y=C_1e^{m_1x}+C_2xe^{m_2x}$
* Si $m_1$ y $m_2$ son complejos conjugados, entonces: $y=C_1e^{\alpha x}\cos\beta x+C_2e^{\alpha x}\sin\beta x$

Un complejo conjugado tiene la forma de: $\alpha+\beta i$.

## Ejemplos
Resolver:
$$
y'''+3y''-4y=0
$$

Primero encontramos la ecuación característica:
$$
m^3+3m^2-4=0
$$

Ahora para resolver, se puede ver que $m=1$ es una solución a la ecuación, por lo tanto es una de las raíces, solo tenemos que encontrar las demás. Para hacer esto podemos dividir la ecuación dentro de $(m-1)$.

$$
(m-1)(m^2+4m+4)=0\\
(m-1)(m+2)^2=0
$$

Por lo que:
$$
m_1=1;m_{2\ y\ 3}=-2
$$

Entonces siguiendo las reglas de arriba tenemos que:
$$
y=C_1e^x+C_2e^{-2x}+C_3xe^{-2x}
$$
