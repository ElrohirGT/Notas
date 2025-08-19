# Funciones de pérdidas

## Error Cuadrático Medio (MSE)

Mide la diferencia cuadrada promedio entre predicciones y objetivos. Úsalo en
problemas de regresión.

## Error Absoluto Medio (MAE)

Mide la diferencia absoluta promedio entre predicciones y objetivos. Utilizado
en escenarios de regresión.

## Binary Cross Entropy Loss

Mide la diferencia entre las probabilidades predicas y las etiquetas verdaderas.
Apropiado para tareas de clasificación binaria.

$$
CE=-\sum{y_{true}*log(y_{pred})}
$$

## Softmax y Cross Entropy Loss

Combinado para clasificación de clases múltiples. Cross-entropy mide la
diferencia entre las probabilidades de clases previstas y verdaderas.

## Técnicas de Regularización

La regularización evita el overfitting al agregar restricciones adicionales al
modelo.

### Regularización L1 (Lasso)

Fomenta valores de peso dispersos. Agrega valores absolutos de pesos a la
función de pérdida. Fomenta valores de peso grandes.

$$
total_{loss} = original_{loss} + lambda*regularization_{loss}
$$

### Regularización L2 (Ridge)

Fomenta valores de peso pequeños. Agrega valores al cuadrado de pesos a la
función de pérdida.

### Dropout

Desactiva aleatoriamente neuronas durante el entrenamiento. Reduce la
coadaptación de las neuronas. Ayuda a prevenir el overfitting.
