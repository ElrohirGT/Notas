# Fuerza electromagnética

Es una de las 4 \[\[Fuerzas del Universo\]\]. Se puede utilizar la \[\[Ley de
Coulomb\]\] para expresar el campo electromagnético, pero una forma alternativa
es la \[\[Ley de Gauss\]\].

## Campo Eléctrico

$$ \\vec{E}=\\frac{\\vec{F}}{q}=\\frac{Q}{4\\pi\\epsilon_0r^2} $$ $$
\[E\]=\\frac{N}{C}=\\frac{V}{m} $$

Un dipolo es un campo que tiene dos cargas puntuales con cargas de signo
distinto.

### Ejemplos

!\[\[Ejemplo de Campos.png\]\]

## Densidad de Carga

Representa qué tanta carga hay en una cierta cantidad de largo, area o volumen

1 dimensión: $$ \\lambda = \\frac{dq}{dl} $$

2 dimensiones: $$ \\sigma = \\frac{dq}{dA} $$

3 dimensiones: $$ \\rho = \\frac{dq}{dV} $$

## Distribuciones continuas de carga

### Línea

$$ d\\vec{E} =
\\frac{1}{\\pi\\epsilon_0}\\cdot\\frac{dQ}{(x^2+y^2)}\\cdot\\frac{x\\vec{i}-y\\vec{j}}{\\sqrt{x^2+y^2}}
$$

dQ: No la conocemos, pero la podemos calcular usando la densidad de carga: $$
\\lambda=\\frac{Q}{L}=\\frac{dQ}{dy} $$ $$ dQ=\\frac{Q}{L}\\cdot dy $$

Por lo tanto $d\\vec{E}$: $$ \\int d\\vec{E}=\\frac{Q}{4\\pi\\epsilon_0
L}\\int\\frac{x\\vec{i}-y\\vec{j}}{(x^2+y^2)^{\\frac{3}{2}}}dy $$ $$
\\frac{Q}{4\\pi\\epsilon_0
L}\\left\[x\\vec{i}\\int\_{-\\frac{L}{2}}^{\\frac{L}{2}}\\frac{dy}{(x^2+y^2)^{\\frac{3}{2}}}-\\vec{j}\\int\_{-\\frac{L}{2}}^{\\frac{L}{2}}\\frac{ydy}{(x^2+y^2)^{\\frac{3}{2}}}\\right\]
$$ Como la función dentro de la integral de $\\vec{j}$ es impar, esa integral es
0, pues sus límites se cancelan.

La función dentro de la integral de x es par. Por lo que esa se puede convertir
en lo siguiente: $$ \\frac{2Qx\\vec{i}}{4\\pi\\epsilon_0
L}\\int_0^{\\frac{L}{2}}\\frac{dy}{(x^2+y^2)^\\frac32}\\ $$

Esta integral se resuelve usando triángulo y se obtiene: $$
\\vec{E}=\\frac{Q\\vec{i}}{2x\\pi\\epsilon_0
L}\\left\[\\frac{y}{\\sqrt{x^2+y^2}}\\right\]\_{0}^{\\frac{L}{2}} $$ $$
\\vec{E}=\\frac{Q\\vec{i}}{2x\\pi\\epsilon_0 L}\\cdot\\frac{\\frac
L2}{\\sqrt{x^2+(\\frac L2)^2}} $$ $$ \\vec{E}=\\frac{Q}{4\\pi\\epsilon_0
x\\sqrt{x^2+(\\frac L2)^2}}\\cdot\\vec{i} $$

### Línea de carga infinita

Igual a la anterior pero se reemplaza $Q=\\lambda L$. $$
\\vec{E}=\\frac{\\lambda L}{4\\pi\\epsilon_0 x\\sqrt{x^2+(\\frac
L2)^2}}\\cdot\\vec{i} $$

Luego sacamos el límite cuando L tiene a infinito: $$
\\vec{E}=\\frac{\\lambda}{4\\pi\\epsilon_0
x}\\cdot\\lim\_{L->\\infty}\\frac{L}{\\sqrt{x^2}{+(\\frac L2)^2}}\\cdot\\vec{i}
$$ $$ \\vec{E}=\\frac{\\lambda}{2\\pi\\epsilon_0 x} $$

