# Álgebra Relacional
Si se entiende álgebra relacional se facilita un poco más el hacer queries.

## Proyección ($\pi$): SELECT
Produce una nueva relación que contiene un subconjunto de los atributos de la relación original.

Ejemplo: Si se tiene una relación $R(A,B,C,D)$ entonces $\pi_{A,B}(R)$ es una relación que contiene todos los conjuntos de $R$ pero solamente con $A,B$.

## Selección ($\sigma$): WHERE
Produce una nueva relación con un subconjunto de las tuplas de la relación original con a quellas que cumplan determinada condición.

La operación se denota $\sigma_{length\ge100}(R)$ en donde $length\ge100$ es la condición de selección.

## Producto Cartesiano ($\times$)

## Junta Natural ($\bowtie$): JOIN
Join sobre atributos comunes.

## Junta Theta ($\bowtie_\theta$): JOIN ON
Join sobre una condición particular $\theta$. Por ejemplo si se tiene una relación $U$ y otra $V$ entonces:
$$
U\bowtie_{A\lt D}V
$$

Nos dice que vamos a hacer un join en donde $U.A \lt V.D$, la relación resultado tiene todas las columnas de ambas relaciones, es decir $U.A,B$

## Renombrar ($\rho$): AS
Renombra una relación y sus atributos, se usa para desambiguar self joins ($R\bowtie R$). Opcionalmente puede renombrar atributos:
$$
\rho_{S(A_1,A_2,...,A_n)}(R)
$$

La cual renombraría la relación a $S$ y además los atributos a los nombres dentro del paréntesis según el orden en el que está definido en $R$.

