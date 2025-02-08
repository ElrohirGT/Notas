# Ejemplos

## Población

$$ \\frac{dP}{dt} \\propto P\\ $$ $$ \\frac{dP}{dt} =kP\\ $$

Al principio hay un cultivo que tiene un número $P_0$ de bacterias. En $t=1h$ se
determina que el número de bacterias es $\\frac 32 P_0$. Si la rapidez de
crecimiento es proporcional al número de bacterias $P(t)$ presentes en el tiempo
$t$. Determine el tiempo necesario para que se triplique el número de bacterias.
$$ \\frac{dP}{dt}=kP(t) $$

Primero ponemos en su forma estándar: $$ \\frac{dP}{dt}-kP=0 $$

Por lo tanto el factor de integración sería: $$ e^{-\\int kdt}=e^{-kt} $$

Resolviendo: $$ e^{-kt}\\cdot P(t)= 0\\ \\int e^{-kt}\\cdot Pdt= \\int 0dt\\
e^{-kt}P=C\\ P(t)=Ce^{kt}\\ $$

Necesitamos encontrar el valor de $C$: $$ P(0)=P_0=Ce^{k\\cdot 0}\\ C=P_0 $$

Entonces la ecuación final es: $$ P(t)=P_0e^{kt} $$

Ahora encontrando valores para evaluar: $$ P(1)=\\frac 32P_0=P_0e^{k}\\ k=\\ln
\\frac 32 $$

Y ahora para encontrar el $t$ que piden: $$ P_f=P_0e^{kt}\\
t=\\frac{\\ln\\frac{P_f}{P_0}}{k}=\\frac{\\ln\\frac{P_f}{P_0}}{\\ln\\frac 32}\\
t\\ en\\ P_f=3P_0\\ t=\\frac{\\ln 3}{\\ln\\frac 32}\\approx 2.7095 h $$

______________________________________________________________________

## Ley de Newton de calentamiento/enfriamiento:

$$ \\frac{dT}{dt}=k(T-T_m) $$

Donde $k$ es una constante de proporcionalidad, $T(t)$ es la temperatura del
objeto para $t>0$ y $T_m$ es la temperatura ambiente, es decir, la temperatura
del medio que rodea al objeto.
