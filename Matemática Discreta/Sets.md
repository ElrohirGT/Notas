# Sets
Son una colección de elementos. Pueden ser finitos o infinitos.
* Set finito: $A=\{1,2,3,4,5,6,7,8,9\}$
* Set infinito: $\mathbb{Z}^+=\{1,2,3,4,5,...\}$

Los elementos que se repitan en un set se escriben una sola vez:
$\{1,2,2,2,2,3,1\} = \{1,2,3\}$

No hay orden en los sets: $\{1,2,3\}=\{2,3,1\}$

Los Sets pueden tener [[Subsets]].

Los sets también pueden tener [[Power Sets]].

Se pueden realizar [[Set Operations]].

Los conjuntos discretos son todos los conjuntos finitos o infinitos que se pueden contar. Es decir, a los que se les puede asignar un número natural de forma biyectiva.

## Cardinalidad
El tamaño de un set se le llama cardinalidad. Se representa $|C|$, en donde C es el nombre del set.

Si hay una biyección entre dos sets, entonces se dice que tienen la misma cardinalidad.

Un conjunto infinito enumerable es aquel en el que siempre se puede asignar un número natural a cada elemento del conjunto de formar biyectiva.

## Sets comunes
Número naturales: 
$\mathbb{N} = \{0,1,2,3,4,...\}$

Números enteros:
$\mathbb{Z}=\{...,-2,-1,0,1,2,...\}$

Números racionales:
$\mathbb{Q}=\{...,-\frac{1}{2},-\frac{1}{4},...\}$

Set Vacío:
$\emptyset = \{\}$

Set que contiene todas las cadenas booleanas de longitud n: $B_n$

## Sets y sus elementos
$let\ C =\{Yellow,\ Blue,\ Red\}$

|Símbolo|Significado|
|--|--|
|$\in$|$Yellow \in C$ |
|$\notin$|$Green\notin C$|

## Notación constructora
Números racionales:
$\mathbb{Q}=\{\frac{m}{n}| m,n\in\mathbb{Z}, n\ne 0\}$

Enteros Pares:
$2\mathbb{Z} = \{2n | n\in\mathbb{Z}\}$

## Representación en la computadora.
Supongamos que el conjunto universal $U$ es finito. Luego, especifiquemos un orden arbitrario de los elementos de $U$.

Representamos un subconjunto $A$ de $U$ con una cadena binaria de longitud $n$, en donde el i-ésimo bit es:
* 1 si el elemento $a_i$ pertenece a $A$.
* 0 si el elemento $a_i$ no pertenece a $A$.

