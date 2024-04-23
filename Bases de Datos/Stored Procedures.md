# Stored Procedures y Funciones
Objetos de PostgreSQL que permiten encapsular código y reutilizarlo alrededor de la base de datos.

Para postgres las funciones retornan valores, mientras que los stored procedures no.


## Stores Procedures
Realizar acciones sin retornar resultado: Procesar grandes cantidades de tuplas.

Retornar uno o más escalares como OUT parameters.

Retornar uno o más result sets: reportes.

Ventajas:
- Reducir la cantidad de round-trips entre aplicación y base de datos.
- Mejorar performance porque las funciones son pre-compiladas y almacenadas en el DBMS.
- Reutilización de lógica entre múltiples aplicaciones.

Desventajas:
- Versionamiento.
- Actualización.
- Portabilidad.