### Aro delgado con carga uniforme

La carga se encuentra en su eje de simetría. Es importante que sea en su eje
pues todas las demás fuerzas que aplican en otros ejes se cancelan. !\[\[Carga
en aro delgado.png\]\]

$$ d\\vec{E}=dE_x\\vec{i}\\
d\\vec{E}=\\frac{dQ\\cos\\theta}{4\\pi\\epsilon_0(x^2+R^2)}=\\frac{dQ\\cdot
x}{4\\pi\\epsilon_0(x^2+R^2)^{\\frac 32}}\\cdot\\vec{i}\\ $$ Calculando la
densidad lineal para obtener dQ. $$ \\lambda=\\frac{Q}{2\\pi
R}=\\frac{dQ}{R\\cdot d\\phi} $$ $$ dQ=\\frac{Qd\\phi}{2\\pi} $$ Entonces: $$
d\\vec{E}=\\frac{\\frac{Qd\\phi}{2\\pi}\\cdot
x}{4\\pi\\epsilon_0(x^2+R^2)^{\\frac 32}}\\cdot\\vec{i} $$ $$
\\vec{E}=\\frac{Q\\cdot x}{8\\pi^2\\epsilon_0(x^2+R^2)^{\\frac
32}}\\int_0^{2pi}d\\phi $$ $$ \\vec{E}=\\frac{Q\\cdot
x}{8\\pi^2\\epsilon_0(x^2+R^2)^{\\frac 32}}\\cdot(2\\pi) $$ $$
\\vec{E}=\\frac{Q\\cdot x}{4\\pi\\epsilon_0(x^2+R^2)^{\\frac 32}}\\vec{i} $$

### Disco delgado con carga uniforme

Es sólido y circular. Se obtiene a partir de la fórmula para el aro delgado,
pues un disco son aros infinitos expandiendose para formar un aro. $$
d\\vec{E}=\\frac{dQ\\cdot x}{4\\pi\\epsilon_0(x^2+y^2)^{\\frac 32}} $$ Encontrar
la densidad de carga en base al área: $$ \\sigma=\\frac{Q}{\\pi
R^2}=\\frac{dQ}{2\\pi ydy} $$ $$ dQ=\\frac{2Qydy}{R^2} $$

Entonces: $$ \\vec{E}=\\frac{Q\\cdot x}{4\\pi\\epsilon_0
R^2}\\int\\frac{2ydy}{(x^2+y^2)^{\\frac 32}} $$ $$
\\vec{E}=\\frac{Q}{2\\pi\\epsilon_0
R^2}\\left\[1-\\frac{x}{\\sqrt{x^2+R^2}}\\right\]\\cdot\\vec{i} $$

### Plano infinito cargado

Un plano infinito cargado se obtiene de la fórmula del disco delgado al suponer
que $R$ es mucho mayor que $x$. $$
\\vec{E}=\\frac{\\sigma}{2\\epsilon_0}\\vec{i} $$

### Cono circular recto sólido

Con carga uniforme. !\[\[Campo de un Cono Sólido.png\]\] Se obtiene al formar
los discos que forman al cono. $$ d\\vec{E}=\\frac{dQ}{2\\pi\\epsilon_0
y^2}\\left\[1-\\frac{H-x+d}{\\sqrt{(H-x+d)^2+y^2}}\\right\] $$

Para reemplazar $dQ$ se necesita un diferencial de densidad para volumen: $$
\\rho=\\frac{3Q}{\\pi R^2H}=\\frac{dQ}{\\pi y^2dx} $$ $$
dQ=\\frac{3Qy^2dx}{R^2H} $$

Reemplazando: $$ d\\vec{E}=\\frac{3Qdx}{2\\pi\\epsilon_0
R^2H}\\left\[1-\\frac{H-x+d}{\\sqrt{(H-x+d)^2+(R-\\frac RH x)^2}}\\right\] $$ $$
\\vec{E}=\\frac{3Q}{2\\pi\\epsilon_0
R^2H}\\int\\left\[1-\\frac{H-x+d}{\\sqrt{(H-x+d)^2+(R-\\frac RH
x)^2}}\\right\]dx $$

Algunos ejemplos de problemas de aplicación se pueden ver en la sección
\[\[Problemas electromagnetismo\]\]
