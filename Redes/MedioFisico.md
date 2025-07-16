# Medio Físico

$$
VelTransmision = B * log_2(1+\frac Sn)
$$

La velocidad de transmisión está dada en bit/s.

El ratio entre S y n se puede interpretar como:

$$
\frac Sn = 10^{\frac{SNR}{10}}
$$

En donde SNR es una cantidad en decibeles. Representando la fortaleza y claridad
de la señal, mientras más grande, más clara es.

**2.4 GHz**

- 14 Canales, rango de 100MHz.

**5.2GHz**

- 24 Canales, rango de 150MHz.

## Conmutación

Se encarga de distribuir un mensaje entre varios recipientes. Disminuye la
cantidad de conexiones necesarias en un sistema al centralizar las conexiones a
él.

**PSTN**: Public Switched Telephone Network

**ARPANET**: En lugar de dividir los circuitos se divide la información en
paquetes.

En telefonía establecer una conexión dedicada se conoce como circuito.

La idea es que un mismo canal puede ser usado para distintos usuarios mediante
multiplexación (combinar dos o más señales). Se realiza por división de
frecuencias o tiempo.

**Frecuencias**: Tienen la ventaja de transmitir de forma continua. Desventaja,
cada usuario utiliza una porción del ancho de banda.

**Tiempo**: Los usuarios transmiten usando el ancho de banda completo pero se
van turnando, y solo pueden transmitir durante el tiempo asignado a ellos.

La conmutación de circuitos es más costosa que la conmutación de paquetes. Es
menos eficiente y da grandes períodos de inactividad.
