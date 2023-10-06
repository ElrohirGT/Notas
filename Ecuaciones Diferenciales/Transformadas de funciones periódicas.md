# Transformada de funciones periódicas
El período es $T$.

$$
L\{f(t)\}=\frac{1}{1-e^{-sT}}\int_0^Te^{-st}f(t)dt
$$

## Función Impulso
También llamada delta de Dirac.

$$
\delta(t-t_0)=\{^{\infty,\ t=t_0}_{0,\ t\ne t_0}
$$

$$
L\{\delta(t-t_0)\}=e^{-st_0}
$$

## Ejemplos
Resolver:
$$
y''+y=4\delta(t-4\pi),\ y(0)=1,\ y(0)=0
$$

Aplicando la transformada:
$$
s^2Y(s)-sy(0)-y'(0)+Y(s)=4e^{-4\pi s}
$$

Despejamos $Y(s)$:
$$
Y(s)(s^2+1)=4e^{-4\pi s}+s
$$
$$
Y(s)=\frac{4e^{-4\pi s}+s}{s^2+1}
$$

Ahora destransformando:
$$
Y(t)=\cos t+4\sin(t-4\pi)\cdot U(t-4\pi)
$$
