# Criptografía
La criptografía estudia las técnicas de cifrado o codificado destinadas a alterar las representaciones lingüísticas de ciertos mensajes con el fin de hacerlos ininteligibles a receptores no autorizados.

## Cifrados de Llave privada
Son cifrados sencillos que utilizan una misma llave para encriptar y desencriptar. Por esta razón es débil, ya que una tercera persona simplemente necesita tener acceso a esta llave o lograr deducirla para descrifrar todos los mensajes.

### Shift Cipher
$$
E(x)=x+k\ (mod\ m),k\in Z_m
$$
![[Shift cipher alphabets.png]]

### Affine Cipher
Son una generalización de los Shift Cipher, en donde dos palabras que estén conjuntas en el alfabeto original, no necesariamente estarán conjuntas en el alfabeto encriptado.
$$
E(x)=ax+b\ (mod\ m),a,b\in Z_m
$$

## Cifrados Monoalfabéticos
Son los cifrados que reemplazan un caracter del alfabeto por otro. No siempre reemplazan el mismo caracter incluso dentro del mismo mensaje.
