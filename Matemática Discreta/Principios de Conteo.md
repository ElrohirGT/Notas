# Conteo en Conjuntos Finitos
## Principio de la Suma
Dados dos conjuntos finitos A y B tales que $A\cap B=\emptyset$ entonces:
$$
|A\cup B|=|A|+|B|
$$

Estos conjuntos pueden representar acciones o tareas, por lo que podemos decir que si A es un tipo de tarea y B es otra tarea, se puede realizar una tarea grande de $A+B$ formas.

> En general, si $A_1,A_2,...A_n$ son conjuntos finitos tales que $A_i\cap A_j=\emptyset$ entonces:
$$
\left|\bigcup_{k=1}^n A_k\right|=\sum_{k=1}^n \left|A_k\right|
$$

### Ejemplos
Si tenemos 5 libros de matemática y 8 libros de física de cuántas maneras podemos escoger un libro.

Entonces, como son conjuntos independientes, no hay libros que sean de ambas materias, por lo que existen $5+8=13$ formas de escoger un libro.

---

Consideremos $A=\{x\in Z^+ | 1\leq x\leq 50\ y\ x=4k\}$ y $B=\{x\in Z^+| 51\leq x\leq 100\ y\ x=4k\}$. Cuánto es la cardinalidad de $A\cup B$.

Para contar la cantidad de números entre dos límites se puede usar:
$$
max-min+1
$$

Entonces:
$$
|A| = \left\lfloor \frac{50-1+1}{4} \right\rfloor=12
$$

y para B:
$$
|B| = \left\lfloor \frac{100-51+1}{4} \right\rfloor=12
$$

Sin embargo, si se suman ambas partes fraccionarias de la cuenta, nos queda $0.5+0.5=1$. Por lo que hay un múltiplo que nos falta contar. Así que:
$$
|A\cup B|=25
$$

## Principio del Producto
Dados dos conjuntos finitos $A$ y $B$ entonces:
$$
|A\times B| = |A|\cdot|B|
$$

Para poder deducir este principio nos podemos fijar que si tenemos:
$$
A=\{a_1,a_2,...a_m\}
$$
$$
B=\{b_1,b_2,...b_n\}
$$

Ahora podemos notar que:
$$
C_1=\{(a_1,b_i)\}\rightarrow|C_1|=n
$$
$$
C_2=\{(a_2,b_i)\}\rightarrow|C_2|=n
$$

Además, no hay elementos repetidos en $C_1$ y $C_2$. De aquí se puede deducir que:
$$
C_m=\{(a_m,b_i)\}\rightarrow|C_m|=n
$$

$$
\left|\bigcup_{k=1}^m C_m\right|=n+n+...+n=mn
$$

En otras palabras si una tarea se tiene que realizar en dos etapas, la primera de m formas y la segunda etapa de n formas, si todas las formas son diferentes, entonces la tarea en general se puede realizar de $m\times n$ formas.

> En general si $A_1,A_2,...,A_n$ son conjuntos finitos entonces:
$$
\left|\bigtimes_{k=1}^n A_k\right|=\Pi_{k=1}^n|A_k|
$$

## Principio de Inclusión-Exclusión
Dados dos conjuntos finitos A y B cuya intersección no es vacía, entonces:
$$
|A\cup B| = |A| +|B|-|A\cap B|
$$

### Ejemplos
Teniendo una baraja estándar de 52 cartas ¿De cuántas formas podemos elegir una carta roja o uno de los símbolos J, Q o K?

Se tienen dos conjuntos, A=cartas rojas, B=cartas con símbolos J, Q o K. Por lo que la cantidad en las que podemos elegir alguna de estas dos es:
$$
|A\cup B| = |A| +|B|-|A\cap B|=26+12-6=32
$$
## Formas Rápidas de Contar
Algunas formas rápidas de contar es usar técnicas como las [[R-combinaciones]], las [[Combinaciones con elementos indistinguibles]] o las [[Permutaciones]].