# Ley de Gauss

Es otra forma de entender el concepto de campo eléctrico. Busca encontrar la distribución de carga en base al campo.

**Flujo:** El producto punto entre el vector área y la velocidad de lo que sea que pase dentro del área.

Área regular:
$$
\Phi_E=\vec{E}\cdot\vec{A}
$$

Área Irregular:
$$
\Phi_E=\int\vec{E}\cdot d\vec{A}
$$

$$
\Phi_E=\oint\vec{E}\cdot d\vec{A}=\frac{Q_{encerrada}}{\epsilon_0}
$$

Busca una superficie en la que el vector área y el campo sean paralelos y que el campo sea constante. Esto facilita mucho la integral al final.

## Conductor en Equilibrio Electrostático
1. Carga en la superficie.
2. El campo interior es 0. Independientemente de si está vacío o lleno de algo el campo.

## Jaula de Faraday
Debido a que el campo dentro de un conductor en equilibrio electrostático es 0, se pueden crear espacios aislados de carga dentro de este campo. Esta construcción que encierra este espacio se llama Jaula de Faraday.

## Ejemplo
Ordene las siguientes superficies de la mayor a menor flujo.
* Superficie plana rectangular con $\vec{A}=6.0m^2\vec{i}$ en un campo eléctrico $\vec{E}=4.0N/C\vec{j}$.
* Superficie plana circular con $\vec{A}=3.0m^2\vec{j}$ en un campo eléctrico $\vec{E}=4.0N/C\vec{i}+2.0N/C\vec{j}$.
* Superficie plana cuadrada con $\vec{A}=3.0m^2\vec{i}+7.0m^2\vec{J}$ en un campo eléctrico $\vec{E}=4.0N/C\vec{i}-2.0N/C\vec{j}$.
* Superficie plana oval con $\vec{A}=3.0m^2\vec{i}-7.0m^2\vec{j}$ en un campo eléctrico $\vec{E}=4N/C\vec{i}-2N/C\vec{j}$.

... Se realiza producto punto entre área y campos eléctricos.

1. Plana Oval.
2. Plana Circular.
3. Plana rectangular.
4. Plana Cuadrada.

---
![[Física/Ejemplo Ley de Gauss.png]]

Como la esfera está afuera, y el radio gris no tiene carga, esto se comporta igual que una carga puntual. Por lo que el campo total es:
$$
E=\frac{Q}{4\pi\epsilon_0 r^2}
$$

![[Ejemplo Ley de Gauss 1.png]]
El conductor se polariza por la esfera naranja, es decir, su lado interno es más negativo y su lado externo es más positivo, a este tipo de carga se le llama carga por polarización.

$$
E=0
$$

![[Ejemplo Ley de Gauss 2.png]]
Debido a que la única carga encerrada dentro de la figura gaussiana es la esfera naranja, este campo se comporta como una carga puntual. Osea:
$$
E=\frac{Q}{4\pi\epsilon_0 r^2}
$$

Por último si nos encontramos dentro de la esfera, el campo va a variar dependiendo de qué tanta carga encierre nuestra superficie gaussiana. Debido a que la distribución de la carga es uniforme, se puede simplemente usar 
![[Solución Ejemplo Ley de Gauss.png]]
---
![[Problema Ley de Gauss.png]]
![[Ejercicio Ley de Gaus-1.png]]
![[Ejercicio Ley de Gaus-2.png]]