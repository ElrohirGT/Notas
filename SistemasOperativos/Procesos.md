# Procesos

Es un programa en ejecución. Es la unidad básica de trabajo de un OS.

El sistema operativo puede pausar y continuar la ejecución de cualquier proceso
cuando quiera y no pierde información ni deberría corromper el proceso.

## Program Counter (PC)

También llamado Instruction Pointer (IP). Es un registro que indica en qué
instrucción de un programa va el procesador. Es una de las partes del proceso.

Es incrementado en cada uno de los ciclos de instrucciones. Un ciclo de
instrucción es el tiempo que tarda el procesador en ejecutar una instrucción:

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

Son los estados por los que pasa a lo largo de su ciclo de vida. Permite al OS
tomar decisiones de calendarización:

- new: Cuando se está creando.
- ready: Esta en cola, esperando ejecución.
- running: Está en ejecución, tiene asignado al procesador.
- waiting: Es incapaz de continuar la ejecución, está esperando un evento
  externo.
- terminated: Proceso concluido, listo para ser eliminado.

Tiene varias transiciones, las principales son:

- Ready -> Running: Cuando el proceso es elegido por el calendarizador.
- Running -> Ready: Cuando el proceso es interrumpido y el OS asigna el CPU a
  otro proceso.
- Running -> Waiting: Cuando el proceso se bloquea debido a la espera de un
  evento.
- Waiting -> Ready: Cuando deja de esperar por el evento.

Para ir de `running` a `ready` es porque hubo un interrupt. Para ir de `ready` a
`running` es porque se calendarizó el proceso.

## Process Control Block (PCB)

El PCB es una estructura de datos que el OS utiliza para guardar una definición
de un proceso.

- ID
- Program counter
- Registros
- Info de calendarización
- Info sobre manejo de memoria
- Info sobre I/O que está en uso

## Calendarización de Procesos

Objetivo: Maximizar el uso del CPU.

Mantiene 2 queues:

- Ready queue (todo lo cargado a memoria principal)
- Waiting queue (Todo lo que esera un y/o evento externo)

## Cambios de Contexto

Un cambio de contexto es el proceso que sucede cuando el CPU hace un switch
entre procesos.

1. Pausar el proceso actual.
1. Guardar su PCB.
1. Cargar el PCB del nuevo proceso.
1. Ejecutar el nuevo proceso.

**Overhead:** Invertir tiempo no _útil_ en el procesador es lo que conocemos
como overhead.
