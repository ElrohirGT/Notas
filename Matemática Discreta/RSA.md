# RSA

Es un sistema criptográfico de llave pública. Realmente se tienen dos llaves,
una pública y una privada.

El emisor conoce la llave pública, y entonces él puede encriptar. Esta llave son
dos números: $$ (e,n) $$

El receptor construye la llave pública:

1. Escoger 2 números primos $p\\ y \\ q$. Mientras más grandes, mejor.
1. Calcular $n=pq$.
1. Calcular $\\phi=(p-1)(q-1)$ y escoger un entero positivo $e$ tal que
   $mcd(e,\\phi)=1$

Al momento de encriptar, se toman bloques de caracteres. En este curso se
tomarán bloques de dos caracteres, por lo que es importante que el número que se
forma al unir dos caracteres no sea mayor a $n$. En caso sea mayor, se necesita
escoger otro abecedario u otros $p\\ y \\ q$.

La función de encriptación es: $$ f(x)=x^e\\ (mod\\ n) $$

En donde $x$ es el número formado por los caracteres del bloque.

Para encontrar la llave privada $d$ que desencripta el mensaje, se necesita
resolver la siguiente congruencia: $$ e\\cdot d\\cong1\\ (mod\\ \\phi) $$

Por lo tanto la función inversa será: $$ f(x)=x^d\\ (mod\\ n) $$

En donde $x$ es el número del bloque ya encriptado.
