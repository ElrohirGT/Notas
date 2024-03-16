# Índices
Buscan crear checkpoints desde los cuales un query pueda empezar a buscar dentro de la base de datos.

Es una estructura de datos persistente almacenada que mapea datos de búsqueda hacia un conjunto de tuplas en una relación.

Tienen varias formas en los que los DBMs los utilizan:
- Hash: Usada generalmente para datos de texto.
- B+ Tree: Usada generalmente para datos numéricos.

Los índices también se pueden crear sobre varios campos al mismo tiempo.

**Covering Index**: Se dice que un índice es **covering** cuando un query en específico se puede responder solamente con la data del índice sin tener nunca que ir a traer data de la tabla.

**Selectividad**: Un campo cuyos datos casi no varían en una relación en específico son campos con baja selectividad.

**Condiciones Sargables (Search ARGumentABLE)**: Un query no sargable es uno que no utiliza el query:
```sql
SELECT * FROM PERSONA WHERE EXTRACT (YEAR FROM fecha_nacimiento) = 1990;
```

Esto se debe a que, aunque se tiene un índice sobre `fecha_nacimiento` no se tiene un índice sobre `EXTRACT (YEAR FROM fecha_nacimiento)`. Algunos DBMs sí dejan crear índices sobre el resultado de funciones SQL, estos índices tieden a ser más frágiles.

Usar varios índices con varios campos no es igual de rápido que usar un solo índice que abarque todos esos campos.
