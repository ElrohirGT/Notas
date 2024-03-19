# Variables Aleatorias Múltiples
La colección de:
$$
X=(X_1, X_2, X_3)
$$

Tiene un intervalo:
$$
I=(-\infty,a_1]\times(-\infty,a_2]\times(-\infty,a_3]
$$

Y su imagen inversa:
$$
X^{-1}(I)\in S
$$

En este caso $X$ es una variable aleatoria de 3 dimensiones, pues su vector de variables aleatorias tiene 3 componentes.

La función acumulada de una variable aleatoria de $n$ dimensiones se escribe:
$$
F_{X_1,X_2,...,X_n}(a_1,a_2,...,a_n)=P([X_1\le a_1]\cap[X_2\le a_2]\cap\dots\cap[X_n\le a_n])
$$

## Propiedades
Algunas propiedades no tan intuitivas de las funciones acumuladas:
$$
\lim_{X_1\rightarrow\infty}F_{X_1,X_2}(x_1,x_2)=F_{X_2}(x_2)
$$
$$
\lim_{X_2\rightarrow\infty}F_{X_1,X_2}(x_1,x_2)=F_{X_1}(x_1)
$$
$$
\lim_{X_2\rightarrow\infty}\lim_{X_1\rightarrow\infty}F_{X_1,X_2}(x_1,x_2)=1
$$

Cuando una función acumulada es reducida de esta forma hasta que solamente se tenga una sola distribución de una sola variable entonces se le llama función acumulada marginal.

## Variables Aleatorias Discretas Conjuntas
Debe cumplir:
$$
P((X_1,X_2)\in A)=\sum_{i_1}\sum_{i_2}P_{i_1,i_2}=1
$$

En donde $A$ es contable.

## Ejemplos
Se tiene una moneda y un dado de 3 caras:
$$
X=(Moneda,\ Dado)
$$

En el caso de la moneda tenemos:
$$
M=\begin{cases}
1&,cara\\
0&,cruz
\end{cases}
$$

Y el dado:
$$
D=\begin{cases}
1&,Cara\ 1\\
2&,Cara\ 2\\
3&,Cara\ 3\\
\end{cases}
$$

Entonces el $\Omega=\{(0,1), (0,2),(0,3),(1,1)...\}$

Debido a que todos los resultados de $\Omega$ tienen la misma probabilidad entonces la función de probabilidad se escribe:
$$
P([M=i_1]\cap[D=i_2])=\frac16\ para\ i_1=0,1\ y\ i_2=1,2,3
$$
