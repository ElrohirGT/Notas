# Valor Esperado

Sea $X$ una variable aleatoria discreta:
* La sumatoria inferior debe converger en un valor que no sea $\pm\infty$.
$$
\sum_{n=1}^\infty x_iP_i
$$

Sea $X$ una variable aleatoria continua:
* $f$ función densidad.
* La integral inferior debe converger en un valor que no sea $\pm\infty$.
$$
E(x)=\int_{-\infty}^\infty tf(t)dt
$$

El valor esperado de una función característica es la probabilidad del evento.

El valor esperado de una constante es la misma constante, pues no tiene variabilidad. Lo que permite hacer:
$$
E(aX)=aE(X)
$$
$$
E(aX+b)=aE(X)+b
$$

Si se tiene una función $g$ Borel-medible sobre $R$ y $X$ es una variable aleatoria discreta entonces:
$$
E[Y]=\sum_{i=1}^\infty g(x_j)P([X=x_j])
$$

Para variables continuas entonces:
$$
E[Y]=\int_{-\infty}^\infty g(x_j)f(x)dx
$$

## Varianza
Para calcular la varianza de variables aleatorias discretas se utiliza $\mu_X = E(X)$:
$$
VAR[X]=\sum_{k=1}^\infty (x_k-\mu_X)^2P_k
$$

Si la variable aleatoria es continua:
$$
VAR[X]=\int_{-\infty}^\infty (x-\mu_X)^2f_X(x)dx
$$

Si $E[X^2]$ existe entonces:
$$
VAR[X]=E[X^2]-(E[X])^2
$$

$VAR[aX+b]=a^2VAR[X]$ solamente si $E[X^2]$ existe y $a$ y $b$ son constantes.

## Desviación Estándar
$$
\sigma_X=+\sqrt{VAR[X]}
$$

## Variable Degenerada
Las variables degeneradas son una variable aleatoria que solamente definen un punto, por lo tanto su varianza es 0.

Una variable es degenerada en el punto $k$ si:
$$
P([X=x])=
\begin{cases}
1 &,x=k\\
0 &,cualquier\ otro\ caso
\end{cases}
$$

## Variable Estandarizada
Una variable aleatoria $Z$ es estandarizada si $E[Z]=0$ y $VAR[Z]=1$. Para estandarizar una variable $X$ se necesita que $[X] \lt\infty$ y $0<VAR[X]\lt\infty$.
$$
Z=\frac{X-E[X]}{\sqrt{VAR[X]}}
$$

## Momentos
El momento $r$ de una variable aleatoria $X$ se calcula como:
$$
m_r=E[X^r]\lt\infty
$$

## Cuantil
Un cuantil es un número $x$ denotado por $\epsilon_x(X)$ y de orden $p$ si cumple:
$$
P([X\le x])\ge p
$$
$$
P([X\ge x])\ge 1-p
$$

Además: $0\lt p\lt 1$.

## Ejemplos
Se tiene la venta de un collar:

|Probabilidad de vender el collar|0.22|0.36|0.28|0.14|
|---|---|---|---|---|
|Ganancia al vender el collar|2.5|150|0|-150|

La utilidad esperada se calcula:
$$
\sum_{n=1}^\infty x_iP_i = 88
$$

---
Días en que da frutos un huerto. Tiempo mínimo es de 35 días, máximo es de 50 días.
$$
f_D(t)=
\begin{cases}
\frac{2}{1365}\cdot(3+t) & ,35\lt t\lt 50\\
0 & ,cualquier\ otro\ caso
\end{cases}
$$

¿$E(D)$?

Primero revisamos si la integral converge (nota el valor absoluto):
$$
E(D)=\int_{-\infty}^\infty |t|f(t)dt \lt \infty
$$
$$
E(D)=\int_{35}^{50} |t|f(t)dt \lt \infty
$$

Como esa integral si es definida se puede continuar a calcular el $E(D)$ real:
$$
E(D)=\int_{35}^{50} tf(t)dt = \frac{3905}{91}
$$

---
Dado una variable aleatoria con función de masa de probabilidad:
|X|P|
|---|---|
|-2|$\frac14$|
|0|$\frac14$|
|1|$\frac13$|
|2|$\frac16$|

Calcule la mediana de X.

Se usa la función de probabilidad acumulada de $X$ para obtener el intervalo de abajo.
$$
P([X\le x])\ge 0.5 \rightarrow x\in[0,\infty]
$$

Se acumula las probabilidades $P$ descritas anteriormente pero de izquierda a derecha (en la tabla sería de abajo hacia arriba).
$$
P([X\ge x])\ge 1-0.5=0.5\rightarrow x\in[-\infty, 1]
$$

Por lo que la mediana es: $[0,1]$.

Si $p=0.2$ entonces se tiene:

$$
P([X\le x])\ge 0.2\rightarrow x\in[-2,\infty]
$$
$$
P([X\ge x])\ge 0.8\rightarrow x\in [-\infty, -2]
$$

Por lo que el cuantil de orden 0.2 es $x=-2$.
