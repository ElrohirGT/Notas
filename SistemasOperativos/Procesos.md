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

## Creación de Procesos

Un proceso puede crear a otro, creando una relación padre -> hijo.

La relación entre procesos afecta cómo se comunican entre ellos.

Esto nos permite tener un _árbol de procesos_. Los procesos raíz por general
son:

- init
- systemd

Opciones en cuanto a recursos:

- Padre e hijo comparten recursos.
- Padre e hijo comparte ciertos recursos.
- Padre e hijo no comparten recursos.

Opciones de ejecución:

- Padre e hijo se ejecutan concurrentemente.
- Padre espera a que el hijo termine.

Para crear procesos en C se utiliza fork():

- El padre tiene un pid > 0.
- El hijo tiene un pid = 0.

## Terminación de Procesos

Un proceso puede terminar de manera volutaria como involuntaria.

- Para terminar de forma voluntaria: exit()

La terminación se da en caso de un error fatal o mediante otro proceso. En este
caso el proceso padre mata inmediatamente al proceso hijo.

- Para terminar de forma involuntaria: abort()

Algunas razones son:

- El proceso hijo excedió recursos.
- El proceso hijo ya no es necesario.
- El proceso padre hace un exit() y el OS no permite que siga viviendo.

Los procesos zombies son procesos hijos que ya terminaron su ejecución vía un
exit pero su PCB todavía sigue como si estuviera vivo.

El proceso padre debe eliminar el registro del PCB mediante un wait(). Cuando
eso sucede el proceso hijo es cosechado.

Cuando un proceso zombie permanece durante mucho tiempo, se le llama "resource
leak".
