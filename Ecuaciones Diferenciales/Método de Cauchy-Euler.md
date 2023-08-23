# Método de Cauchy Euler
Tiene la forma de:
$$
ax^2\frac{d^2y}{dx^2}+bx\frac{dy}{dx}+cy=0
$$

1. Encontrar la ecuación característica:
$$
am^2+(b-a)m+c=0
$$

2. Encontrar las raíces. Según cada caso se da:
    * Si $m_1$ y $m_2$ son reales distintas:
    $$
    y_c=C_1x^{m_1}+C_2x^{m_2}
    $$
    * Si $m_1$ y $m_2$ son reales repetidas:
    $$
    y_c=C_1x^{m_1}+C_2x^{m_2}\ln x
    $$
    * Si $m_1$ y $m_2$ son complejas conjugadas ($m=\alpha\pm\beta i$):
    $$
    y_c=C_1x\cos(\beta\ln x)+C_2x\sin(\ln \beta\ln x)
    $$

## Ejemplos
Resolver
$$
x^2\frac{d^2y}{dx^2}-2x\frac{dy}{dx}-4y=0
$$

Primero encontramos la ecuación característica:
$$
m^2-(-2-1)m-4=0
$$

Resolvemos para m:
$$
m_1=4;\ m_2=-1
$$

Al ser reales y diferentes se tiene:
$$
y_c=C_1x^{4}+C_2x^{-1}
$$

Al ser homogénea, no tiene una respectiva $y_p$.
