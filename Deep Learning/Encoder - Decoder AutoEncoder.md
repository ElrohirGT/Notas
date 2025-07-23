# Encoder - Decoder

La estructura de W2V es:

```
Diccionario de palabras 
...
(n dimensiones) -> y = x -> Pesos -> SOFTMAX (prob de que la siguiente palabra sea x palabra)
...
```

Las dimensiones yo las elijo, me permite determinar la capacidad de relaciones
que puede realizar mi arquitectura.

## Encoder

```

  LSTM (Se tienen varias capas de LSTM que corren una después de la otra)
    ^
    |
  LSTM (... Y también  otras que corren en paralelo)
    ^
    |
   W2V
    ^
    |
_There_ is a Car
```

Además se copia la misma arquitectura por cada palabra de la oración input.

La salida de corto plazo de la primera LSTM se aplica como input a la segunda
LSTM y también a ella misma.

Por último se tiene un context vector. Que es una salida concentrada de las
características del texto de entrada.

## Decoder

El decoder tiene la misma arquitectura que el Encoder, la única diferencia es
que no se entrena los W2V con el diccionario de la palabra inglés, sino que en
el lenguaje objetivo.

Finalmente todos los outs del decoder se van a una capa de una red normal, es
decir, una _fully connected_ que se conecta luego a una SOFTMAX.
