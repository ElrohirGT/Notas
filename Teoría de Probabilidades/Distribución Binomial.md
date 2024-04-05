# Distribución Binomial
Tienes una cantidad de experimentos fijos y se busca la probabilidad de obtener $k$ cantidad de éxitos.

Sus experimentos siembre son independientes entre sí.

Se define la variable aleatoria $X$ como el número de éxitos en $n$ intentos.

La función de masa de probabilidad es:
$$
P([X=k])= \begin{pmatrix}
n \\ k
\end{pmatrix} p^k(1-p)^{n-k}
$$

En donde $p$ es la probabilidad de éxito y $k$ es cuántos éxitos se necesitan.

## E(X)
El valor esperado es:
$$
np
$$

## VAR(X)
La varianza cuando son independientes es:
$$
np(1-p)
$$


# Distribución Geométrica
Se tiene una cantidad ilimitada de de intentos o experimentos y se busca el primer éxito.

La función de masa de probabilidad es:
$$
P([X=x])\begin{cases}
(1-p)^{x-1}p&,\ x=1,2,3,\dots\\
0 &,\ cualquier\ otro\ momento
\end{cases}
$$

## E(X)
$$
\frac1p
$$

## VAR(X)
$$
\frac{q}{p^2}
$$

# Distribución Binomial Negativa
Le interesa la cantidad de fallos antes de obtener $r$ éxitos.

$$
P([X=x])=\begin{cases}
\begin{pmatrix}
r+x-1\\x 
\end{pmatrix}
p^r(1-p)^x &,x=0,1,2,3\dots\\
0 &,cualquier\ otro\ caso
\end{cases}
$$

## E(X)
$$
\frac{r(1-p)}{p}
$$

## VAR(X)
$$
\frac{r(1-p)}{p^2}
$$

# Distribución de Poisson
Si se tiene una distribución discreta distribuida dentro de una región o intervalo se utiliza esta distribución.

La función de masa de probabilidad es:
$$
P([X_t=x])=\frac{(\lambda t)^x e^{-\lambda t}}{x!}
$$

## E(X) y VAR(X)
$$
\lambda t
$$


## Ejemplos
Un examen de Kahoot consta de 10 preguntas a las que hay que contestar una respuesta correcta de 4 opciones por cada pregunta. Suponiendo que la persona se le aplica el examen y no sabe contestar ninguna pregunta. Por lo tanto, contesta al azar.

a) La probabilidad de tener 5 respuestas correctas.

Se utiliza la misma fórmula de arriba.

b) La probabilidad de obtener alguna respuesta correcta.

c) la probabilidad de tener al menos 5 respuestas correctas.

---

Un servidor web recibe un número de peticiones por segundo que sigue una distribución de Poisson con parámetro 0.2.

a) La probabilidad que reciba dos peticiones en un segundo.

b) La probabilidad que se reciba un máximo de 3 peticiones en un segundo.

c) La probabilidad de que el servidor colapse si no puede atender más de 4 peticiones por segundo.

d) la probabilidad de que se reciba 20 peticiones en un minuto.
