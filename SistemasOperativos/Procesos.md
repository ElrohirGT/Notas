# Procesos

Es un programa en ejecución. Es la unidad básica de trabajo de un OS.

El sistema operativo puede pausar y continuar la ejecución de cualquier proceso cuando quiera y no pierde información ni deberría corromper el proceso.

## Program Counter (PC)

También llamado Instruction Pointer (IP). Es un registro que indica en qué instrucción de un programa va el procesador. Es una de las partes del proceso.

Es incrementado en cada uno de los ciclos de instrucciones. Un ciclo de instrucción es el tiempo que tarda el procesador en ejecutar una instrucción:

1. Buscar instrucción en memoria principal
1. Decodificar esa instrucción
1. Ejecutar
1. Almacenar resultados

Un proceso puede ser equivalente a un job, el cual tiene las siguientes partes:

- Text section (Código de nuestro programa)
- Program Counter
- Stack (Espacio definido para data temporal)
- Data section (Variables globales)
- Heap (Memoria dinámica)

## Estados de un Proceso

Son los estados por los que pasa a lo largo de su ciclo de vida. Permite al OS tomar decisiones de calendarización:

- new: Cuando se está creando.
- ready: Esta en cola, esperando ejecución.
- running: Está en ejecución, tiene asignado al procesador.
- waiting: Es incapaz de continuar la ejecución, está esperando un evento externo.
- terminated: Proceso concluido, listo para ser eliminado.

Tiene varias transiciones, las principales son:

- Ready -> Running: Cuando el proceso es elegido por el calendarizador.
- Running -> Ready: Cuando el proceso es interrumpido y el OS asigna el CPU a otro proceso.
- Running -> Waiting: Cuando el proceso se bloquea debido a la espera de un evento.
- Waiting -> Ready: Cuando deja de esperar por el evento.

Para ir de `running` a `ready` es porque hubo un interrupt.
Para ir de `ready` a `running` es porque se calendarizó el proceso.
