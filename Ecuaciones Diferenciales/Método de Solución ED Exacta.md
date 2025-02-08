# Método de Solución E.D. Exacta

Una ecuación diferencial exacta tiene esta forma: $$ M(x,y)dx+N(x,y)dy=0 $$

Es exacta solo sí: $$ \\frac{\\delta M}{\\delta y}=\\frac{\\delta N}{\\delta x}
$$

Lo cual implica que: $$ f(x,y)=0 \\ Es\\ Solución\\ $$ Y además: $$
\\frac{\\delta f}{\\delta x} = M\
$$ $$ \\frac{\\delta f}{\\delta y}=N $$

Por lo que se debe: $$ \\int \\frac{\\delta f}{\\delta x}=f=\\int Mdx+g(y) $$ $$
\\frac{\\delta F}{\\delta y}=\\frac{\\delta}{\\delta y}\\int Mdx+g'(y)=N $$

Y ahora solo se despeja $g'(y)$ y se integra.

## Conversión de No exacta a Exacta

Se debe cumplir: $$ \\frac{M_y-N_x}{N}=f(x)\\rightarrow Factor\\
Integrante=e^{\\int \\frac{M_y-N_x}{N}dx} $$

Puede que se cumpla usando una función de y en lugar de x: $$
\\frac{N_x-M_y}{M}=f(y)\\rightarrow Factor\\
Integrante=e^{\\int\\frac{N_x-M_y}{M}dy} $$

Con esto se obtiene el factor integrante. Para resolverla simplemente se
multiplica este factor por toda la ecuación y se resuelve la ecuación
resultante, la cual se garantiza es exacta.

## Ejemplos

Resolver: $$ 2xydx +(x^2-1)dy=0 $$

Por lo que $M(x,y)=2xy$, así como $N(x,y)=x^2-1$. Además se cumple la regla de
las derivadas parciales, por lo que sí son exactas.

$$ \\int\\frac{\\delta f}{\\delta x}=\\int M\\ f(x,y)=\\int Mdx+g(y)=\\int
2xydx+g(y)=yx^2+g(y) $$

Ahora se necesita encontrar $g(y)$: $$ \\frac{\\delta f}{\\delta
y}=x^2+g'(y)=x^2-1\\ g'(y)=-1 $$

ahora se integra: $$ g(y)=-y+C $$

La solución sería entonces: $$ yx^2-y+C=0\\ yx^2-y=C $$

______________________________________________________________________

Resolver: $$ (e^{2y}-y\\cos xy)dx+(2xe^{2y}-x\\cos xy+2y)dy=0 $$ $$
\\frac{\\delta M}{dy} =2e^{2y}-(\\cos xy-yx\\sin xy) $$ $$ \\frac{\\delta N}{dx}
= 2e^{2y}-(\\cos xy -yx\\sin xy)\\ $$

Sí es exacta, por lo que se puede seguir con el algoritmo: $$ f(x,y)=\\int
Ndy+h(x)=\\int(2xe^{2y}-x\\cos xy+2y)dy+h(x) $$ $$ =xe^{2y}+y^2-x\\int\\cos xy\\
dy+h(x) $$ $$ =xe^{2y}+y^2-\\sin xy+h(x)\\ $$

Ahora se deriva para obtener $h'(x)$, se iguala a M y se despeja para la misma:
$$ f'=e^{2y}-y\\cos xy+h'(x)=M=e^{2y}-y\\cos xy\\ h'(x)=0 $$

Por lo tanto: $$ \\int h'(x)dx=h(x)=C $$

Y la función resultante es: $$ f(x,y)=xe^{2y}+y^2-\\sin xy+ C=0 $$ $$
I:(-\\infty, \\infty) $$

______________________________________________________________________

Resolver: $$ xy\\ dx+(2x^2+3y^2-20)dy=0 $$

Primero se verifica si es exacta: $$ \\frac{\\delta M}{\\delta y} = x $$ $$
\\frac{\\delta N}{\\delta x} = 4x $$

No es exacta, por lo que es necesario volverla exacta: $$
\\frac{M_y-N_x}{N}=f(x)\\rightarrow Factor\\ Integrante=e^{\\int
\\frac{M_y-N_x}{N}dx} $$ $$ \\int \\frac{x-4x}{2x^2+3y^2-20}dx\\ Esta\\ no\\
sirve $$ $$ \\frac{N_x-M_y}{M}=f(y)\\rightarrow Factor\\
Integrante=e^{\\int\\frac{N_x-M_y}{M}dy} $$ $$ \\int
\\frac{4x-x}{xy}dy=\\int\\frac{3}{y}dy=3\\ln y+C\\ Esta\\ sí\\ sirve $$

Por lo que el factor integrante es: $$ e^{3\\ln y}=y^3 $$

Entonces: $$ y^3( xy\\ dx+(2x^2+3y^2-20)dy=0 ) $$ $$
xy^4dx+(2x^2y^3+3y^5-20y^3)dy=0 $$

Esta ecuación ya es exacta, por lo que se puede seguir con el algoritmo
anterior: $$ \\int Ndy+h(x)=\\int 2x^2y^3+3y^5-20y^3dy+h(x) $$ $$
f(x,y)=\\frac{x^2y^4}{2}+\\frac{y^6}{2}-5y^4+h(x) $$

Se encuentra $h(x)$: $$ \\frac{\\delta f}{\\delta x}=xy^4+h'(x)=M=xy^4 $$ $$
h'(x)=0 $$ $$ \\int h'(x)dx=C $$

Entonces la solución es: $$ f(x,y)=\\frac 12 (x^2y^4+y^6)-5y^4+C $$
