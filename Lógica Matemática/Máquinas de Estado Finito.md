# Máquinas de estado finito

## Notación

$$
(x_1, x_2, x_3, ...)
$$

A: Conjunto finito.

$$
A^n=\{x_1, x_2, \dots x_n| x_i\in A\ para\ i=1,\dots,n\}
$$
$$
A^+=U_{i=1}^\infty A^i = A^1 \cap A^2 \cap \dots \cap A^n
$$

**Ejemplo**
$$
A = \{a,e,i,o,u\}
$$

$$
A^3=\{aaa,eee,iii,ooo, \dots, aei, aio, \dots, uuu\}
$$

También se puede escribir como:
$$
A^3=\{x_1 x_2 x_3 | x_1\in A, x_2\in A, x_3\in A\}
$$

El **lenguaje** son las cadenas que se puden formar utilizando los símbolos del **alfabeto**.

**Ejemplo**

Si $A=\{a,b,c\}$ entonces algunos lenguajes son:
$$
L_1=\{\}
$$
$$
L_2=\{a, aa, ab\}
$$
$$
L_3=\{a^1cb^1 | i \ge 1\}
$$

> $\lambda$ es un símbolo que representa algo que no está en el alfabeto de un lenguaje.
> Se llama cadena vacía y cualquier concatenación con otra cadena nos da la misma cadena original.

## Gramática

Una gramática de estructuras de frases para especificar un lenguaje consta de 4 elementos:
1. Un conjunto de terminales T.
2. Un conjunto de no terminales N.
3. Un conjunto de producciones P.
4. Un no terminal en N que es el símbolo inicial S.

**Notación:** $G=(N,T,P,S)$

El conjunto $P$ es un conjunto de mapeos que nos llevan a más y más símbolos que eventualmente nos llevan a símbolos terminales.

**Ejemplo**

$$
G=(\{enunciado, sujeto, predicado, artículo, sustantivo, verbo\}, \{el, perro, ladra\}, P, enunciado)
$$

La expresión de arriba nos dice que el símbolo inicial de todo el árbol de producciones es el símbolo "enunciado".

$$
P=\{enunciado -> sujeto\ predicado,
sujeto -> artículo sustantivo,
predicado -> verbo,
artículo -> el,
artículo -> la,\}
$$

Una gramática es de tipo 3 si todas las producciones de la gramática son de la forma:
$A -> a$ o $A -> aB$ de manera equivalente de las formas $A-> a$ o $A-> Ba$

## Máquina de Estado Finita
Una máquina de estado finito está especificada por:
1. Un conjunto finito de estados S.
2. $S_0$ un estado inicial.
3. Un conjunto finito de caracteres de entrada $I$
4. Un conjunto finito de caracteres de salida $O$
5. Una función $f$ de $S\times IaS$ (función de transición)
6. Una función $g$ de $SaO$ (función de salida)
