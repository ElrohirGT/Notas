# Capacitancia
Un capacitor son dos placas conductoras que se encuentran muy cercanas entre ellas, una tiene carga positiva y la otra carga negativa.

La capacitancia es qué tanta energía se guarda en un capacitor.

$$
C=\frac{Q}{\Delta V}; \frac{Coulombs}{Volts}=Farad
$$

Hay 3 tipos de capacitores:

> Nota: Se debe integrar del punto en donde hay menos volts al punto en donde hay más volts

## Placas Paralelas
Para estas placas el campo se curva en las orillas, lo cual se llama efecto del borde. Supondremos que son placas infinitas y por lo tanto no hay efecto de borde.

El campo dentro de capacitor es:
$$
\vec{E}=\frac{\sigma}{\epsilon_0}
$$

Por lo que el diferencial de voltaje es:
$$
\Delta V = -\int_0^d\vec{E}\cdot (-dx)=\frac{Qd}{A\epsilon_0}
$$

Entonces la capacitancia es:
$$
C=\frac{A}{d}\epsilon_0
$$

## Capacitor Cilíndrico
Igual suponemos que no hay efecto de borde.

Por ley de Gauss el campo dentro del capacitor es:
$$
\vec{E}=\frac{Q}{2\pi\epsilon_0 Hr}
$$

Integrando entre ambos radios a y b:
$$
\Delta V = -\int_b^a\frac{Q}{2\pi\epsilon_0 Hr}dr=\frac{Q}{2\pi\epsilon_0 H}\ln\frac ba
$$

Encontrando la capacitancia:
$$
C=\frac{2\pi\epsilon_0 H}{\ln\frac ba}
$$

## Capacitor Esférico
En este simplemente no hay borde.

a es el radio de la carga y b es el radio del cobertor.

El campo es el de una partícula así que solo se integra para obtener el potencial.
$$
\Delta V=-\int_b^a\frac{Q}{4\pi\epsilon_0 r^2}=\frac{Q}{4\pi\epsilon_0}\left[\frac1a-\frac1b\right]
$$

Ahora la capacitancia es entonces:
$$
C=\frac{4\pi\epsilon_0}{\frac1a-\frac1b}=\frac{4\pi\epsilon_0ab}{b-a}
$$

## Dieléctrico en Capacitores
Un dieléctrico es también conocido como un aislante. Como $\epsilon_0$ es la permitividad dieléctrica del vacío y es la menor que existe, entonces utilizaremos las demás permitividades en términos de $\epsilon_0$.

Cuando se perfora un dieléctrico debido a que las cargas saltaron de una placa a otra, el capacitor queda inútil.

El agua es un _buen_ dieléctrico, pero solamente cuando es completamente pura.

## Capacitores en Paralelo
Conectados en paralelo significa que cada terminal esta conectada solamente a otra terminal de otro capacitor. En paralelo el voltaje siempre es el mismo.

$$
Q_{tot}=Q_1+Q_2+...+Q_n
$$

$$
C_{eq}=C_1+C_2+...+C_n
$$

## Capacitores en Serie
Cuando se encuentran conectados en serie, solamente comparten una terminal. Cuando se tienen capacitores en serie, las cargas son iguales:

$$
Q_1=Q_2=...=Q_n
$$

$$
\Delta V = \Delta V_1+\Delta V_2+...+\Delta V_n
$$

Por lo tanto:
$$
C_{eq}=\left[\frac{1}{C_1}+\frac{1}{C_2}+...+\frac{1}{C_n}\right]^{-1}
$$

## Energía almacenada en un capacitor
$$
\Delta U =\frac{Q^2}{2C}=\frac12 C (\Delta V^2)
$$

## Capacitores con varios dieléctricos
![[Ejemplo Circuito Varios materiales-1.png]]
![[Ejemplo Circuito Varios Materiales-2.png]]
![[Ejemplo Circuito Varios materiales-3.png]]
## Suma de voltajes de Kirchoff
Se aplica en cualquier circuito cerrado:
$$
\sum Voltaje = 0
$$

## Ejemplos
![[Ejemplo Circuito-1.png]]
![[Ejemplo Circuito-2.png]]
![[Ejemplo Circuito-3.png]]
Para encontrar el b, se realiza un despeje comenzando desde la carga total hasta el capacitor que nos piden.
