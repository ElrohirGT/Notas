# Ejercicio 1
Sea $X$ una variable aleatoria y sea $M_X(s)=e^{5(e^s-1)}$ con $- \infty \lt s\lt\infty$

a) Encuentre $E(X)$
$$
\frac{d}{ds}M_X(s)|_{s=0}=\\
5e^se^{5(e^s-1)}|_{s=0}\\
E(X)=5
$$

b) Encuentre $VAR(X)$
$$
\frac{d}{ds}(5e^s)(5s)(e^{-5})(e^{5e^s})|_{s=0}\\
5e^se^{5(e^s-1)}+25e^{2s}e^{5(e^s-1)}\\
E(X^2)=25e^{-5}(e^{5})=30\\
\therefore VAR(X)=E(X^2)-E(X)^2= 5
$$

c) Determine la cota inferior diferente de 0 para $P([|x-5|\lt \frac52])$

Primero obtenemos el complemento, para poder usar la desigualdad de Chebychev-Bienayme:
$$
1-P([|x-5|\lt \frac52])=P([|x-5|\ge \frac52])
$$

Al que sí le podemos obtene su cota utilizando...
$$
P([|x-\mu|\ge k\sigma]) \le \frac{1}{K^2}\\
$$

Entonces se tiene:
$$
\mu=5\\
\sigma=5\\
k=\frac12
$$

Por lo tanto la cota inferior es:
$$
1-\frac{1}{\frac12^2}=-3
$$

Entonces:
$$
-3\le P([|x-5|\lt\frac52])
$$

d) Determine la distribución de la variable aleatoria X y explique por qué:

Diría que es una distribución exponencial puesto que tanto su varianza como su media son iguales entre sí además de que la variable aleatoria es continua puesto que su función generadora de momentos es continua también.

# Ejercicio 2
Sea $X$ una variable aleatoria con función de densidad de probabilidad:
$$
f_X(t)=\begin{cases}
t &,0\le t\le 1\\
t-1 &,1\lt t\lt 2\\
0 &,en\ cualquier\ otro\ caso
\end{cases}
$$

y $g(x)=x^3-1$.

a) Determine $E(g(X))$
$$
\int_{-\infty}^\infty g(x)f_X(x)dx
$$

Entonces:
$$
E(Y)=\begin{cases}
\int x^4-xdx &,0\le t\le 1\\
\int(x^3-1)(x-1)dx &,1\lt t\lt 2\\
0 &,cualquier\ otro
\end{cases}
$$

$$
E(Y)=\begin{cases}
\frac{x^5}{5}-\frac{x^2}{2} &,0\le t\le 1\\
\int x^4-x^3-x+1dx &,1\lt t\lt 2\\
0 &,cualquier\ otro
\end{cases}
$$

$$
E(Y)=\begin{cases}
\frac{x^5}{5}-\frac{x^2}{2} &,0\le t\le 1\\
\frac{x^5}{5}-\frac{x^4}{4}-\frac{x^2}{2}+x&,1\lt t\lt 2\\
0 &,cualquier\ otro
\end{cases}
$$

b) Determine la función densidad de probabilidad de $g(X)$
$$
h(y)=
\begin{cases}
f(g^{-1}(y)) | \frac{dg^{-1}}{dy}|, & \alpha \lt y\lt\beta\\
0 &,cualquier\ otro\ caso
\end{cases}
$$
$\alpha=min\{g(-\infty), g(\infty))\}$ mientras que $\beta$ es el máximo entre esos dos valores.

Entonces primero se deriva $g(X)$:
$$
g'(x)=3x^2
$$

Y su inversa:
$$
g'^{-1}(x)=\sqrt{\frac{x}{3}}
$$

Y se encuentra sus puntos críticos:
$$
g'(x)=0\therefore x=0
$$

En este caso $n$ solo cambia la cuando $y=0$. Por lo que:
$$

$$
