# E.D.O. Lineal

Tienen la forma de:

$$
a_n(x)=\frac{d^ny}{dx}+a\_{n-1}(x)\frac{d^{n-1}}{dx}+...+a_1(x)\frac{dy}{dx}+a_0(x)y=g(x)
$$

Algunos ejemplos de ecuaciones diferenciales lineales son:

$$
(y-x)dx + 4xdy = 0
$$

$$ x^3\frac{d^3y}{dx}+x\frac{dy}{dx}-5y=e^x $$

Algunos ejemplos de ecuaciones diferenciales no lineales son:

$$
(1-\textbf{y})y'+2y=e^x
$$

$$
\frac{d^2y}{dx}+\textbf{seny} \cdot \textbf{y}=0
$$

$$ \frac{d^4y}{dx}+\textbf{y}^2=0 $$

Lo que se encuentra en negrita es la razón por la que no es lineal.

Cuando una EDO lineal tiene una $g(x)=0$ se dice que es homogénea.

**Nota Importante:**

$$ \int 0dx=C $$

La integral de 0 es una constante.

**Término Transiente:** Es el término que es la solución de la homogénea.

## Solución Lineales de Primer Orden

$$ a_1(x)\frac{dy}{dx}+a_0(x)y=g(x) $$

1. Llevar a la forma estándar dividiendo por $a_1$.

$$
\frac{dy}{dx}+P(x)y=f(x)
$$

2. Calcular el factor integrante: $e^{\int P(x)dx}$
1. Multiplicar el factor integrante por la ecuación diferencial.

$$
   e^{\int
   P(x)dx} [E.D\ en\ forma\ estándar] => \frac{d}{dx}[e^{\int
   P(x)dx}\cdot y]
$$

4. Integrar.

### Ejemplos

Resolver:

$$ x\frac{dy}{dx}-4y=x^6e^x $$

entonces se escribe en forma estándar:

$$
\frac{dy}{dx}-4\frac{y}{x}=x^5e^x\
$$

Se calcula el factor integrante:

$$ P(x)=-\frac{4}{x} $$

$$ \int P(x)dx=-4\ln x $$

$$ e^{-4\ln x} $$

$$ e^{\ln x^{-4}} = x^{-4} $$

ahora se integra:

$$ \int\frac{d}{dx}[ x^{-4}\cdot y ] = \int x^{-4}\cdot x^5e^x dx $$

$$ x^{-4}\cdot y=\int xe^x dx $$

$$ x^{-4}\cdot y=xe^x-e^x+C $$

$$ y=x^5e^x-x^4e^x+x^4C $$

$$ I:\ (0,\infty) $$

______________________________________________________________________

Resolver:

$$ (x^2-9)\frac{dy}{dx}+xy=0 $$

escribiendo en forma estándar:

$$ \frac{dy}{dx}+\frac{x}{x^2-9}y=0 $$

calculando el factor integrante:

$$ P(x)=\frac{x}{x^2-9}\ \int P(x)dx=\frac12\ln |x^2-9|\ e^{\frac 12\ln |x^2-9|} = \sqrt{x^2-9} $$

ahora se integra:

$$ \sqrt{x^2-9}\cdot y=\int 0dx =C\ \rightarrow y=\frac{C}{\sqrt{x^2-9}}\ I: (-\infty, -3)\cup(3, \infty) $$
