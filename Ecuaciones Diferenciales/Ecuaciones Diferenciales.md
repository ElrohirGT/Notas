# Ecuaciones Diferenciales
Se pueden graficar por medio de [[Campos Direccionales]].

$\frac{dy}{dx}+5y=e^x$

$\frac{d^2y}{dx^2}-\frac{dy}{dx}+6y=0$

$\frac{dx}{dt}+\frac{dy}{dt}=2x+y$

$\frac{\delta^2 u}{\delta x^2}+\frac{\delta^2 u}{\delta t^2}=0$

|$dy$: Diferencial Ordinario.|$\delta y$: Diferencial Parcial.|
|---|---|
|Las ecuaciones diferenciales que tienen solamente diferenciales ordinarios son Ecuaciones Diferenciales Ordinarias (EDO).| Las ecuaciones diferenciales que tienen solamente diferenciales parciales son Ecuaciones Diferenciales Parciales (EDP).|

Para resolver estas ecuaciones se puede usar el método de [[Método de Separación de Variables]]

## Ecuaciones Diferenciales Ordinarias (EDO)
Son del mismo orden en el que se encuentra su diferencial más alto.
- **Orden:** Máxima derivada que se está aplicando.
- **Grado:** Máximo exponente del polinomio.

|Notación de Leibniz|Notación de Newton/Primas|
|--|--|
|$\frac{dy}{dx}$|$y''$|

**NOTA:** Tomar en cuenta el intervalo en el que una función es continua, ya que solamente puede ser solución a una ecuación diferencial dentro de ese mismo intervalo, pues solamente en ese intervalo es derivable.
Para señalar este intervalo se utiliza la siguiente notación:

$I(a,b)$.

$I -\infin < x < 0$ & $0 < x < \infin$

**Solución trivial:** Muchas veces las ecuaciones diferenciales tienen una solución en donde f=0. **No tomar en cuenta esta para el curso.**

Hay veces que una ecuación diferencial tiene infinitas soluciones que comparten una forma. Este tipo de soluciones introducen constantes para parametrizar la función solución. Se les llama `Soluciones Generales`.

|Solución Particular|Solución General|
|--|--|
|$y=\frac{1}{16}x^4$|$y=ce^x$|

Para elegir qué valor debe tener esta constante se pueden utilizar varios métodos.
- **Condiciones Iniciales:** Con este método se elige/tiene un punto fijo por el que debe pasar la función. Lo cual ayuda a despejar la constante.

Para resolver problemas de segundo orden, se necesita que nos den un punto de la función original y uno de la derivada.

Las EDO pueden ser lineales ([[Edo Lineal]]).

## Tipos de Ecuaciones Diferenciales
* **Autónoma:** $\frac{dy}{dx}=f(y)$
* **No Autónoma:** $\frac{dy}{dx}=f(x,y)$

## Métodos de Solución
[[Método por Sustitución]]: Consiste en reemplazar las variables dependientes e independientes por alguna relación entre ellas, el método de bernoulli también es clasificado como uno de sustitución.

[[Método de Solución ED Exacta]]: No todas las ecuaciones que tienen la forma de una exacta pueden ser resueltas con este método, sin embargo, es definitivamente uno de los más tardados y laboriosos.

[[Método de Separación de Variables]]: Este método es el más sencillo al momento de plantear, pero puede que las integrales nos queden muy complicadas.
## Ejemplos Aplicados
Ejemplos de aplicación se pueden encontrar en la página de [[Ejemplos]].
## Problemas de Valor Inicial 
Determinar que: $x^2+y^2=25$
es solución de: $\frac{dy}{dx} = - \frac{x}{y}$

$$
2xdx+2ydy=0\\
2ydy=-2xdx\\
\frac{dy}{dx}=-\frac{2x}{2y}\\
\frac{dy}{dx}=-\frac{x}{y}
$$

Encontrar la solución explícita particular: $y=\frac{1}{x^2+c}$. En donde: $y'+2xy^2=0 \land y(0) = -1$
$$
y(0) = -1 = \frac{1}{c}
$$
$$
c = -1
$$
$$
y=\frac{1}{x^2-1}
$$

**Problema de valores iniciales (PVI)**

$$x=C_1\cos(4t)+C_2\sin(4t)$$

Solución de: $x''+16x=0$

en donde: $x(\pi/2)=-2\ \land x'(\pi/2) = 1$

$$
x'=-4C_1\cos4t+4C_2\cos4t
$$
$$
x'\left(\frac{\pi}{2}\right)=1=-4C_1\cos(4\cdot\frac{\pi}{2})+4C_2\cos(4\cdot\frac{\pi}{2})
$$
$$
x'\left(\frac{\pi}{2}\right)=1=-4C_1\cos(2\pi)+4C_2\cos(2\pi)
$$
$$
x'\left(\frac{\pi}{2}\right)=1=4C_2
$$
$$
C_2=\frac{1}{4}
$$

$$
x\left(\frac{\pi}{2}\right)=-2=C_1\cos(4\cdot\frac{\pi}{2})+C_2\sin(4\cdot\frac{\pi}{2})
$$
$$
x\left(\frac{\pi}{2}\right)=-2=C_1\cos(2\pi)+C_2\sin(2\pi)
$$
$$
x\left(\frac{\pi}{2}\right)=-2=C_1
$$
$$
C_1=-2
$$

$$
y=-2\cos4t+\frac{1}{4}\sin4t
$$
$$
I(-\infin, \infin)
$$
