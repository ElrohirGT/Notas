# Variable Aleatoria
La variable aleatoria es una función.

La función acumulada se define como:
$$
F_X(y) = \int_{-\infty}^y f(t)dt
$$

La función $f(t)$ arriba se define como la función de densidad.

La función masa de probabilidad nos da la probabilidad de cada uno de los posibles valores de una variable aleatoria mientras que una función densidad es para una continua.

## Ejemplos
$X_1$ es una variable aleatoria distribuida uniformemente en:
$$
\{1,2,3,4,5,6,7,8\}
$$

$X_2$ variable aleatoria distribuida uniformemente en el intervalo: (8,10).

Encuentre la distribuciónes acumuladas $F_{X_1}$ y $F_{X_2}$.

Para encontrar estas funciones es importante recalcar que la variable $X_1$ es discreta mientras que $X_2$ es continua.

---

Se tiene la variable aleatoria:
$$
X_3=
\begin{cases}
X_1&\ con\ probabilidad\ de\ \frac{1}{3}\\
X_2&\ con\ probabilidad\ de\ \frac{2}{3}\\
\end{cases}
$$

Que utiliza las variables aleatorias del ejemplo anterior. Encuentre $F_X(y)$.

Para encontrar esta función acumulada se define como:
$$
F_X(y)=\frac13 F_{X_1}(y)+\frac23 F_{X_2}(y)
$$

Encuentre $P([x\gt6])$.
$$
P([x\gt6])=1-P([x\le6])=1-F_{X_3}(6)=\frac34
$$

Si nos pidieran $P([x=4])$, entonces tendríamos que calcularlo de forma:
$$
P([x=4])=P([x\le4])-P(x\lt4)
$$
