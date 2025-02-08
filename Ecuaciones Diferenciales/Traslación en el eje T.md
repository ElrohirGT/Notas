# Traslación en el eje T

$$ L^{-1}{e^{-as}F(s)} $$ $$ L^{-1}{F(s)}|\_{t\\rightarrow t-a} $$

Esto se debe a que en la transformada de Laplace solo toma en cuenta valores de
0 al $\\infty$. Por lo que si corremos la función hacia la derecha hay valores
de la $f(t)$ que no existen en el mundo de las s. Por lo tanto, se define que la
$f$ desplazada será 0 en esos valores hasta que llega al punto donde termina de
desplazarse. Por lo que se puede usar un escalón unitario para definirla.

$$ f(t-a)\\times U(t-a) $$

$$ L{f(t-a)U(t-a)} =e^{-as}F(s) $$

$$ L{U(t-a)}=\\frac{e^{-as}}{s} $$

## Ejemplos

Encuentre la transformada de: $$ 2-3U(t-2)+U(t-3) $$ $$ L{2-3U(t-2)+U(t-3)} $$
$$ \\frac2s-3\\frac{e^{-2s}}{s}+\\frac{e^{-3s}}{s} $$

______________________________________________________________________

$$ L^{-1}\\left{\\frac{1}{s-4}e^{-2s}\\right} $$ $$
L^{-1}\\left{\\frac{1}{s-4}\\right}|_{t\\rightarrow t-2} $$ $$
e^{4t}|_{t\\rightarrow t-2}=e^{4(t-2)}U(t-2) $$

______________________________________________________________________

$$ L{\\cos t U(t-\\pi)} $$

Debido a que $\\cos(t-\\pi)=-\\cos t$ podemos: $$ L{-\\cos(t-\\pi)U(t-\\pi)} $$

Lo cual pasa a: $$ -L{\\cos t}|\_{t\\rightarrow t-\\pi}=-e^{-\\pi
s}\\frac{s}{s^2+1} $$
