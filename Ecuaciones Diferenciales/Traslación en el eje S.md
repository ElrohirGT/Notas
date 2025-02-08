# Traslación en el eje s

$$ L{e^{at}f(t)}=L{f(t)}|\_{s\\rightarrow s-a}=F(s-a) $$

En palabras, si se multiplica una función de t por $e^{at}$ entonces al
aplicarle la transformada se corre en $a$.

## Ejemplos

Resuelve: $$ L{e^{5t}t} $$

Ya que: $$ L{t}=\\frac{1}{s^2} $$

Por lo tanto: $$ L{e^{5t}t}=\\frac{1}{(s-5)^2} $$

______________________________________________________________________

Resuelve: $$ L{e^{-2t}\\cos 4t} $$

Ya que: $$ L{\\cos 4t} = \\frac{s}{s^2+k^2}=\\frac{s}{s^2+16} $$

Por lo tanto: $$ L{e^{-2t}\\cos 4t}=\\frac{s+2}{(s+2)^2+16} $$

______________________________________________________________________

Resuelve: $$ L^{-1}\\left{\\frac{2s+5}{(s-3)^2}\\right} $$

Se necesita aplicar la regla de lineales repetidos de las fracciones parciales.
$$ \\frac{2s+5}{(s-3)^2}=\\frac{A}{s-3}+\\frac{B}{(s-3)^2} $$

Resolviendo nos queda que: $$ \\frac{2}{s-3}+\\frac{11}{(s-3)^2} $$

Por lo que realmente reescribiendo tenemos: $$ 2L^{-1}{\\frac1s}_{s\\rightarrow
s-3}+11L^{-1}{\\frac{1}{s^2}}_{s\\rightarrow s-3} $$

Por lo que aplicando la transformada inversa tenemos: $$ F(t)=2e^{3t}+11e^{3t}t
$$

______________________________________________________________________

Resuelve: $$ y''-6y'+9y=t^2e^{3t} $$

Si: $$ y(0)=2;\\ y'(0)=17 $$

Primero transformamos: $$ s^2Y(s) - sf(0) -
f'(0)-6(sY(s)-f(0))+9Y(s)=\\frac{2!}{s^3}|\_{s\\rightarrow s-3} $$

Ahora tenemos que despejar para Y(s)

$$ Y(s)\\cdot(s^2-6s+9)-2s-17+12=\\frac{2!}{(s-3)^3} $$ $$
Y(s)=\\frac{2s+5}{(s-3)^2}+\\frac{2!}{(s-3)^5} $$

Ahora se debe aplicar la transformada inversa: $$
Y(s)=2e^{3t}+11te^{3t}+\\frac{2!}{4!}\\frac{4!}{s^5}|\_{s->\\rightarrow s-3} $$
$$ Y(s)=2e^{3t}+11te^{3t}+\\frac{2!}{4!}t^4e^{3t} $$ $$
Y(s)=2e^{3t}+11te^{3t}+\\frac{1}{12}t^4e^{3t} $$
