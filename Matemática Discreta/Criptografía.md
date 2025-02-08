# Criptografía

La criptografía estudia las técnicas de cifrado o codificado destinadas a
alterar las representaciones lingüísticas de ciertos mensajes con el fin de
hacerlos ininteligibles a receptores no autorizados.

## Cifrados de Llave privada

Son cifrados sencillos que utilizan una misma llave para encriptar y
desencriptar. Por esta razón es débil, ya que una tercera persona simplemente
necesita tener acceso a esta llave o lograr deducirla para descrifrar todos los
mensajes.

### Cifrados Monoalfabéticos

Son los cifrados que reemplazan un caracter del alfabeto por otro. Una debilidad
es que siempre se reemplaza el mismo caracter por otro exactamente igual.

#### Shift Cipher

$$ E(x)=x+k\\ (mod\\ m),k\\in Z_m $$ !\[\[Shift cipher alphabets.png\]\]

#### Affine Cipher

Son una generalización de los Shift Cipher, en donde dos palabras que estén
conjuntas en el alfabeto original, no necesariamente estarán conjuntas en el
alfabeto encriptado. $$ E(x)=ax+b\\ (mod\\ m),a,b\\in Z_m $$

### Cifrados de Bloque

Podemos hacer que sea más difícil atacar con éxito el texto cifrado reemplazando
bloques de letras con otros bloques de letras en lugar de reemplazar caracteres
individuales con caracteres individuales. Estos cifrados se denominan cifrados
en bloque.

#### Transposition Cypher

Como llave usamos una permutación $\\sigma$ del conjunto ${1,2,3, ..., m}$ para
algún entero positivo $m$. Para cifrar un mensaje dividimos el mensaje en
bloques de tamaño $m$.

Se puede agregar padding de letras aleatorias para hacer que el bloque final
lleguen a $m$. Luego, permutamos las letras de cada bloque según la regla de
asignación de $\\sigma$.

**Notación de ciclos**: Es una manera simplificada de simplificar una
permutación de un conjunto.

!\[\[Notación de ciclo vs Notación de dos líneas.png\]\]

**Ejemplo:** ¿Cuál es el mensaje secreto que se produce a partir del mensaje
“DISCRETE” usando transposition cipher con $\\sigma = (1, 4, 2, 3)$ ?

Primero tenemos que dividir el mensaje en bloques de tamaño $m=4$. DISC RETE

Ahora podemos nombrar a cada letra con su número según su posición y reordenar
en base a la función $\\sigma$. !\[\[Ejemplo Transposition Cypher.png\]\]

#### Vingere Cypher

Como llave se utiliza una cadena de letras con números equivalentes: $k_1, k_2,
k_3, ... k_n$ donde $k_i\\in Z_m$. Si los equivalentes numéricos de las letras
del mensaje son $p_1,p_2,p_3,... p_n$ entonces el texto cifrado numérico
correspondiente es: $$ p_j+k_j\\ (mod\\ m)\\ con\\ j=1,2,3,\\ \\dots\\ ,n $$

Finalmente se traduce de letras a números usando la llave.

El módulo $m$ viene del diccionario en el que se trabaja, es decir, la cantidad
total de letras que se tiene a disposición en el lenguaje.

**Ejemplos** Descifre el mensaje “OIKYWVHBX” si se sabe que fue encriptado con
llave ”HOT”. !\[\[Vingere Cypher.png\]\]

#### Hill Cypher

Se utiliza una matriz $n \\times n$ para cifrar los bloques, cada bloque será de
tamaño $n$. Es mejor si se utiliza un abecedario con una cantidad prima de
elementos.

Es importante que la matriz llave que se escoja no sea congruente con 0 en el
módulo del abecedario escogido y además, el determinante de esta matriz tenga
inverso en el módulo del abecedario.

Si se tiene una matriz: $$ A=\\begin{bmatrix} a & b \\ c & d \\end{bmatrix} $$

Entonces la inversa será: $$ A^{-1}=\\frac{1}{det\\ A}\\begin{bmatrix} d & -b \\
-c & a \\end{bmatrix} $$

En álgebra modular la división no existe, por lo que $\\frac{1}{det\\ A}$ se
convierte en el inverso multiplicativo de la determinante.

**Ejemplos**

SEND MONEY

Debido a que la llave es: $$ \\begin{bmatrix} 26 & 7\\ 3 & 13 \\end{bmatrix} $$

Entonces los bloques serán de tamaño 2.

Se divide la palabra y se transforma cada letra en el número representativo en
su abecedario:

SE - ND - MO - NE - Y\*

El * significa espacio.

Cada uno de estos bloques convertidos a números se convierte en un vector. Por
ejemplo: $$ SE=\\begin{bmatrix} 19\\ 5 \\end{bmatrix} $$

Luego se multiplica la matriz llave por cada uno de estos vectores: $$
\\begin{bmatrix} 26 & 7\\ 3 & 13 \\end{bmatrix}

\\begin{bmatrix} 19 & 14 & 13 & 14 & 25\\ 5 & 4 & 15 & 5 & 0 \\end{bmatrix}

\=

\\begin{bmatrix} 11 & 22 & 36 & 29 & 21\\ 11 & 20 & 12 & 33 & 1 \\end{bmatrix}
$$

Traduciendo el mensaje encriptado usando el abecedario de 37 letras: KKVT9L26UA
