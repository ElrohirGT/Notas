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

## Desigualdad de Markov y Chebychev-Bienayme
Si se tiene una función $h(X)$ no negativa borel medible de una variable aleatoria $X$. Si $E[h(X)]$ existe entonces para cualquier $\epsilon>0$.
$$
P([h(X)\ge\epsilon])\le\frac{E[h(X)]}{\epsilon}
$$

La desigualdad de Markov se obtiene reemplazando $h(X)=|X|^r$ y $\epsilon=K^r$. En donde $K\gt 0$ y $r \gt 0$.

La desigualdad de Chebychev-Bienayme se obtiene reemplazando $h(X)=(X-\mu)^2$ y $\epsilon=K^2\sigma^2$. Lo que nos da:
$$
P([|x-\mu|\ge k\sigma]) \le \frac{1}{K^2}
$$
En donde $E[X]=\mu$ y $VAR[X]=\sigma^2$.

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
Saber que es un momento, pero sirve para calcular varias cosas :v y se define de la siguiente manera...

El momento $r$ de una variable aleatoria $X$ se calcula como:
$$
m_r=E[X^r]\lt\infty
$$

## Función generadora de Momentos
La función generadora de momentos $M_X(s)$ de una variable aleatoria $X$ se define como:
$$
M_X(s)=E(e^{sX})
$$

Si dos variables aleatorias ($X$ y $Y$)tienen funciones generadoras de momentos que existen y son iguales en todo $s$ dentro de $-h\lt0\lt h$. Entonces se dice que sus funciones de distribución acumluada son iguales.

Si $F_X = F_Y$ y $M_X(s)$ existe entonces $M_Y(s)$ existe y es igual a $M_X(s)$ en algún intervalo $-h\lt0\lt h$.

Esta función se utiliza para calcular momentos, para calcular el momento 1 se realiza lo siguiente:
$$
E(X)=\frac{d}{ds}M_X(s)|_{s=0}
$$

Para calcular el momento 2 se realiza:
$$
E(X^2)=\frac{d^2}{ds^2}M_X(s)|_{s=0}
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

gg

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

---
$\mu=10$ y $\sigma^2=4$

Calcular la probabilidad de $P[|X-10|\ge 3]$. Así que:
$$
P[|x-10|\ge 3]=\frac{1}{(\frac32)^2}=\frac 49
$$

Calcular la probabilidad de $P[|X-10|\lt 3]$. Así que:
$$
P[|X-10|\lt 3]=1-P[|X-10|\ge 3]
$$

Lo que da:
$$
P[|X-10|\lt 3] \ge \frac59
$$

Calcular la probabilidad de $P[5\lt x\lt 15]$. Así que:
$$
P[5-10\lt x-10\lt 15-10]=P[-5\lt x\lt 5]=P[|x-10|\lt 5]
$$

Ahora para calcular esta probabilidad se obtiene el complemento:
$$
P[|x-10|\lt 5] = 1-\frac{1}{(\frac{5}{2})^2}=\frac{21}{25}
$$

Encuentre el valor de $c$ tal que $P[|x-10|\ge c]\le 0.04$. Despejamos para
$$
\frac{1}{k^2}=0.04
$$

Con lo que después podemos obtener que $c=k\sigma=5\cdot2=10$.
