# Matriz de Adyacencia
Es una matriz que representa todas las conexiones dentro de un grafo.

* $\odot$: Multiplicar por componentes.
* $\preccurlyeq$: Operador precedencia.

**Reflexividad**

Todos los elementos de la gráfica están conectados consigo mismo. Matemáticamente, esto se puede determinar si:
$$
M_a\odot I_n=I_n
$$

En donde $I_n$ es la matriz de identidad de $n$ dimensiones según las dimenciones de la matriz de adyacencia $M_a$.

**Simetría**

Se cumple solamente cuando todas las relaciones de a->b también tienen b->a. Matemáticamente esto se determina:
$$
M_a^T=M_a
$$
Es decir, la transpuesta de la matriz es igual a la matriz original.

**Antisimetría**

Si se tienen dos objetos diferentes, puede existir a->b o ninguna relación, pero si existe a->b y b->a entonces no es antisimétrica.
$$
M_a^T\odot M_a\preccurlyeq I_n
$$

Todo lo que no esté en la diagonal debe ser 0, pero en la diagonal puede o no tener 0's.

**Transitividad**

$$
M_a^2\preccurlyeq M_a
$$

## Multiplicación de Matrices
Un método sencillo y rápido de multiplicar matrices, es dividirla en vectores. Cada fila de la matriz derecha se divide en sus elementos y cada elemento multiplica a una columna de la matriz izquierda. El resultado se suma y este vector es la columna de la matriz resultado. Se repite por todas las columnas y eso da la matriz total.


