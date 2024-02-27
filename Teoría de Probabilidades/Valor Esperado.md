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

## Desviación Estándar
$$
\sigma_X=+\sqrt{VAR[X]}
$$

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
