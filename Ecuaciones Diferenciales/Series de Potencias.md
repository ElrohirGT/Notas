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
l=|x-a|\lim_{n\rightarrow\infty}\frac{C_{n+1}}{C_n}
$$

## Resolución de Ecuaciones Diferenciales
$$
\sum_{n=2}^\infty n(n-1)C_nx^{n-1}-\sum_{n=0}^\infty C_nx^{n+1}
$$

Para unir sumatorias se debe tener el mismo índice y empezar en la misma potencia.
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
l=|x-3|\lim_{n\rightarrow\infty}\frac{\frac{1}{2^{n+1}(n+1)}}{\frac{1}{2^nn}}
$$
$$
l=|x-3|\lim_{n\rightarrow\infty}\frac{2^nn}{2^{n+1}(n+1)}
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
---
Resolver
$$
y'+y=0
$$
usando
$$
y=\sum_{n=0}^\infty C_nx^n
$$
Primero se sustituye $y$ en la ecuación diferencial:
$$
y=\sum_{n=0}^\infty C_nx^n
$$
$$
y'=\sum_{n=1}^\infty nC_nx^{n-1}
$$
$y'$ Inicia en 1 debido a que el exponente de las $x$'s debe ser igual.
$$
0=\sum_{n=0}^\infty C_nx^n+\sum_{n=1}^\infty nC_nx^{n-1}
$$
Ahora se encuentran los $k$'s para poder juntar toda la ecuación en una sola sumatoria:
Primero se obtiene el $k$ de la sumatoria que inicia en $n=0$
$$
k=n
$$
$$
k=0
$$
Ahora se realiza el mismo procedimiento con la segunda sumatoria:
$$
k=n-1
$$
$$
k=1-1=0
$$
Como ambos $k$'s quedan iguales, entonces se encontraro los k's de forma correcta.

Ahora se reescriben las sumatorias en términos de $k$:
$$
0=\sum_{k=0}^\infty C_kx^k+\sum_{k=0}^\infty (k+1)C_{k+1}x^{k}
$$
Por lo que se puede reescribir en una sola sumatoria como:
$$
0=\sum_{k=0}^\infty\left[(k+1)C_{k+1}+C_k\right]x^k
$$
Ahora se puede obtener la ecuación indical, en este caso es:
$$
(k+1)C_{k+1}+C_k=0
$$
Despejando para $C_{k+1}$:
$$
C_{k+1}=-\frac{C_k}{k+1}
$$
Ahora simplemente se sustituye en la ecuación $y=C_0x^0+C_1x'+\dots$
$$
y=C_0-C_0x+C_0\frac{x^2}{2}-C_0\frac{x^3}{6}+C_0\frac{x^4}{24}+\dots
$$