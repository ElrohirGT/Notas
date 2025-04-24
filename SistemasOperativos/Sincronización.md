# Sincronización

Concurrencia - Interrupción o traslape de procesos.

El acceso concurrente a los datos puede resultar en compromisos a la integridad
de la información, a esto le llamamos inconsistencias.

El OS es el principal encargado de coordinar el uso de recursos.

## Race conditions

Es una situación no deseada en la que un dispositivo o sistema trata de realizar
2 o más operaciones al mismo tiempo pero que por naturaleza debe ser en orden
específico.

**Definición aplicada en computación:**

Es cuando 2 o más procesos o threads tratan de acceder al mismo recurso al mismo
tiempo.

**Informal**

- Críticos: Cuando se introduce un comportamiento inesperado o bug.
- No Críticos: Son todos los que no son críticos xD. No hay ejemplos de estos.

**Formal**

- Read-modify-write: 2 procesos que leen un valor y escriben de regreso uno
  nuevo.
- Check-then-act: 2 procesos que chequean un valor y sobre ese valor tomar una
  decisión.

## Clases de interacciones entre procesos

| Degree of Awareness                          | Relationship                | Influence that one process has on another                                          | Potential Problems                                                |
| -------------------------------------------- | --------------------------- | ---------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| Process unaware of each other                | Competition                 | \* Results of one process are independent of actions of others. Timing may affect. | No se de Mutual Exclusion. Deadlocks. Starvation.                 |
| Process indirectly aware (Shared objects)    | Cooperation by sharing      | Results of one process may affect on others, timing may affect.                    | No se de Mutual Exclusion. Deadlocks. Starvation. Data Coherence. |
| Process directly aware (Direct comunication) | Cooperation by comunication | Results of one process depend on information of others.                            | Deadlocks. Starvation.                                            |
