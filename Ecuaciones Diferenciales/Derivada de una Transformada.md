# Derivada de una Transformada
$$
L\{t^nf(t)\}=(-1)^n\frac{d^n}{ds^n}F(s)
$$

$$
L\{t\sin kt\}=\frac{2ks}{(s^2+k^2)^2}
$$

## Ejemplos
$$
x''+16x=\cos 4t;\ x(0)=0,\ x'(0)=1
$$

$$
s^2X(s)-sx(s)-x'(s)+16X(s)=\frac{s}{s^2+k^2}
$$

Sustituyendo y simplificando:
$$
X(s)(s^2+16)-1=\frac{s}{s^2+16}
$$

Despejando:
$$
X(s)=\frac{1}{s^2+16}+\frac{s}{(s^2+16)^2}
$$

Ahora obtenemos la inversa para regresar al mundo de las t:
$$
X(t)=\frac14\sin 4t+L^{-1}\left\{\frac{s}{(s^2+16)^2}\right\}
$$

Ese término de fracción lo podemos convertir en la forma de $\sin$ de arriba:
$$
X(t)=\frac14\sin 4t+\frac18L^{-1}\left\{\frac{2\cdot 4\cdot s}{(s^2+16)^2}\right\}
$$
$$
X(t)=\frac14\sin 4t+\frac18 t\sin 4t
$$
