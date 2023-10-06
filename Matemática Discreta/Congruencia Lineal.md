# Congruencia Lineal
Para que haya una congruencia lineal el máximo común divisor de a y m debe dividir a b.

## Ejemplo
Resuelva la congruencia lineal:
$$
9x\cong 11\ (mod\ 15)
$$

Primero se pasa a forma de ecuación:
$$
9x+15y=11
$$

Entonces se resuelve la ecuación diofántica, pero igualada al máximo común divisor:
$$
9x+15y=mcd(9,15)=3
$$

Como 3 no divide a 11, esta ecuación no tiene solución y por lo tanto no son linealmente congruentes.

---
Resuelva la congruencia lineal:
$$
6x\cong 15\ (mod\ 21)
$$

Pasando a ecuación:
$$
6x+21y=15
$$

El mcd es $3$. 3 sí divide a 15 por lo que sí tiene solución.
$$
21=3\cdot6+3
$$
$$
6=2\cdot3+0
$$

Se realiza bezout para obtener la solución general:
$$
3=6(-3)+21
$$

Por lo que $x_0=-3$, $y_0=1$. Obteniendo la solución general:
$$
x=-15+\lambda\cdot\frac{21}{3}=-15+7\lambda
$$

Debido a que el mcd es 3, se tendrán 3 soluciones.
$$
-15=-3\cdot7+6
$$

Por lo que las soluciones serán:
$$
x\cong6,(6+7),(6+2\cdot7)
$$

