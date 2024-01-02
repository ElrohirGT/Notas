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

Es posible que algunas sumatorias nos queden con términos $C_n$ desconocidos, por lo que hay que considerar los casos en donde ese $C_n=0$, lo cual nos da el $y_n$. El $y$ total será la suma de todos los $y_n$.

## Método de Forbenius
Se utiliza cuando se tienen puntos singulares, es decir puntos en donde la ecuación se indefine si se escribe en su forma estándar.
$$
y=\sum^\infty_{n=0}C_nx^{n+r}
$$
$$
y'=\sum^\infty_{n=0}(n+r)C_nx^{n+r-1}
$$
$$
y''=\sum^\infty_{n=0}(n+r)(n+r-1)C_nx^{n+r-2}
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

---
Resolver
$$
y''-xy=0
$$

En torno al punto $x_0=0$

Para resolverla, se considera que el punto $x_0=a=0$.

Entonces:
$$
y=\sum_{n=0}^\infty C_nx^n
$$
$$
y'=\sum_{n=1}^\infty nC_nx^{n-1}
$$
$$
y''=\sum_{n=2}^\infty n(n-1)C_nx^{n-2}
$$

Por lo que reescribiendo:
$$
\sum_{n=2}^\infty n(n-1)C_nx^{n-2}-x\sum_{n=0}^\infty C_nx^n=0
$$
$$
\sum_{n=2}^\infty n(n-1)C_nx^{n-2}-\sum_{n=0}^\infty C_nx^{n+1}=0
$$

Primero, las sumatorias no empiezan a sumar con el mismo término en $x$. Pues $n-2=2-2=0$ mientras que $n+1=0+1=1$. Así que podemos simplemente sacar el primer término de la sumatoria con $n=2$ para que empiece con el mismo exponente que la segunda sumatoria.
$$
2C_2+\sum_{n=3}^\infty n(n-1)C_nx^{n-2}-\sum_{n=0}^\infty C_nx^{n+1}=0
$$

Ahora podemos unirlas, encontramos las $k$'s:
$$
k=n-2=1\therefore n=k+2
$$
$$
k=n+1=1\therefore n=k-1
$$

Reescribiendo en términos de $k$:
$$
2C_2+\sum_{k=1}^\infty (k+2)(k+1)C_{k+2}x^k-\sum_{k=1}^\infty C_{k-1}x^k=0
$$

Uniendo las sumatorias:
$$
2C_2+\sum_{k=1}^\infty\left[(k+2)(k+1)C_{k+2}x^k-C_{k-1}x^k\right]=0
$$
$$
2C_2+\sum_{k=1}^\infty\left[(k+2)(k+1)C_{k+2}-C_{k-1}\right]x^k=0
$$

Para obtener la ecuación indical, podemos suponer que $C_2=0$. Entonces:
$$
(k+2)(k+1)C_{k+2}-C_{k-1}=0
$$
$$
C_{k+2}=\frac{C_{k-1}}{(k+2)(k+1)}
$$

Se utiliza este despeje pues $C_{k+2}$ está después de $C_{k-1}$ por lo que todos los términos estarán definidos en base de alguna constante $C_n$ base.

Luego se factoriza para esta constante. Es posible que hayan dos por lo que se debe factorizar todos los términos de cada una de ellas y representar la solución con varias $y$'s como constantes $C_n$ hayan en común.

---
Resolver
$$
3xy''+y'-y=0
$$

Centrado en $x_0=0$

Si la pasamos a forma estándar:
$$
y''+\frac{y'}{3x}-\frac{y}{3x}=0
$$

Esta solo se puede resolver usando serie de potencias. El punto $x_0$ hace que la función se indetermine. Por lo que se utiliza el método de Frobenius.

Por lo que sustituyendo:
$$
3x\sum^\infty_{n=0}(n+r)(n+r-1)C_nx^{n+r-2}+\sum^\infty_{n=0}(n+r)C_nx^{n+r-1}+\sum^\infty_{n=0}C_nx^{n+r}=0
$$
$$
\sum^\infty_{n=0}(n+r)(3n+3r-3)C_nx^{n+r-1}+\sum^\infty_{n=0}(n+r)C_nx^{n+r-1}+\sum^\infty_{n=0}C_nx^{n+r}=0
$$
$$
\sum^\infty_{n=0}(n+r)[3n+3r-3+1]C_nx^{n+r-1}+\sum^\infty_{n=0}C_nx^{n+r}=0
$$
$$
x^r\left[\sum^\infty_{n=0}(n+r)[3n+3r-2]C_nx^{n-1}+\sum^\infty_{n=0}C_nx^{n}\right]=0
$$

Ahora debemos unir las sumatorias, para esto necesitamos que las $k$'s sean iguales, así que vamos a sacar un término:
$$
x^r\left[r(3r-2)C_0x^{-1}+\sum^\infty_{n=1}(n+r)[3n+3r-2]C_nx^{n-1}+\sum^\infty_{n=0}C_nx^{n}\right]=0
$$

Ahora que sus $k$'s son iguales se pueden sustituir:
$$
k=n-1=0\rightarrow n=k+1
$$
$$
k=n=0
$$
$$
x^r\left[r(3r-2)C_0x^{-1}+\sum^\infty_{k=0}[(k+r+1)(3k+3+3r-2)C_{k+1}-C_k]x^k\right]=0
$$
$$
x^r\left[r(3r-2)C_0x^{-1}+\sum^\infty_{k=0}[(k+r+1)(3k+3r-1)C_{k+1}-C_k]x^k\right]=0
$$

Ahora debemos suponer qué pasaría si los términos dentro del corchete son iguales a 0, entonces primero tenemos:
$$
r(3r-2)=0\therefore r_1=\frac23\ y\ r_2=0
$$
$$
C_{k+1}=\frac{C_k}{(k+r+1)(3k+3r+1)}
$$

Ahora se evalúa la sumatoria, el $y_1$ depende de $r_1$ y el $y_2$ depende de $r_2$.
