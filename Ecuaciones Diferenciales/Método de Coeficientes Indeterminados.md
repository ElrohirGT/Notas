# Método de Coeficientes Indeterminados

## Caso 1: términos de $y_p$ no se repiten en $y_c$

Es aplicable solamente en EDO Lineales: $$
a_ny^{(n)}+a\_{n-1}y^{(n-1)}+...+a_0y=g(x) $$

En donde $g(x)$ es un polinomio o una constante, aunque puede ser también
$e^{ax}$ y $\\sin ax$

1. Resolver ED Homogénea asociada -> $Y_c:\\ Complementaria$.
1. Suponer una solución $Y_p$: Según tabla 4.4.1 (p. 146). Se busca la ecuación
   general de la ecuación. !\[\[y_p según g(x).png\]\]
1. Sustituir $Y_p^{n}$,$Y_p^{n-1}$,$Y_p^{n-2}$... y $Y_p$ en ED. Encontrar
   coeficientes
1. $Y=Y_c+Y_p$

### Ejemplos

Resolver: $$ y''+4y'-2y=2x^2-3x+6 $$

Primero encontramos y resolvemos la ecuación homogénea asociada: $$ y''+4y'-2y=0
$$ $$ m^2+4m-2=0 $$

dando: $$ m_1=-2+\\sqrt6;\\ m_2=-2-\\sqrt6 $$

por lo tanto $$ y_c=C_1e^{(-2+\\sqrt6)x}+C_1e^{(-2-\\sqrt6)x} $$

Ahora definimos $Y_p$, en este caso como siguiendo la tabla es: $$ y_p=Ax^2+Bx+C
$$

Derivamos para encontrar $y'\_p$: $$ y'\_p=2Ax+B $$

Y también tenemos que encontrar $y''\_p$: $$ y''\_p=2A $$

Ahora sustituimos en la ecuación original: $$ 2A+4(2Ax+B)-2(Ax^2+Bx+C) $$ $$
2A+8Ax+4B-2Ax^2+2Bx+2C $$ $$ -2Ax^2+2Bx+8Ax+4B+2A+2C $$

Esta ecuación debería de ser igual a $g(x)$, por lo que nos queda un sistema de
ecuaciones: $$ 2x^2=-2Ax^2\\therefore A=-1 $$ $$ -3x=2Bx+8Ax\\therefore
B=-\\frac52 $$ $$ 6=4B+2A+2C\\therefore C=-9 $$

Por lo tanto $Y_p$ es: $$ y_p=-x^2-\\frac52x-9 $$

Por lo que y es: $$
y=y_c+y_p=C_1e^{(-2+\\sqrt6)x}+C_1e^{(-2-\\sqrt6)x}-x^2-\\frac52x-9 $$

## Caso 2: Algunos términos de $Y_p$ se repiten en $Y_c$

Se realizan los mismos pasos para el Caso 1 con la excepción de que si hay
términos repetidos entonces se multiplpica $y_p$ por $x^{k+1}$ en donde $k$ es
la potencia máxima de las x's. Despues de esto ya se puede encontrar los
coeficientes y continuar con el algoritmo de solución.

**IMPORTANTE**: Si al multiplicar $y_p$ por el $x^{k+1}$ se encuentra que se
repite el término, entonces se debe continuar con el siguiente valor de $k$
dentro de la serie.

### Ejemplos

Resolver: $$ y''-5y'+4y=8e^x $$

Primero obtenemos la ecuación equivalente: $$ m^2-5m+4=0 $$

Resolviendo entonces: $$ m_1=4;\\ m_2=1 $$

Por lo que: $$ y_c=C_1 e^{4x}+C_2 e^x $$

Ahora necesitamos encontrar $Y_p$: $$ Y_p=Ae^x $$

Como podemos ver, se repiten términos, pues: $$ Ae^x==C_2e^x $$

Entonces debemos multiplicar $y_p$ por $x^{k+1}$. En este caso el polinomio
$g(x)$ es de la forma: $$ 8x^0e^x+0xe^x+0x^2e^x+0x^3e^x... $$

Por lo que el $k$ máximo encontrado es 0. Entonces se debe multiplicar por $x$.
Entonces: $$ y_p=Axe^x $$ $$ y_p'=Axe^x+Ae^x $$ $$ y_p''=Axe^x+2Ae^x $$

Ahora se puede continuar con el método del caso 1. Resultando en: $$
y_p=-\\frac83e^x $$

Por lo que: $$ y=C_1e^{4x}+C_2e^x-\\frac83xe^x $$

______________________________________________________________________

Resolver $$ y''-2y'-3y=4x-5+6xe^{2x} $$

Primero obtenemos la ecuación característica: $$ m^2-2m-3=0 $$

Por lo que: $$ m_1=-1;\\ m_2=3 $$

Entonces: $$ y_c=C_1e^{-x}+C_2e^{3x} $$

La solución propuesta sería: $$ y_p=Ax+B+Cxe^{2x}+De^{2x} $$

ahora tenemos que derivar: $$ y_p'=A+2Cxe^{2x}+Ce^{2x}+2De^{2x} $$ $$
y_p''=4Cxe^{2x}+4Ce^{2x}+4De^{2x} $$

Por lo que ahora se reemplaza: $$
4Cxe^{2x}+4Ce^{2x}+4De^{2x}-2(A+2Cxe^{2x}+Ce^{2x}+2De^{2x})-3(Ax+B+Cxe^{2x}+De^{2x})
$$

Por lo que agrupando: $$ xe^{2x}(4C-4C-3C)=-3Cxe^{2x} $$ $$
e^{2x}(4C+4D-2C-4D-3D)=(2C-3D)e^{2x} $$ $$ -3Ax $$ $$ -2A-3B $$

Resolviendo: $$ A=-\\frac43;\\ B=\\frac{23}{9};\\ C=-2;\\ D=-\\frac43 $$

Entonces reemplazando en $y_p$: $$
y_p=-\\frac43x+\\frac{23}{9}-2xe^{2x}-\\frac43e^{2x} $$

Finalmente: $$
y=C_1e^{-x}+C_2e^{3x}-\\frac43x+\\frac{23}{9}-2xe^{2x}-\\frac43e^{2x} $$
