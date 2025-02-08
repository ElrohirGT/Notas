# Variables Aleatorias Múltiples

La colección de: $$ X=(X_1, X_2, X_3) $$

Tiene un intervalo: $$
I=(-\\infty,a_1\]\\times(-\\infty,a_2\]\\times(-\\infty,a_3\] $$

Y su imagen inversa: $$ X^{-1}(I)\\in S $$

En este caso $X$ es una variable aleatoria de 3 dimensiones, pues su vector de
variables aleatorias tiene 3 componentes.

La función acumulada de una variable aleatoria de $n$ dimensiones se escribe: $$
F\_{X_1,X_2,...,X_n}(a_1,a_2,...,a_n)=P(\[X_1\\le a_1\]\\cap\[X_2\\le
a_2\]\\cap\\dots\\cap\[X_n\\le a_n\]) $$

## Propiedades

Algunas propiedades no tan intuitivas de las funciones acumuladas: $$
\\lim\_{X_1\\rightarrow\\infty}F\_{X_1,X_2}(x_1,x_2)=F\_{X_2}(x_2) $$ $$
\\lim\_{X_2\\rightarrow\\infty}F\_{X_1,X_2}(x_1,x_2)=F\_{X_1}(x_1) $$ $$
\\lim\_{X_2\\rightarrow\\infty}\\lim\_{X_1\\rightarrow\\infty}F\_{X_1,X_2}(x_1,x_2)=1
$$

Cuando una función acumulada es reducida de esta forma hasta que solamente se
tenga una sola distribución de una sola variable entonces se le llama función
acumulada marginal.

## Variables Aleatorias Discretas Conjuntas

Debe cumplir: $$ P((X_1,X_2)\\in A)=\\sum\_{i_1}\\sum\_{i_2}P\_{i_1,i_2}=1 $$

En donde $A$ es contable.

### Función de Probabilidad Discreta Conjunta

$$ P\_{i_1,i_2,i_3}=P(\[x_1=i_1\]\\cap\[x_2=i_2\]\\cap\[x_3=i_3\]) $$

### Función de Probabilidad Discreta Marginal

Se itera todas las otras variables aleatorias excepto una: $$
P\_{i_1}=\\sum\_{i_2}\\sum\_{i_3}P\_{i_1,i_2,i_3} $$

### Función de Probabilidad Discreta Condicional

Dado que $Y$ toma el valor de $i_2$ cuál es la probabilidad de que $X$ tome el
valor de $i_1$: $$
P\_{X|Y}(i_1,i_2)=\\frac{P(\[X=i_1\]\\cap\[Y=i_2\])}{P(\[Y=i_2\])} $$

### Función acumulada discreta condicional

$$ F\_{X|Y}(i_1,i_2)=\\frac{P(\[X\\le i_1\]\\cap\[Y=i_2\])}{P(\[Y=i_2\])} $$

## Variables Aleatorias Continuas Conjuntas

### Función de Densidad

Para poder ser función densidad:

- $f\_{X_1,X_2,X_3}:R^3\\rightarrow R$
- $f\\ge0$

$$ \\int\\int\\int f\_{X_1,X_2,X_3}(Y_1,Y_2,Y_3)dy_1dy_2dy_3=1 $$

Todas las integrales son de $-\\infty$ a $\\infty$.

### Función de Probabilidad Acumulada

$$
F\_{X_1,X_2,X_3}=\\int\_{-\\infty}^{y_1}\\int\_{-\\infty}^{y_2}\\int\_{-\\infty}^{y_3}f\_{X_1,X_2,X_3}(y_1,y_2,y_3)dy_3dy_2dy_1
$$

Para obtener la función de probabilidad de densidad acumulada marginal es
integra de $-\\infty$ a $\\infty$ en todas las otras variables aleatorias que no
se deseen.

### Función Distribución Condicional

$$ F\_{X|Y}(x|y)=\\frac{\\int\_{-\\infty}^x f\_{X,Y}(u,y)du}{f_Y(y)} $$

## Variables Aleatorias Independientes

Dos eventos (A,B) son independientes si: $$ P(A\\cap B)=P(A)P(B) $$

