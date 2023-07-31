# Método por Sustitución

## Homógeneas
Las ecuaciones diferenciales homógeneas tienen la siguiente forma:
$$
M(x,y)dx+N(x,y)dy=0
$$
Es homógenea si cumple:

$M(tx,ty)=t^\alpha M(x,y)$ & $N(tx,ty)=t^\alpha N(x,y)$

Entonces se sugiere sustituir:
$$
u=\frac yx\ ó\ v=\frac xy
$$

Resolver la ecuación diferencial separable.

## Bernoulli
Las ecuaciones de Bernoulli son:
$$
\frac{dy}{dx}+P(x)y=f(x)y^n
$$
Para estas se sustituye $u=y^{1-n}$. Se resuelve linealmente.

## Ejemplos
Resolver:
$$
(x^2+y^2)dx+(x^2-xy)dy=0\\
$$

Primero se realizan los chequeos:
$$
M(tx,ty)=(tx)^2+(ty)^2=t^2(x^2+y^2)
$$
$$
N(tx,ty)=(tx)^2-(tx)(ty)=t^2(x^2-xy)
$$

Como se puede resolver por sustitución, comenzamos:
$$
u=\frac yx
$$
$$
y=ux
$$
$$
dy=udx+xdu
$$
$$
(x^2+(ux)^2)dx+(x^2-x(ux))(udx+xdu)=0
$$
$$
(x^2+x^2u^2)dx+(x^2-x^2u)(udx+xdu)=0
$$
$$
(x^2+x^2u^2)dx+(ux^2-u^2x^2)dx+(x^3-x^3u)du=0
$$
$$
x^2dx+x^2u^2dx+ux^2dx-u^2x^2dx+x^3du-x^3udu=0
$$
$$
x^2dx+ux^2dx+x^3du-x^3udu=0
$$
$$
x^2(1+u)dx+x^3(1-u)du=0
$$
$$
x^{-1}dx+\frac{1-u}{1+u}du=0
$$

Se utiliza división de polinomios para llegar a:
$$
x^{-1}dx+\left(-1+\frac{2}{u+1}\right)du=0
$$

Ahora que ya se tienen separadas se puede comenzar a integrar con el método de separación.
$$
\int x^{-1}dx+\int\left(-1+\frac{2}{u+1}\right)du=\int0dx
$$
$$
\ln x-u+2\ln |u+1|=C
$$
$$
\ln x-\frac yx+2\ln |\frac yx+1|=C
$$

---
Resolver:
$$
x\frac{dy}{dx}+y=x^2y^2
$$

La pasamos a su forma estándar:
$$
\frac{dy}{dx}+\frac yx=xy^2
$$

Por lo que la sustitución sería:
$$
u=y^{1-n}=y^{1-2}=y^{-1}\\
y=u^{-1}
$$

Además:
$$
\frac{dy}{dx}=\frac{dy}{du}\cdot\frac{du}{dx}=\frac{d(u^{-1})}{du}\cdot\frac{du}{dx}=-u^{-2}\frac{du}{dx}
$$

Por lo que sustituyendo:
$$
-u^{-2}\frac{du}{dx}-\frac{u^{-1}}{x}=x(u^{-1})^2\\
-u^{-2}\frac{du}{dx}-\frac{u^{-1}}{x}=xu^{-2}\\
$$

Ahora esta ecuación es lineal, por lo que la llevamos a su forma estándar:
$$
\frac{du}{dx}-\frac{u}{x}=x
$$

Por lo que el factor integrante es:
$$
e^{\int P(x)dx}=e^{-\int \frac 1xdx}=x^{-1}
$$

Multiplicando por el factor integrante:
$$
\frac ux=\int -1dx=-x+C
$$

Por lo que la ecuación queda:
$$
u=-x^2+Cx
$$

Regresando a términos de y:
$$
y=\frac{1}{-x^2+Cx}
$$
