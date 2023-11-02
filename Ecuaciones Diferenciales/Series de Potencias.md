# Series de Potencias
$$
f(x)=\sum_{n=0}^\infty C_n(x-a)^n
$$

El intervalo de convergencia se define como: $\left[R-a,R+a\right]$ en donde $R$ es el punto en donde converge la sumatoria.

## Series de Taylor
$$
e^x=\sum_{n=0}^\infty \frac{1}{n!}(x-a)^n
$$

$$
\cos x=\sum_{n=0}^\infty\frac{(-1)^n}{(2n)!}(x-a)^{2n}
$$

$$
\arctan x=\sum_{n=0}^\infty\frac{(-1)^n}{2n+1}x^{2n+1}
$$

![[Series de Potencias.png]]
## Prueba de la razón
Para saber si una serie converge se puede utilizar esta prueba. La sumatoria converge en $l\lt1$ si:
$$
l=\lim_{n\rightarrow\infty}\frac{C_{n+1}(x-a)^{n+1}}{C_n(x-a)^n}
$$

$$
l=|x-a|\lim_{x\rightarrow\infty}\frac{C_{n+1}}{C_n}
$$

## Ejemplos
Determine intervalo y radio de convergencia:
$$
\sum_{n=0}^\infty\frac{(x-3)^n}{2^nn}
$$

Pasando a la forma de prueba de la razón:
$$
C_n=\frac{1}{2^nn}
$$
$$
C_{n+1}=\frac{1}{2^{n+1}(n+1)}
$$

Entonces:
$$
l=|x-3|\lim_{x\rightarrow\infty}\frac{\frac{1}{2^{n+1}(n+1)}}{\frac{1}{2^nn}}
$$
$$
l=|x-3|\lim_{x\rightarrow\infty}\frac{2^nn}{2^{n+1}(n+1)}
$$
$$
l=\frac12|x-3|
$$

Ahora entonces se tiene:
$$
l\lt1\rightarrow\frac12|x-3|\lt1
$$

Lo que implica:
$$
|x-3|\lt2\rightarrow R=2
$$

Por lo que el intervalo es:
$$
x\in\left[1,5\right]
$$

---
Determine una representación en serie de potencias de:
$$
e^x\sin x
$$

Se obtiene la representación de cada una y se multiplica término por término:
$$
e^x\sin x=\left(1+x+\frac{x^2}{2}+\frac{x^3}{6}+\frac{x^4}{24}+\dots\right)\left(x-\frac{x^3}{6}+\frac{x^5}{120}+\dots\right)
$$

Mutliplicando algunos términos:
$$
e^x\sin x=x+x^2+\left(\frac16+\frac12\right)x^3+\left(\frac{1}{120}-\frac{1}{12}+\frac{1}{24}\right)x^5+\dots
$$
