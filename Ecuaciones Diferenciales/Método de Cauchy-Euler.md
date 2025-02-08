# Método de Cauchy Euler

Tiene la forma de: $$ ax^2\\frac{d^2y}{dx^2}+bx\\frac{dy}{dx}+cy=0 $$

1. Encontrar la ecuación característica: $$ am^2+(b-a)m+c=0 $$

1. Encontrar las raíces. Según cada caso se da:

   - Si $m_1$ y $m_2$ son reales distintas: $$ y_c=C_1x^{m_1}+C_2x^{m_2} $$
   - Si $m_1$ y $m_2$ son reales repetidas: $$ y_c=C_1x^{m_1}+C_2x^{m_2}\\ln x
     $$
   - Si $m_1$ y $m_2$ son complejas conjugadas ($m=\\alpha\\pm\\beta i$): $$
     y_c=C_1x\\cos(\\beta\\ln x)+C_2x\\sin(\\ln \\beta\\ln x) $$

Cuando la ecuación no es homogénea entonces se utiliza:

1. Resolver ED homogénea asociada.
1. Construir ED en forma estándar y resolver por variación de parámetros.

## Ejemplos

Resolver $$ x^2\\frac{d^2y}{dx^2}-2x\\frac{dy}{dx}-4y=0 $$

Primero encontramos la ecuación característica: $$ m^2-(-2-1)m-4=0 $$

Resolvemos para m: $$ m_1=4;\\ m_2=-1 $$

Al ser reales y diferentes se tiene: $$ y_c=C_1x^{4}+C_2x^{-1} $$

Al ser homogénea, no tiene una respectiva $y_p$.

______________________________________________________________________

Resolver $$ x^2y''-3xy'+3y=2x^4e^x $$

Se resuelve la homogénea asociada dando: $$ m^2+(-3-1)m+3=0 $$

Por lo que: $$ m_1=1;\\ m_2=3 $$

Como son reales y distintas entonces: $$ y_c=C_1x+C_2x^3 $$

Ahora se coloca la ecuación en su forma estándar: $$
y''-\\frac{3}{x}y'+\\frac{3}{x^2}y=2x^2e^x $$

Esta se resuelve por variación de parámetros, para eso necesitamos los
bosquianos: $$ y_1=x;\\ y_1'=1 $$ $$ y_2=x^3;\\ y_2'=3x^2 $$

$$ W=2x^3;\\ W_1=-2x^5e^x;\\ W_2=2x^3e^x $$

Se obtienen los u's: $$ u_1'=-x^2e^x\\therefore u_1=-x^2e^x+2xe^x-2e^x $$ $$
u_2'=e^x\\therefore u_2=e^x $$

Por lo que la solución final es: $$
y=C_1x+C_2x^3+(-x^2e^x+2xe^x-2e^x)(x)+(e^x)(x^3) $$ $$
y=C_1x+C_2x^3+2x^2e^x-2xe^x $$
