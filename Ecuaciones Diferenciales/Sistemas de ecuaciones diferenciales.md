# Sistemas de Ecuaciones Diferenciales

Son sistemas de ecuaciones en donde las incógnitas son las funciones
diferenciales.

## Sistemas no homogéneos

!\[\[Sistema Diferencial No Homogéneo.png\]\]

## Sistemas Homogéneos

!\[\[Sistema Diferencial Homogéneo.png\]\]

### Resolviendo Sistemas Homogéneos

!\[\[Definición de Ecuación Característica.png\]\] !\[\[Soluciones de un Sistema
Diferencial.png\]\]

1. Encontrar $\\lambda$ usando: $det(\\vec A - \\lambda \\vec I)=0$.
1. Por cada uno de los $\\lambda_i$ se encuentra un $\\vec k_i$.
1. Expresar la solución de la forma: $$ \\vec X=C_1\\vec k_1 e^{\\lambda_1
   t}+C_2\\vec k_2e^{\\lambda_2t}+\\dots+C_n\\vec{k_n}e^{\\lambda_n t} $$

## Ejemplos

## Escribir en forma matricial el siguiente sistema: $$ \\frac{dx}{dt}=3x+4y $$ $$ \\frac{dy}{dt}=5x-7y $$ Entonces: $$ \\frac{d}{dt}\\begin{bmatrix}x\\y\\end{bmatrix}=\\begin{bmatrix}3&4\\5&-7\\end{bmatrix}\\vec{X} $$

Compruebe que los vectores: $$ \\vec{x_1}=\\begin{bmatrix}1\\-1\\end{bmatrix}
e^{-2t} $$ $$ \\vec{x_2}=\\begin{bmatrix}3\\5\\end{bmatrix} e^{6t} $$ Son
vectores solución de la ecuación: $$
\\vec{x}'=\\begin{bmatrix}1&3\\5&3\\end{bmatrix}\\vec{x} $$ Para comprobar si es
solución, se deriva cada vector y se sustituye dentro de la ecuación.

______________________________________________________________________

Resolver: $$ \\frac{dx}{dt}=2x+3y $$ $$ \\frac{dy}{dt}=2x+y $$ Primero pasando a
forma matricial: $$ \\vec{X}'=\\vec{A}\\vec{X} $$ $$
\\vec{X}'=\\vec{A}\\vec{X}\\rightarrow\\begin{bmatrix}x'\\y'\\end{bmatrix}=\\begin{bmatrix}2&3\\2&1\\end{bmatrix}\\begin{bmatrix}x\\y\\end{bmatrix}
$$ Escribimos la ecuación característica: $$
det(\\vec{A}-\\lambda\\vec{I})=\\begin{bmatrix}2-\\lambda&3\\2&1-\\lambda\\end{bmatrix}=0
$$

Por lo que evaluando el determinante: $$ 2-3\\lambda+\\lambda^2-6=0 $$ $$
\\lambda^2-3\\lambda-4=0 $$ $$ (\\lambda-4)(\\lambda+1)=0 $$

Por lo que los eigenvalores que tenemos son: $$ \\lambda_1=4;\\ \\lambda_2=-1 $$
Ahora tenemos que encontrar el $\\vec{k_i}$ por cada $\\lambda_i$. $$ (\\vec
A-\\lambda_2)\\vec k_2=\\vec 0 $$ $$
\\begin{bmatrix}(2-4)k_1&3k_2\\2k_1&(1-4)k_2\\end{bmatrix}=\\vec 0 $$ $$
\\begin{bmatrix}-2k_1&3k_2\\2k_1&-3k_2\\end{bmatrix}=\\vec 0 $$ Este sistema
tiene infitas soluciones, por lo que despejando para una K: $$
-2k_1+3k_2=0\\therefore k_1=\\frac 32 k_2 $$ El libro pide recomienda tomar el
entero que haga que tanto $k_1$ como $k_2$ sean enteros: $$ \\vec
k_2=\\begin{bmatrix}3\\2\\end{bmatrix} $$ Por lo tanto la solución $\\vec X_2$:
$$ \\vec{X_2}=\\begin{bmatrix}3\\2\\end{bmatrix}e^{4t} $$ Ahora para
$\\lambda_1$: $$ 3k_1+3k_2=0 $$ $$ 2k_1+2k_2=0 $$ Por lo que despejando para
$k_1$: $$ k_1=-k_2 $$ Por lo que decidimos que: $$ k_1=1;\\ k_2=-1 $$

Entonces: $$ \\vec k_1=\\begin{bmatrix}1\\-1\\end{bmatrix} $$

Por lo que: $$ \\vec{X_1}=\\begin{bmatrix}1\\-1\\end{bmatrix}e^{-t} $$

Y la solución completa de todo el sistema es: $$ \\vec X=C_1\\vec X_1+C_2\\vec
X_2=C_1 $$$$ \\vec X=C_1
\\begin{bmatrix}1\\-1\\end{bmatrix}e^{-t}+C_2\\begin{bmatrix}3\\2\\end{bmatrix}e^{4t}=C_1
$$
