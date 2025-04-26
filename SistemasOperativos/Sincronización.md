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

## Deadlock

Dos o más procesos se bloquean entre sí esperando por recursos/resultados.

Condiciones para un deadlock:

1. Mutual Exclusion: 2 o más procesos son no compartibles (1 acceso a la vez).
1. Hold and wait: Un proceso está ocupando un recurso y esperando otro.
1. Non Preemption: Un recurso no puede ser quitado de un proceso a menos que el
   proceso lo suelte.
1. Circular-wait: Un conjunto de procesos esperan uno al otro de forma circular.

Para evitar deadklocks, no podemos eliminar el primero y el cuarto, pero para el
dos y el tres podemos:

- Hold and wait:
  - Alojamiento o reserva.
  - Puede incurrir en starvation.
- Non Preemption:
  - Sistema de priorización.

Banker's deadlock avoidance algorithm.

### ¿Cómo salimos del deadlock?

El sistema debe salir del deadlock.

1. Resource preemption.
1. Process termination.
   - Abortar todos los procesos que están en el deadlock.
   - Abortar uno a la vez hasta que se salga del deadlock.

## Starvation

Starvation o también llamado "bloqueo indefinido" es cuando un proceso espera
indefinidamente. Muy relacionado a la sección crítica.

Estrategias para evitarlo:

1. Criterio del aging.
1. Uso de algoritmos de calendarización como el multi-level feedback queue.
1. Aplicar algún tipo de algoritmo de priority.

## Critical Section Problem

Es un segmento de código que está ejecutando acciones que pueden ser
"compartidas" por otros procesos.

CSP: ¿Cómo nos aseguramos que solamente un proceso a la vez esté ejecutando su
sección crítica?

Reglas o pasos a seguir:

- Cada proceso debe pedir permiso para entrar a su sección crítica.
- Se hace entrando a lo que llamamos entry section.
- Procedemos a la sección crítica.
- Luego pasamos a una sección de salida.
- Por último, la sección restante.

Requerimientos:

1. **Exclusión Mutua**: Significa que si un proceso está ejecutando su sección
   crítica, ningún otro proceso lo puede hacer.
1. **Progreso**: El siguiente proceso a ejecutar su critical section se elige
   entre los que no están en su remainder section. La selección no puede
   tardarse indefinidamente.
1. **Espera Limitada**: Un proceso no puede esperar indefinidamente para entrar
   a su critical section.
