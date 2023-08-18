# Método de Variación de Parámetros
$$
a_2y''+a_1y'+a_0y=g(x)
$$

En donde todos los $a_n$ son constantes.

1. La llevamos a su forma estándar.
$$
y''+P(x)y'+a=f(x)
$$

2. Encontrar la $y_c$ como siempre.

3. Se definen:
$$
W=
\begin{vmatrix}
y_1 & y_2\\
y_1' & y_2'
\end{vmatrix};\ 
W_1=
\begin{vmatrix}
0 & y_2\\
f(x) & y_2'
\end{vmatrix};\ 
W_2=
\begin{vmatrix}
y_1 & 0\\
y_1' & f(x)
\end{vmatrix}
$$

4. Se definen:
$$
u_1'=\frac{W_1}{W};\ u_2'=\frac{W_2}{W}
$$

5. Entonces:
$$
y_p=u_1y_1+u_2y_2
$$
$$
y=y_c+y_p
$$

El orden para saber como es $y_1$ y $y_2$ es:
* Polinomiales
* Exponenciales
* Trigonométricas (Coseno primero, seno después)

## Ejemplos
Resolver:
$$
y''-4y'+4y=(x+1)e^{2x}
$$

Como ya está en su forma estándar, se encuentra $y_c$.
$$
m^2-4m+4=0\therefore m_{1\ y\ 2}=2
$$

Entonces:
$$
y_c=C_1e^{2x}+C_2xe^{2x}
$$

Por lo que en el ejemplo:
$$
y_1=e^{2x};\ y_2=xe^{2x}
$$

Calculando las determinantes $W$'s:
$$
W=e^{2x}(2xe^{2x}+e^{2x})-2e^{2x}(xe^{2x})=e^{4x}
$$
$$
W_1=-xe^{2x}(x+1)e^{2x}=-(x^2+x)e^{4x}
$$
$$
W_2=e^{2x}(x+1)e^{2x}=(x+1)e^{4x}
$$

Ahora tenemos que calcular las $u'$s.
$$
u'_1=\frac{W_1}{W}=-x^2-x
$$
$$
u'_2=\frac{W_2}{W}=x+1
$$

Integrando:
$$
u_1=\int-x^2-xdx=-\frac{x^3}{3}-\frac{x^2}{2}
$$
$$
u_2=\int x+1dx=\frac{x^2}{2}+x
$$

Ahora se encuentra a $y_p$.
$$
y_p=\left(-\frac{x^3}{3}-\frac{x^2}{2}\right)\left(e^{2x}\right)+\left(\frac{x^2}{2}+x\right)(xe^{2x})
$$

Entonces:
$$
y=C_1e^{2x}+C_2xe^{2x}+\left(-\frac{x^3}{3}-\frac{x^2}{2}\right)\left(e^{2x}\right)+\left(\frac{x^2}{2}+x\right)(xe^{2x})
$$

---
Resolver:
$$
4y''+36=\csc 3x
$$

Se pone en forma estándar:
$$
y''+9y=\frac14\csc 3x
$$

Resolviendo para la homogénea:
$$
m^2+9=0\therefore m_{1\ y\ 2}=3i
$$

Entonces:
$$
y_c=C_1\cos 3x + C_2\sin 3x
$$

Siguiendo las reglas, tenemos que:
$$
y_1=\cos 3x;\ y_2=\sin 3x
$$

Ahora calculamos los $W$'s:
$$
W=3\cos^23x+3\sin^2 3x=3
$$
$$
W_1=-\sin 3x\left(\frac14 \csc 3x\right)=-\frac14
$$
$$
W_2=\cos 3x\left(\frac14 \csc 3x\right)=\frac14\frac{\cos 3x}{\sin 3x}
$$

Ahora las $u$'s:
$$
u_1'=\frac{W_1}{W}=-\frac{1}{12}\therefore u_1=\int-\frac{1}{12}dx=-\frac{1}{12}x
$$

$$
u_2'=\frac{W_2}{W}=\frac{1}{12}\frac{\cos 3x}{\sin 3x}\therefore u_2=\int\frac{1}{12}\frac{\cos 3x}{\sin 3x}dx=\frac{1}{36}\ln|\sin 3x|
$$

Por lo que ya solo se obtiene la y:
$$
y=C_1\cos 3x + C_2\sin 3x+\left(-\frac{x}{12}\right)\cos 3x+\left(\frac{1}{36}\ln|\sin 3x|\right)\sin 3x
$$
