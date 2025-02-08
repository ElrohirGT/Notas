# Ecuaciones Diofánticas

Son aquellas ecuaciones de dos o más incógnitas cuyos coeficientes son números
enteros y de las cuáles se buscan soluciones enteras. Tienen la forma: $$
ax+by=c $$

La idea es resolver estas ecuaciones usando Bézout, para esto c debe ser un
múltiplo del mcd entre a y b.

Estas ecuaciones tienen infinitas soluciones si es que cumplen Bézout. La forma
de encontrar estas ecuaciones es:

- Se reemplaza: $a(x_0+t)+b(y_0-s) = c$.
- Al expandir, tendremos algo parecido a: $At-Bs=0$, lo que nos da una relación
  entre $t,s$.
- El mcm entre $A$ y $B$ nos sirve para obtener las $K$'s para: $$
  x=x_0+K_0\\lambda $$ $$ y=y_0+K_1\\lambda $$

En donde $\\lambda$ es cualquier número entero.

En donde $K_0=\\frac{mcm(A,B)}{A}$ y $K_1=\\frac{mcm(A,B)}{B}$

## Ejemplos

$$ 10x+33y=15 $$

Primero por Euclides, el Máximo Común Divisor es 1.

15 es múltiplo de 1, por lo que sí tiene solución. Para encontrarla resolvemos
la identidad de Bézout. $$ x_0=10;\\ y_0=-3 $$

Ahora se reescribe: $$ 15(10x_0+33y_0=1) $$ $$ 10(150)+33(-45)=15 $$

Por lo que $x=150$ mientras $y=-45$.
