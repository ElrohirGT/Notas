# Redes Neuronales

## Back Propagation

Es un algoritmo que nos permite ajustar todos los pesos y biases de una red
neuronal.

Se realiza una derivada parcial para cada peso y bias de la red. Se usa el valor
actual de esa variable en la que se derivó para calcular el movimiento usando la
siguiente fórmula:

$$
SR = \sum(Observado - Predicho)^2
$$

$$
\frac{\delta SR}{\delta Pred}\cdot\frac{\delta Pred}{\delta b_3}\cdot\alpha
$$

En el ejemplo de arriba es para un bias 3, pero la lógica es la misma solo se
cambia la derivada según la variable a analizar.

## Redes Neuronales Estándar

Es la red más básica.

- Se pueden comenzar a hacer más complejas con respecto del input.
- No son muy buenas guardando las relaciones temporales.
- Son muy sensibles a cambios en el input.

## Redes Neuronales Convolucionales

Nos ayuda a extraer as correlaciones entre las variables de entrada, en general
tiene 3 beneficios:

- Reduce la cantidad inicial de nodos.
- Resiliente a shifts.
- Aprovecha la correlación que se observa entre pixeles.

Funcionan de la siguiente forma:

1. **Slide:** En este paso se realiza el producto punto de una submatriz con el
   filtro. De estos resultados se genera el feature map. Luego se le aplica la
   función de activación.
1. **Pooling:** Se realiza un muestreo del feature map, según un tamaño que
   nosotros definamos y una estrategia que decidamos (max, mean).

**Striding**: A veces para al realizar el slide, se agrega padding para poder
encontrar más relaciones.

Problemas:

- Overfitting
- Gradientes que desaparecen, se divide dentro de valores muy grandes.

## Convolución

> Definelo más tarde: https://www.youtube.com/watch?v=KuXjwB4LzSA
