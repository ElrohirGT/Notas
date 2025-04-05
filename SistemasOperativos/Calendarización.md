# Calendarización

La calendarización en general la vamos a definir como el proceso que se realiza
para decidir a qué proceso asignar un recurso. Entonces nuestro scheduler es el
encargado de seleccionar un proceso del conjunto de procesos disponibles en
memoria y asignarle el CPU.

Scheduling ocurre cuando:

1. Un proceso cambia de estado running a waiting.
1. Un proceso cambia de running a ready.
1. Un proceso cambia de waiting a ready.
1. Un proceso termina.

Se suele llevar a cabo en dos niveles distintos a largo y corto plazo.

## Calendarización a largo plazo (Long-term scheduling)

- La calendarización es llevada a cabo por el job scheduler el cual es parte del
  kernel.
- Este tipo de calendarización es principalmente característico de los sistemas
  batch. Es decir sistemas que trabajan sin intervención de un usuario.
- Este tipo de calendarizador decide qué procesos se van a la ready queue.

## Calendarización a corto/mediano plazo (Short-term scheduling)

- La calendarización es llevada a cabo por el CPU scheduler. Que es parte del
  Kernel
- Este tipo de calendarización es característico de cualquier sistema
  multitarea.
- Este calendarizador decide qué procesos en la `ready queue` de la memoria
  principal usan un procesador.
- Controla el número de procesos (grado de multiprogramación) que hay en memoria
  principal en la ready queue.

## Ambientes de Operación

- **Batch Systems**: Maximizar tareas completadas por tiempo y uso del
  procesador.
- **Sistemas Interactivos**: Minimizar tiempos de respuesta y proveer
  proporcionalidad. La proporcionalidad es el concepto que usamos para
  referirnos a la percepción subjetiva del tiempo que toma hacer diferentes
  tareas, según su complejidad. No es algo controlable como tal, pero podemos
  aprovechar la interactividad para retroalimentar al usuario del progreso o
  separar el proceso en tareas más pequeñas.
- **Sistemas de tiempo real**: Previsibilidad y cumplimiento de cotas para el
  tiempo de ejecución de tareas. Previsibilidad es el concepto que usamos para
  referirnos a la consistencia en el tiempo y costos que toma la ejecución de
  cada proceso.

## Comportamiento de Procesos

La ejecución de procesos suele alternar entre ejecución en CPU y esperar por I/O
(o espera de otro proceso).

Cuando un proceso es CPU Bound es porque los CPU burst son más largos que los
I/O bursts. Mientras que decir que un programa es I/O bound significa que los
bursts de I/O son más largos que los CPU bursts.

La mayoría de los bursts que tienen los procesos son cortos.

## Decisiones de Calendarización

Todo va a depender si las decisiones se toman cuando:

1. Un proceso termina y se bloquea. (Calendarización non-preemptive)
1. Cuando un proceso nuevo es creado o cuando ocurre una interrupción.
   (Calendarización preemptive)

Cuando decimos preemptive o no preemptive nos referimos que permite o no el
reemplazo.

**¿Cómo se toman estas decisiones?**

1. La idea es que todo sistema debe proveer una porción justa del CPU a cada
   proceso.
1. Las políticas del sistema deben ser cumplidas por el calendarizador.
1. Todas las partes del sistema se deben mantener ocupadas (en especial el CPU).
1. Se debe cumplir con los objetivos adicionales que dependen del ambiente de
   operación.

Con políticas nos referimos a qué se debe hacer y con mecanismos a cómo se lleva
a cabo.

## Criterios de Calendarizaión de CPU

1. **Tiempo de respuesta**: Este es el tiempo que transcurre desde que se somete
   una solicitud hasta que se recibe la primera respuesta del sistema. Queremos
   minimizarlo.
1. **Tiempo de completación**: Este es el tiempo que transcurre desde la
   solicitud de ejecución de un proceso hasta su terminación. Queremos
   minimizarlo.
1. **Previsibilidad**: La carga en el sistema no debería afectar el tiempo que
   toma completar una misma tarea. (Muy importante en OS de tiempo real).
1. **Uso del CPU**: Mantener al procesador tan ocupado como sea posible. La
   unidad de medida es porcentaje de tiempo que el procesador está computando.
   Queremos maximizarlo.
1. **Throughput**: Número de procesos completador por unidad de tiempo. Queremos
   maximizarlo.
1. **Tiempo de espera**: Tiempo que un proceso pasa en la ready queue. La idea
   es que ningún proceso debería de sufrir de lo que conocemos como starvation.
   Starvation sucede cuando un proceso pasa un tiempo indefinido en la ready
   queue por priorización de otros procesos. Queremos minimizarlo.

## First-Come, First Served (FCFS)

- Los procesos en este algoritmo siguen una cola FIFO.
- Todos los procesos reciben el procesador eventualmente (si ninguno se bloquea
  indefinindamente).
- Favorece a procesos largos por otorgarles el procesador el tiempo que quieran.
- Favorece a los procesos CPU bound porque los I/O bound salen rápido del
  procesador.
- Este algoritmo es non-preemptive.

## Shortest Job First (SJF)

- Este algoritmo supone que se pueden conocer los tiempos de ejecución de cada
  proceso con anticipación.
- Funciona si los procesos están todos disponibles a la vez.
- Contrarresta el favorecimiento de procesos CPU bounded y mejora los tiempos de
  respuesta.
- Este calendarizador es non-preemptive.

## Shortest Remaining Time (SRT)

- Versión preemptive del SJF.
- cuando un nuevo proceso llega a la ready queue, se recalcula cual proceso
  sigue usando el algoritmo de SJF.
- Potencial de starvation.

## Round Robin

- En este algoritmo cada proceso obtiene el procesador una pequeña cantidad de
  tiempo del CPU llamado "time quantum" o q.
- Cuando este tiempo termina el proceso es movido al final de la ready queue.
- Hay un timer que hace un interrupt cada quantum para calendarizar el siguiente
  proceso.
- Este calendarizador es preemptive porque no debemos esperar a que el proceso
  termine para cambiar de proceso que se está ejecutando actualmente.

## Priority Scheduling (PS)

- Se le asigna un número entero asociado a cada proceso.
- El CPU se asigna al proceso con la más alta prioridad, es decir el más
  pequeño.
- Se puede calcular la prioridad, por ejemplo, prediciendo cuál es el siguiente
  tamaño de burst que necesitará un proceso.
- Este proceso es preemptive porque no necesita esperar a que un proceso termine
  para cambiar la calendarización de las cosas.
