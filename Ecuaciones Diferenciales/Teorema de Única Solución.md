# Teorema de una solución única
Si se tiene un plano xy, y la función es continua en ese plano, así como su derivada es continua en ese plano, entonces habrá una única solución para esos rangos.

## Ejemplos
Dada la ecuación: $\frac{dy}{dx}=xy^{\frac{1}{2}}$
Determine si existe una única solución en los puntos: $(0,0)\ (1,1)\ (1,-1)$.

$$
\frac{\delta f}{\delta y} = \frac{x}{2 \cdot y^{\frac{1}{2}}}\\
I_f = y\geq 0\\
I_{\frac{\delta f}{\delta y}} = y \gt 0\\

I_f\cap I_{\frac{\delta f}{\delta y}}  = y \gt 0
$$

Entonces:
* $(0,0)\ (1,-1)$: No existe una única solución para este punto, pues no se encuentra dentro del intervalo encontrado anteriormente.
* $(1,1)$: Sí existe una única solución para este punto.