Dos variables (X,Y) son independientes solo si $\[X\\le x\]$ y $\[Y\\le y\]$ son
eventos independientes para todo $(x,y)\\in R^2$: $$ P(\[X\\le x\]\\cap\[Y\\le
y\])=P(\[X\\le x\])P(\[Y\\le y\]) $$

### Función Acumulada y Función Densidad

Si se sabe que las variables aleatorias son independientes entonces su función
acumulada y de densidad se puede separar: $$ f\_{X,Y}(x,y)=f_X(x)f_Y(y),
\\forall (x,y)\\in R^2 $$ $$ F\_{X,Y}(x,y)=F_X(x)F_Y(y), \\forall (x,y)\\in R^2
$$

Mientras que su función condicionada: $$ F\_{X|Y}(x|y)=F_X(x), \\forall x\\in R
$$

## Borel y Variables aleatorias independientes

Si las variables aleatorias $(X,Y)$ en sí son independientes, suponiendo que $f$
y $g$ son funciones de borel que cumplen las condiciones para ser variables
aleatorias entonces $f(X)$ y $g(Y)$ también son variables independientes.

$f$ y $g$ deben ser medibles

## Valor Esperado

El valor esperado solamente se puede calcular de una función $g:R^n\\rightarrow
R$.

Cuando las variables son discretas se realia una sumatoria de cada $g$ por su
probabilidad de cada punto en sí. Mientras que cuando son continuas se integra
$g(t_1)f\_{X_1,...}(t_1)$ por cada dimension.

### Función generadora de momentos

$$ E(e^{t_1X_1+t_2X_2}), |t_i|\\le h_i\\ para\\ i=1,2 $$

## Covarianza

$$ COV(X,Y)=E((X-E(X))(Y-E(Y))) $$

## Ejemplos

Se tiene una moneda y un dado de 3 caras: $$ X=(Moneda,\\ Dado) $$

En el caso de la moneda tenemos: $$ M=\\begin{cases} 1&,cara\\ 0&,cruz
\\end{cases} $$

Y el dado: $$ D=\\begin{cases} 1&,Cara\\ 1\\ 2&,Cara\\ 2\\ 3&,Cara\\ 3\\
\\end{cases} $$

Entonces el $\\Omega={(0,1), (0,2),(0,3),(1,1)...}$

Debido a que todos los resultados de $\\Omega$ tienen la misma probabilidad
entonces la función de probabilidad se escribe: $$
P(\[M=i_1\]\\cap\[D=i_2\])=\\frac16\\ para\\ i_1=0,1\\ y\\ i_2=1,2,3 $$

______________________________________________________________________

Se tienen 2 estudiantes que se quieren reunir entre 19:00 y 20:00, el tiempo de
llegada está distribuido uniformemente ¿Cuál es la función densidad?

Si el estudiante 1 es el eje X y el estudiante 2 es el eje Y se puede realizar
la siguiente integral: $$ \\int_0^{60}\\int_0^{60} C dxdy=1 $$ $$ C(60)^2=1 $$
$$ C=\\frac{1}{60^2} $$

Entonces la función densidad será: $$ f\_{X,Y}(x,y)=\\begin{cases}
\\frac{1}{60^2} &,0\\le x\\le 60\\ 0 &,0\\le y\\le 60\\ \\end{cases} $$

Estas variables son $X$, $Y$ son independientes ya que: $$
f\_{X,Y}(x,y)=f_X(x)f_Y(y), \\forall (x,y)\\in R^2 $$

Se tienen 4 rangos en este caso: $$ 0\\le x\\le 60\\ y\\ 0\\le y\\le 60 $$ $$
(cualquier\\ otro\\ caso)\\ y\\ 0\\le y\\le 60 $$ $$ 0\\le x\\le 60\\ y\\
(cualquier\\ otro\\ caso) $$ $$ (cualquier\\ otro\\ caso)\\ y\\ (cualquier\\
otro\\ caso) $$

______________________________________________________________________

Si nos dan N variables aleatorias igualmente distribuidas. Al estar igualmente
distribuidas se tiene una media para todas: $$ E(X_i)=\\mu,\\ para\\ i=1,2,3...N
$$

Entonces la media de todas las variables aleatorias conjuntas es también $\\mu$.
