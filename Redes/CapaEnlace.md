# Capa Enlace

- Unidad de información: frame.

- Funciona en las NIC (Network Interface Card)

- Datagrama: header+bits.

- Detectan errores y los corrigen. En el caso de corrección se necesita enviar
  de nuevo el paquete.

## Detección de Errores

**Paridad Simple:**

Se tiene un bit de paridad que indica si la cantidad de 1s en el mensaje es
par/impar dependiendo si la paridad es par/impar. Si la cantidad de 1s no cuadra
con lo mismo que indica el bit de paridad entonces se sabe que el mensaje es
inválido.

**Paridad de dos dimensiones**

Detecta y corrige errores en bits individuales. Divide los bits en una tabla de
0s y 1s. y cada fila y columna tiene un bit de paridad. Si alguna fila y columna
tiene un bit cambiado, los bits de paridad nos permitirán identificar cuál fue
el error y cómo arreglarlo.

**Códigos de Hamming**

**Distancia de Hamming**: La cantidad de bits que tienen que cambiar para que un
código válido se transforme en otro código válido.

Para los código de Hamming D es la data que se tiene que transmitir y n es el
largo del mensaje ya con los bits de redundancia:

$$
2^n>= D+1+n
$$

$$
bits\ redundancia = n-D
$$
