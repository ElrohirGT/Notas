### Problema de Densidad Variable
![[Semicírculo con densidad de carga variable.png]]
Encuentre la fuerza que experimenta la carga.
$$
d\vec{E}=\frac{dQ}{4\pi\epsilon_0R^2}\cdot (-\sin\theta\vec{i}-\cos\theta\vec{j})\\
$$

Encontrando $dQ$:
$$
\lambda=\lambda_0\cos\theta=\frac{dQ}{Rd\theta}\\
dQ=\lambda_0R\cos\theta d\theta
$$

Ahora encontrando $\vec{E}$:
$$
\vec{E}=-\frac{\lambda_0 R}{4\pi\epsilon_0 R^2}\left[\int_{-\frac \pi2}^{\frac \pi2}\sin\theta\cos\theta d\theta\vec{i}+\int_{-\frac\pi2}^{\frac\pi2}\cos^2\theta d\theta\vec{j}\right]\\
\vec{E}=-\frac{\lambda_0}{2\pi\epsilon_0 R}\vec{j}\int_{-\frac\pi2}^{\frac\pi2}\cos^2\theta d\theta\\
\vec{E}=-\frac{\lambda_0}{8\epsilon_0 R}\vec{j}
$$

Para obtener $\lambda_0$ se puede integrar $dQ$ ya que nos dan la carga total, es decir $Q$:
$$
dQ=\lambda_0R\cos\theta d\theta\\
Q=\int\lambda_0R\cos\theta d\theta\\
\lambda_0=\frac{Q}{2R}
$$

Ahora se calcula la fuerza que ejerce el campo sobre la partícula:
$$
\vec{E}=-\frac{\frac{Q}{2R}}{8\epsilon_0 R}\vec{j}\\
\vec{F}=q\vec{E}=-0.706N\vec{j}
$$

### Problema de Plano Infinito
![[Problema de Plano Infinito.png]]

Se realizan de la misma forma que los problemas de MRUV, solamente que se necesita despejar la aceleración de la fuerza que ejerce el campo sobe la partícula:
$$
\vec{F}=q\vec{E}=ma\\
a=\frac{q\vec{E}}{m}
$$

En caso sea un electrón/protón, la carga se representa con $e$ y se le llama la carga fundamental.
