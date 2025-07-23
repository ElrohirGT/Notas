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

En el hamming extendido, se tiene un bit extra (pero incluido en la cuenta n)
que realiza paridad simple sobre los bits de paridad de los bits de redundancia.
Si este bit falla, entonces sabemos que solamente hay 1 error, si no falla
entonces pueden haber 2+ errores. Y si todos los bits de paridad son 0 entonces
no hubo ningún error.

**CRC 32**

1. Definir el polinomio.
1. Encontrar Coeficientes.
1. Agregar n bits de redundancia al mensaje (n = grado de redundancia).
1. Se divide el mensaje dentro de los coeficientes encontrados anteriormente.
   (Se utiliza XOR repetidamente).
1. Se agrega el residuo como los bits de redundancia (los bits de redundancia
   van hasta el final).

Para decodificar, se divide el mensaje nuevamente dentro de los coeficientes del
protocolo sucesivamente hasta que ya no pueda más. Si el residuo es 0 entonces
no hay error!
