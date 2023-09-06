# Potencial Eléctrico
$$
\frac{U_{el}}{q}=V;\ \left(\frac JC\right)=Volts
$$

Al resolver problemas de predicción de movimiento de partículas en campos eléctricos por medio de Newton obtenemos ecuaciones diferenciales no lineales, las cuales son muy difíciles de resolver. Además es complicado el tomar en cuenta los vectores de movimiento.

**Trabajo**
$$
W=\int_C \vec{F}\cdot\vec{dl}
$$
$dl$ es un pequeño pedacito de arco.

Las dimensionales del trabajo son Joules.

Para  las fuerzas conservativas se cumple:
$$
W_c =-\Delta E_p
$$

Es debido a las fuerzas conservativas que nace la energía potencial. Las fuerzas no conservativas no tienen una energía potencial asociada.

## Principio de Conservación de la Energía
$$
E=U+K
$$
Si: $W_{no\ conservativa}=0$. Entonces: $\Delta E=0$.

La energía potencial eléctrica va a cambiar según el campo.

## Energía Potencial Eléctrica
Dos partículas separadas por $r$:
$$
U_{el}=\frac{qQ}{4\pi\epsilon_0 r}
$$

Por lo que para una partícula en específico:
$$
V=\frac{Q}{4\pi\epsilon_0 r}
$$

La fuerza es al campo eléctrico como la energía potencial eléctrica es a el potencial eléctrico.

Esta es la fórmula del potencial eléctrico:
$$
\Delta V = \frac{\Delta U}{q}
$$

La forma general del potencial eléctrico es:
$$
\Delta V_{AB} = -\int_{r_A}^{r_B} \vec E\cdot d\vec l
$$

## Electrovoltio (eV)
Representa la cantidad de energía cuando un electrón se mueve de un punto de pontecial $V_a$ a otro de potencial $V_b$ cuando $\Delta V=1$.
$$
1 eV = 1.602 177\cdot 10^{−19} J
$$

## Ejemplos
Potencial de una línea finita con carga uniforme en un punto ubicado a una distancia x del centro de la línea y perpendicular a ella.

El potencial eléctrico 
$$
\Delta V_{AB} = -\int_{r_A}^{r_B} \vec E\cdot d\vec l
$$
$$
\vec E = \frac{Q\vec i}{4\pi\epsilon_0 x \sqrt{x^2+\left(\frac L2\right)^2}}
$$
$$
d\vec l = -\vec i dx
$$
$$
\Delta V_{AB} =-\int_{x_B}^{x_A} \frac{Q\vec i}{4\pi\epsilon_0 x \sqrt{x^2+\left(\frac L2\right)^2}}(-\vec i dx)=\frac{Q}{4\pi\epsilon_0}\int_{x_B}^{x_A}\frac{1}{x\sqrt{x^2+\left(\frac L2\right)^2}}
$$

Resolviendo sería:
$$
\Delta V_{AB} =\frac{-Q}{2\pi\epsilon_0 L}\cdot\ln \left|\frac{\sqrt{x^2+\left(\frac L2\right)^2}-\frac L2}{x}\right|
$$
