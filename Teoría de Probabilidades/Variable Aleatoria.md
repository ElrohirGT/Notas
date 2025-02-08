# Variable Aleatoria

La variable aleatoria es una función.

La función acumulada se define como: $$ F_X(y) = \\int\_{-\\infty}^y f(t)dt $$

La función $f(t)$ arriba se define como la función de densidad.

La función masa de probabilidad nos da la probabilidad de cada uno de los
posibles valores de una variable aleatoria mientras que una función densidad es
para una continua.

Para obtener la función de densidad de $g(X)$ en donde $X$ es una variable
aleatoria se realiza: $$ h(y)= \\begin{cases} f(g^{-1}(y)) |
\\frac{dg^{-1}}{dy}|, & \\alpha \\lt y\\lt\\beta\\ 0 &,cualquier\\ otro\\ caso
\\end{cases} $$ $\\alpha=min{g(-\\infty), g(\\infty))}$ mientras que $\\beta$ es
el máximo entre esos dos valores.

El caso general para calcular $h(y)$ es: $$ h(y)= \\begin{cases} \\sum\_{k=1}^n
f(X_k(y))|g'(X\_{k}(y))|^{-1},&n\\lt 0\\ 0,&n=0 \\end{cases} $$

Esta segunda definición de $h(y)$ toma en cuenta cualquier forma de función
porque los puntos en donde $g'(x)=0$ se toman como límites de n.

## Ejemplos

$X_1$ es una variable aleatoria distribuida uniformemente en: $$
{1,2,3,4,5,6,7,8} $$

$X_2$ variable aleatoria distribuida uniformemente en el intervalo: (8,10).

Encuentre la distribuciónes acumuladas $F\_{X_1}$ y $F\_{X_2}$.

Para encontrar estas funciones es importante recalcar que la variable $X_1$ es
discreta mientras que $X_2$ es continua.

______________________________________________________________________

Se tiene la variable aleatoria: $$ X_3= \\begin{cases} X_1&\\ con\\
probabilidad\\ de\\ \\frac{1}{3}\\ X_2&\\ con\\ probabilidad\\ de\\
\\frac{2}{3}\\ \\end{cases} $$

Que utiliza las variables aleatorias del ejemplo anterior. Encuentre $F_X(y)$.

Para encontrar esta función acumulada se define como: $$ F_X(y)=\\frac13
F\_{X_1}(y)+\\frac23 F\_{X_2}(y) $$

Encuentre $P(\[x\\gt6\])$. $$
P(\[x\\gt6\])=1-P(\[x\\le6\])=1-F\_{X_3}(6)=\\frac34 $$

Si nos pidieran $P(\[x=4\])$, entonces tendríamos que calcularlo de forma: $$
P(\[x=4\])=P(\[x\\le4\])-P(x\\lt4) $$

______________________________________________________________________

Sea $X$ una variables aleatoria continua con función densidad $$ f(x)=
\\begin{cases} \\frac{x}{12}&,1\\lt x\\lt 5\\ 0&,cualquier\\ otro\\ caso
\\end{cases} $$

Encontrar la función de densidad de la variable alatoria $Y=2x-3$.

Resolviendo, vamos a ver si cumple las 3 condiciones descritas arriba.

- $g(x)=2x-3$
- $g'(x)=3, \\forall x\\in R$
- Y también $g'(x)\\lt 0$.

Por lo que obtenemos la inversa: $$ g^{-1}(x)=\\frac{y+3}{2} $$

y su derivada $$ \\frac{dg^{-1}}{dy}=\\frac12 $$

Ahora ya solo nos falta encontrar los límites $\\alpha$ y $\\beta$. Para
encontrar se evalúa $g(-\\infty)$ o $g(\\infty)$, en esta función $g$ esto nos
da resultados sin sentido pues es una línea recta. Entonces podemos: $$
1\\lt\\frac{y+3}{2}\\lt 5 $$

Lo que nos da: $$ -1\\lt y\\lt 7 $$

______________________________________________________________________

Sea $X$ una variable aleatoria con función de probabilidad: $$ f(x)=
\\begin{cases} \\frac{3x^2}{2},&-1\\lt x\\lt 1\\ 0,& cualquier\\ otro\\ caso
\\end{cases} $$

Encontrar la función densidad de probabilidad de la variable aleatoria $X^2$.

Tenemos entonces que $g(x)=x^2$ y $g'(x)=2x$. Esta función cumple todas las
propiedades mencionadas anteriormente. Debido a que $g(x)$ es una función que a
veces es decreciente y aveces es creciente se debe usar la forma general.

Para obtener los límites de $n$ en la forma general se utiliza el análisis de la
gráfica de $g(x)$ para determinar los puntos en donde $g'(x)=0$, lo cual nos da
los límites de $n$. En este caso $n$ cambia solamente cuando se llega a valores
de $y$ mayores a 0. $$ h(y)= \\begin{cases} f(X_1(y)) |g'(X_1(y))|^{-1} +
f(X_2(y))|g'(X_2(y))|^{-1}&,n=2\\ 0&,n=0 \\end{cases} $$

Calculando con la función de densidad dada: $$ h(y)= \\begin{cases}
\\frac32\\sqrt y&,0\\lt y\\lt 1\\ 0&,cualquier\\ otro\\ caso \\end{cases} $$

Los límites se obtienen resolviendo: $$ -1\\lt x\\lt1 $$

Reemplazando $x$ por $\\pm\\sqrt{y}$.
