# Transformada de Laplace
Se define como:
$$
f(t) \rightarrow |?| \rightarrow F(s)
$$

Entonces:
$$
L\{f(t)\}=\int_0^\infty f(t)e^{-st}dt
$$

Al término $e^{-st}$ se le llama kernel o núcleo.

Se tienen varias definiciones de $L$ según la función:
$$
L\{1\}=\frac1s
$$

$$
L\{t^n\}=\frac{n!}{s^{n+1}}
$$

$$
L\{e^{at}\}=\frac{1}{s-a}
$$

$$
L\{\sin kt\}=\frac{k}{s^2+k^2}
$$

$$
L\{\cos kt\}=\frac{s}{s^2+k^2}
$$

## Propiedades
También se cumple para la inversa de Laplace:
$$
L\{\alpha f(t)+\beta g(t)\}=\alpha L\{f(t)\}+\beta L\{g(t)\}
$$

