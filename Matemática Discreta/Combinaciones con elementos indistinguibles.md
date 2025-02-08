# Combinaciones con elementos indistinguibles

El orden en el que se escojan los elementos no es relevante y además hay
elementos indistinguibles.

$$ C(n-1+r,r) $$

n: Representa la cantidad de tipos de objetos que hay. r: La cantidad de objetos
que necesitamos seleccionar.

## Ejemplos

Hay 8 sabores de donas distintos. ¿De cuántas maneras diferentes podemos elegir
media docena de donas?

Este problema equivale a contar cuántas cadenas binarias de longitud: $(8-1)+6$
tienen 6 ceros o 7 unos. Ambos números son iguales debido a la simetría pero se
puede usar cualquiera de los dos.

Por lo que: $$ C(8-1+6,6)=1716 $$

______________________________________________________________________

Es una tienda de helados hay 6 diferentes sabores de helado.

a. ¿De cuántas maneras diferentes podemos elegir una docena de helados, si
debemos elegir exactamente 3 helados de vainilla?

Como fijo tienen que ir 3 de vainilla, realmente solo podemos elegir de 5
sabores. Por lo que solo podemos elegir 9 helados de 5 sabores. $$
C(5-1+9,9)=715 $$

b. ¿De cuántas maneras diferentes podemos elegir una docena de helados, si
debemos elegir al menos 4 helados de chocolate?

La cantidad de sabores se queda igual, pues puedo seguir escogiendo helados de
chocolate, sin embargo la cantidad de helados que escojo es reducida pues ya
preescogí 4. $$ C(6-1+8,8)=1287 $$

c. Máximo 3 helados de pistacho.

Se puede resolver de dos formas. La primera forma es sumar todos los casos según
la cantidad de pistachos.

Cuando se tienen 0 helados de pistacho, se tienen 5 sabores y 12 helados a
seleccionar.

Cuando se tiene 1 helado de pistacho, se tienen 5 sabores y 11 helados a
seleccionar...

Por lo que: $$ \\sum_0^{n=3}C(5-1+12-n,12-n)=4901 $$

La segunda forma involucra complemento, el complemento de máximo 3 helados es
mínimo 4 helados. Por lo que primero se calcula el total y después se le resta
el complemento: $$ C(6-1+12,12) - C(6-1+8,8)=4901 $$

______________________________________________________________________

En el plano cartesiano, si se permiten únicamente movimientos de una unidad
hacia la derecha o una unidad hacia arriba:

a. ¿Cuántos diferentes caminos existen desde el punto (0,0) hasta el punto
(6,5)?

Se puede ver como una cadena binaria de longitud 6+5=11 con cinco 1's o seis
0's. Por lo que contando: $$ C(11,6)=462 $$

b. ¿Cuántos de los caminos del inciso a no pasan por el punto (4,3)?

Se puede contar con cuantos caminos hay del (0,0) -> (4,3) -> (6,5). $$ C(11,6)
\- (C(7,3) * C(4, 2))=252 $$

______________________________________________________________________

Encuentre el coeficiente del término $x^2y^4$ en la expansión de $(x+y)^6$. $$
(x+y)^6=(x+y)(x+y)(x+y)(x+y)(x+y)(x+y) $$

1:= escoger x.

0:= escoger y.

Por lo que se puede ver como un problema en donde quiero escoger 2 x's (o 4 y's)
de 6 disponibles. $$ C(6,2)=15 $$
