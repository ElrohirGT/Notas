# Convergencia
Orden de fortaleza de convergencias:
* Convergencia puntual.
* Convergencia con probabilidad 1.
* Convergencia en probabilidad.
* Convergencia en distribución.
 
## Convergencia en distribución
Se calcula viendo si una función distribución acumulada de una variable converge punto a punto a alguna otra función de distribución acumulada.

## Convergencia puntual
Se evalúa si cada punto $w$ evaluado en el límite converge a la variable aleatoria objetivo.
$$
\lim_{n\rightarrow\infty} X_n(w)=X(w)
$$

## Convergencia en probabilidad
Sea $\epsilon\gt0$.

Si todas las ramas al sacarles el límite son 0 entonces se dice que la secuencia de variables aleatorias $X_n$ convergen a la variable aleatoria $A$.
$$
\lim_{n\rightarrow\infty} P([|X_n-A|\gt\epsilon])=\begin{cases}
ramas\ de\ epsilon
\end{cases}
$$

Si se tiene una secuencia de funciones $F_n$ y existe una distribución $F$, si $F_n(x)\rightarrow F(x)$ cuando $n\rightarrow \infty$ entonces se dice que esta secuencia de funciones converge de ley (o débilmente) hacia $F$. Debido a que las variables aleatorias son funciones, esto también aplica para ellas.

## Convergencia con probabilidad 1
Dada una secuencia de variables aleatorias se dice que $X_n$ converge casi seguramente a una variable aleatoria $X$ si y sólo si $P([\lim_{x\rightarrow\infty} X_n=X])=1$ (o $P(\{w: X_n(w)\rightarrow X(w)\ cuando\ n\rightarrow\infty\})$).

## Ley débil de los grandes números

Sean $X_1, X_2, \dots$ una sucesión de variables aleatorias independientes e idénticamente distribuidas con media finita $\mu$. Entonces:
$$
\forall \epsilon\gt0 , \lim_{n\rightarrow\infty} P([|\frac{X_1+X_2+\dots+X_n}{n}-\mu|\gt\epsilon])=0
$$

Esta ley utiliza ls convergencia de probabilidad.

## Teorema de Límite Central
Sean $X_1, X_2, \dots$ una sucesión de variables aleatorias independientes e idénticamente distribuidas con media finita $\mu$ y varianza finita $\sigma^2$. Entonces:
$$
\lim_{n\rightarrow\infty} P([\frac{X_1+X_2+\dots+X_n}{\sigma\sqrt{n}}\le x])=\frac{1}{\sqrt{2\pi}}\int_{-\infty}^x e^{-\frac{x^2}{2}}dx
$$

## Ejemplos
Dada una secuencia $\{X_n\}$ de variables aleatorias con $P([X_n=1])=\frac{1}{n}$ y $P([X_n=0])=1-\frac{1}{n}$

Si se grafican cada uno de estos puntos de masa de probabilidad entonces se puede ver que a medida que $n$ incrementa la probabilidad en $X_n=1$ se acerca más y más a 0, mientras que en $X_n=0$ se acerca cada vez más a 1.

Haciendo con el método de convergencia de probabilidad:
$$
\lim_{n\rightarrow\infty} P([|X_n-0|\gt\epsilon])=\begin{cases}
P([X_n=1])=\frac{1}{n} &,0\lt\epsilon\lt 1\\
P(\empty)=0 &,\epsilon\ge 1\\
\end{cases}
$$
$$
\lim_{n\rightarrow\infty} P([|X_n-0|\gt\epsilon])=\begin{cases}
0&,0\lt\epsilon\lt 1\\
0&,\epsilon\ge 1\\
\end{cases}
$$

Entonces se puede decir que $X_n$ tiende a la variable aleatoria $0$.
