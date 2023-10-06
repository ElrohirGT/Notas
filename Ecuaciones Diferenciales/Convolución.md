# Convolución
Es una operación conmutativa y se define como:
$$
f(t)\ast g(t) = \int_0^t f(\tau)g(t-\tau)d\tau
$$

Devuelve qué tanto se parece una función a la otra.

Se utiliza junto con las [[Transformadas de Laplace]]:
$$
L\{f(t)\ast g(t)\}=L\{f\}\cdot L\{g\}=F(s)\cdot G(s)
$$

Para simplificar la forma en la que se realizan transformadas. Ya que las integrales que tienen esa forma de arriba se pueden transformar a simplemente $F(s)\cdot G(s)$.

Usando este mismo principio se puede obtener la transormada de una integral, pues $g(t-\tau) =1$.
$$
L\left\{\int_0^t f(\tau)d\tau\right\}=\frac{L\{f(t)\}}{s}
$$

## Ejemplos
Resolver ecuación integral:
$$
f(t)=3t^2-e^{-t}-\int_0^t f(\tau)e^{t-\tau}d\tau
$$

Podemos aplicar la transformada para eliminar el integral:
$$
L\{f(t)\}=\frac{6}{s^3}-\frac{1}{s+1}-L\{f(t)\ast e^t\}
$$
$$
L\{f(t)\}=\frac{6}{s^3}-\frac{1}{s+1}-L\{f(t)\}\cdot \frac{1}{s-1}
$$
$$
L\{f(t)\}=\frac{\frac{6}{s^3}-\frac{1}{s+1}}{1+\frac{1}{s-1}}=\frac{6s-6}{s^4}-\frac{s-1}{s(s+1)}
$$
$$
L\{f(t)\}=\frac{\frac{6}{s^3}-\frac{1}{s+1}}{1+\frac{1}{s-1}}=\frac{6s-6}{s^4}-\frac{s-1}{s(s+1)}
$$
$$
L\{f(t)\}=\frac{6}{s^3}-\frac{6}{s^4}-\frac{s-1}{s(s+1)}
$$

Teniendo esto, se usa fracciones parciales para el último término y tenemos:
$$
L\{f(t)\}=\frac{6}{s^3}-\frac{6}{s^4}+\frac{1}{s}-\frac{2}{s+1}
$$

Ahora se obtiene la inversa:
$$
f(t)=3t^2-t^3+1-2e^{-t}
$$

