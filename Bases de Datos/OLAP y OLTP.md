# OLAP / OLTP
* Online Transaction Procesing (OLTP): Generalmente son más cortas en duración y procesamiento.
* On-Line Analytical Procesing (OLAP): Generalmente tienen una duración mucho más larga pues se busca analizar datos.

Generalmente las bases de datos de tipo OLAP (los warehouse) juntan datos de varias bases de datos de tipo OLTP diariamente, semanalmente o sobre alguna cantidad de tiempo para su futuro análisis. Puede que incluso se dividan según reglas de negocio en Datamarts, como lo serían por ejemplo una OLAP de solamente ventas, otra de productos de inventario, etc.
