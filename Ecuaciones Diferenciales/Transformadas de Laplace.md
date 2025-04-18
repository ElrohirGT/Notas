# Transformada de Laplace

Se define como: $$ f(t) \\rightarrow |?| \\rightarrow F(s) $$

Entonces: $$ L{f(t)}=\\int_0^\\infty f(t)e^{-st}dt $$

Al término $e^{-st}$ se le llama kernel o núcleo.

Se tienen varias definiciones de $L$ según la función: $$ L{1}=\\frac1s $$

$$ L{t^n}=\\frac{n!}{s^{n+1}} $$

$$ L{e^{at}}=\\frac{1}{s-a} $$

$$ L{\\sin kt}=\\frac{k}{s^2+k^2} $$

$$ L{\\cos kt}=\\frac{s}{s^2+k^2} $$

La transformada se utiliza para convertir una función de la dimensión de los
reales a la de los complejos, en donde se pueden aplicar ciertos trucos para
resolver ecuaciones diferenciales. Algunos de estos son:

- \[\[Transformada de Derivadas\]\]: Cuando se quiere aplicar la transformada de
  una función derivada el resultado serán términos de $s$ multiplicados por la
  función y algunas de sus derivadas.
- \[\[Derivada de una Transformada\]\]: El aplicarle la transformada a
  $t^n\\cdot f(t)$ es igual transformar $f(t)$ y después derivar $n$ veces.
  Recordar que el resultado se debe multiplicar por $(-1)^n$.
- \[\[Traslación en el eje S\]\]: Si se multiplica la función de $f(t)$ por
  $e^{at}$, al aplicar la transformada la función resultante $f(s)$ es la misma
  que sin multiplicar solamente que corrida como si fuera $f(s-a)$.
- \[\[Traslación en el eje T\]\]: Si se multiplica la función de $f(s)$ por
  $e^{-at}$, se puede usar el mismo hack de la \[\[Traslación en el eje S\]\],
  sin embargo la función termina siendo $f(t-a)$ en su lugar.

## Propiedades

También se cumple para la inversa de Laplace: $$ L{\\alpha f(t)+\\beta
g(t)}=\\alpha L{f(t)}+\\beta L{g(t)} $$
