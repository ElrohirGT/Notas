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

# Distribución Hipergeométrica
Si se tiene un total $N$ de elementos, de los cuáles solamente $K$ son éxitos. Cuál es la probabilidad de obtener $x$ éxitos en una muestra de $n$ elementos.
$$
P([X=x])=\frac{\begin{pmatrix}K\\x\end{pmatrix}\begin{pmatrix}N-K\\n-x\end{pmatrix}}{\begin{pmatrix}N\\n\end{pmatrix}}
$$

## E(X)

# Distribución Uniforme
Una variable aleatoria continua tiene una densidad uniforme si su función densidad es:
$$
f(x)=\begin{cases}
\frac{1}{b-a}&,x\in(a,b)\\
0&,cualquier\ otro\ caso
\end{cases}
$$

## E(X)
$$
\frac{(b+a)}{2}
$$

## VAR(X)
$$
\frac{(b-a)^2}{12}
$$

# Distribución Normal
Dada una variable aleatoria continua con función densidad de probabilidad:
$$
f(X)=\frac{e^{\frac{(x-\mu)^2}{2\sigma^2}}}{\sqrt{2\pi}\sigma}, -\infty\lt x\lt\infty
$$

## E(X)
Es la media de la distribución.
$$
\mu
$$

## VAR(X)
Es la varianza de la distribución (desviación estándar al cuadrado)
$$
\sigma^2
$$

# Distribución Exponencial
Para transformar de una distribución exponencial a una de Poisson se puede usar:
$$
\beta=\frac{1}{\lambda}
$$

$$
f(x)=\begin{cases}
\frac{1}{\beta} e^{-\frac{x}{\beta}} &, x\gt0\\
0 &,cualquier\ otro\ caso
\end{cases}
$$

## E(X)
$$
\beta
$$

## VAR(X)
$$
\beta^2
$$

## Función de probabilidad acumulada
Esta función es la que se utiliza para calcular su probabilidad dado un rango:
$$
F(X)=\begin{cases}
1-e^{-\frac{x}{\beta}} &,x\gt0\\
0 &,cualquier\ otro\ caso
\end{cases}
$$

# Distribución Gamma
$\alpha$ es la forma (el sesgo de la cola) y $\beta$ es la escala.

Para este curso va a utilizar
$$
\Gamma(n)=(n-1)!\ para\ n\in Z^+
$$

Pero realmente $\Gamma$ es:
$$
\Gamma(\alpha)=\int_{0}^{\infty} x^{\alpha -1}
$$

$$
f(x)=\begin{cases}
\frac{x^{\alpha-1}e^{-\frac{x}{\beta}}}{\beta^\alpha\Gamma(\alpha)} &, 0\lt x\lt \infty\\
0 &,cualquier\ otro\ caso
\end{cases}
$$

## E(X)
$$
\alpha\beta
$$

## VAR(X)
$$
\alpha\beta^2
$$

# Distribución Beta
Normalmente se utiliza para modelar cosas con porcentajes, es decir en valores entre 0 y 1.

$$
B(a,b)=\frac{\Gamma(a)\Gamma(b)}{\Gamma(a+b)}
$$

$$
f(x,a,b)=\begin{cases}
\frac{x^{a -1}(1-x)^{b-1}}{B(a,b)} &, 0\lt x\lt 1\\
0 &,cualquier\ otro\ caso
\end{cases}
$$

## E(X)
$$
\frac{a}{a+b}
$$

## VAR(X)
$$
\frac{ab}{(a+b+1)(a+b)^2}
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
