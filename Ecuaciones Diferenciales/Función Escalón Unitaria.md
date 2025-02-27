# Función Escalón Unitaria

$$ U(t-a)={^{0,\\ 0\\le t\\lt a}\_{1,\\ t\\ge a} $$

Esta función se vuelve 1 a partir del valor de a.

Si se tiene una función $f(t)$ y se multiplica por $U(t-a)$ entonces a partir de
a iniciará la función $f(t)$.

Esta función se utiliza principalmente para convertir funciones definidas por
partes a funciones de una sola línea, expresadas en términos de funciones
escalones unitarias.

Las \[\[Transformadas de Laplace\]\] para esta función son: $$
L{U(t-a)}=\\frac{e^{-as}}{s} $$ $$ L{g(t)U(t-a)}=e^{-as}L{g(t+a)} $$

La función inversa de $U$ se define como: $$ U^{-1}(t-a)=1-U(t-a) $$

Estas funciones se pueden combinar (con sumas, restas y multiplicaciones) para
descubrir ecuaciones de gráficas de la siguiente forma:

!\[\[Función Escalón Unitaria-1.jpeg\]\] !\[\[Función Escalón
Unitaria-2.jpeg\]\]
