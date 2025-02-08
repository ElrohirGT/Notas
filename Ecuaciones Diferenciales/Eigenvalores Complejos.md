# Eigenvalores Complejos

$$ \\lambda_1,\\lambda_2=\\alpha \\pm i\\beta $$

El vector solución será: $$ \\vec{x}=C_1\\vec{x_1}+C_2\\vec{x_2} $$

En donde: $$ \\vec{x_1}=\[\\vec B_1\\cos\\beta t-\\vec B_2\\sin\\beta
t\]e^{\\alpha t} $$ $$ \\vec{x_2}=\[\\vec B_2\\cos\\beta t+\\vec B_1\\sin\\beta
t\]e^{\\alpha t} $$

El vector $\\vec B$ se define como: $$ \\vec B_1=parte\\ real\\ \\vec k $$ $$
\\vec B_2=parte\\ imaginaria\\ \\vec k $$

## Ejemplos

Resolver: $$ \\vec X'= \\begin{bmatrix} 2 & 8\\ -1 & -2 \\end{bmatrix} \\vec X
$$

Primero se obtienen los eigenvalores: $$ det(\\vec A-\\lambda\\vec I)=0 $$ $$
(2-\\lambda)(-1)(2+\\lambda)+8=0 $$ $$ (-1)(4-\\lambda^2)+8=0 $$ $$
-4+\\lambda^2+8=0 $$ $$ \\lambda=\\sqrt{-4}=\\pm 2i $$

Luego se obtiene el vector $\\vec k$: $$ (2-i2)k_1+8k_2=0 $$ $$
-k_1-2k_2-i2k_2=0 $$

Por lo que: $$ k_1=-2k_2-i2k_2 $$

Ahora podemos suponer el valor de $k_2$: $$ Si\\ k_2=-1\\rightarrow\\vec k=
\\begin{bmatrix}2+i2\\-1\\end{bmatrix} $$

Podemos encontrar $\\vec B$ entonces: $$ \\vec
B_1=\\begin{bmatrix}2\\-1\\end{bmatrix} $$ $$ \\vec
B_2=\\begin{bmatrix}i2\\0\\end{bmatrix} $$

Expresando la solución final entonces: $$ \\vec
X=C_1\\left(\\begin{bmatrix}2\\-1\\end{bmatrix}\\cos
2t-\\begin{bmatrix}i2\\0\\end{bmatrix}\\sin
2t\\right)+C_2\\left(\\begin{bmatrix}i2\\0\\end{bmatrix}\\cos
2t+\\begin{bmatrix}2\\-1\\end{bmatrix}\\sin2t\\right) $$
