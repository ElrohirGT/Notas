# Algoritmos de Optimización

## Gradiente descendiente

**Batch Gradient Descent**

- Convergencia estable.
- Estimación precisa del gradiente.
- Costoso computacionalmente.

**Gradiente descendiente estocástico**

- Acelera la convergencia mediante el uso de una muestra aleatoria por
  iteración.
- Reduce el ruido; puede escapar de los mínimos locales.
- SGD: Stocastic Gradient Descent.
- Convergencia más rápida pero podria no converger.
- Adecuado para conjuntos grandes; elección inicial.

**Mini-Batch Gradient Descent**

- Equilibrios entre el descenso de gradiente estocástico y por lotes.
- Funciona de forma similar a la de gradiente descendiente estocástico pero por
  batches.
- Mejor equilibrio entre precisión y velocidad. Compromete la estabilidad de
  convergencia para dar mejor tiempo de cálculo.

## Momentum

Acelera la convergencia mediante la acumulación de velocidad. Suaviza las
actualizaciones, escapa mínimos locales poco profundos. Es un parámetro extra
que se utiliza en los algritmos de gradiente descendiente.

## RMSprop (Root Mean Square Propagation)

Adapta las tasas de aprendizaje para parámetros individuales. Ayuda con la
convergencia en diferentes direcciones. El epsilon generalmente es pequeño y no
debería ser mayor a 1.

## Adam (Adaptive Moment Estimation)

Combina técnicas de Momentum y RMSprop. Se adapta a gradientes y curvaturas. A
menudo funciona bien de manera predeterminada.

## Optimización de Hiperparámetros

- Cross Validation
- Grid Search
- Random Search
- Optimización Bayesiana
