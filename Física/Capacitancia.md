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
