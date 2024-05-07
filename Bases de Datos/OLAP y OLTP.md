# OLAP / OLTP
* Online Transaction Procesing (OLTP): Generalmente son más cortas en duración y procesamiento.
* On-Line Analytical Procesing (OLAP): Generalmente tienen una duración mucho más larga pues se busca analizar datos.

Generalmente las bases de datos de tipo OLAP (los warehouse) juntan datos de varias bases de datos de tipo OLTP diariamente, semanalmente o sobre alguna cantidad de tiempo para su futuro análisis. Puede que incluso se dividan según reglas de negocio en Datamarts, como lo serían por ejemplo una OLAP de solamente ventas, otra de productos de inventario, etc.

Un datawarehouse es un almacén de datos mientras que los datamarts son los estántes dentro del almacén.

* ETL ( Extraction, Transformation, Loading)

## Modelación Analítica
- Tabla de hechos (fact table):
    - Actualizada frecuentemente.
    - Usualmente con transacciones append o un replace completo.
    - Tamaño grande.
    - Ejemplos: Transacciones, facturas, asignaciones, visitas a páginas web.

- Tablas de dimensiones.
    - No actualizadas frecuentemente.
    - Potencialmente desnormalizadas.
    - No tan grandes.
    - Ejemplos: Maestros de datos / catálogos.

## Cubos OLAP
Los cubos se montan en modelos estrella creados con las reglas anteriores. Un cubo es una abstracción que nos permite imaginar cómo se llevaría a cabo la tarea de análisis. Realmente puede tener más de 3 dimensiones.

## Operaciones en OLAP

* Slice: Obtiene una rebanada del cubo OLAP en base a una característica.
* Dice: Obtiene un cubo más pequeño del cubo OLAP.
* Drill Down: Cuando se hace un drill down se entiende como descender a una forma más específica de la dimensión.
* Roll Up: Igual que el Drill Down solo que en la dirección opuesta, es decir una forma más general de la dimensión.
* Pivot: Intercambia de lugar las dimensiones.

## Cube
PostgreSQL ofrece una función [cube](https://www.postgresql.org/docs/current/cube.html) la cual se puede utilizar para computar toda la data necesaria para crear un OLAP en base a un query.
