## Computer Startup

1. PSU transmite energía al CPU. (Power Good Signal).
1. CPU recibe la señal y procede a acceder una dirección establecida de memoria. En esa dirección existe un firmware llamado POST (Power On Self Test). El POST envía señales eléctricas a los componentes para verificar su integridad.
1. POST cede el control a BOOT Manager o Bootsrap Loader. El cual indica en qué direcciones se encuentra la sección de booteo. (POST + Bootstrap Loader = BIOS/UEFI).
1. Bootstrap encontró la sección de booteo, carga el kernel del OS.

## Estructuras de Almacenamiento

### Main Memory

Usualmente la RAM.

- Es memoria volátil.
- El CPU puede acceder directamente a esta memoria.

El OS debe:

1. Saber qué partes de la RAM están siendo utilizadas y por quién.
1. Asignar y reclamar memoria.

### Secondary Memory

- No es volátil.
- Tiene mayor capacidad.

El OS debe:

1. Realizar cualquier acción relacionada al mantenimiento del sistema de archivos.
1. Gestionar y calendarizar el uso de disco.

## Gestión y Calendarización

### Multiprogramación

Gestión de la RAM.

Nos referimos a tener un job siempre listo para el CPU. Job Scheduling es el mecanismo que el OS utiliza para escoger y carga jobs en memoria.

### Multitasking

Gestión de CPU.

Nos referimos a la gestión constante y rápido entre jobs. CPU Scheduling es el mecanismo por el cual el OS escoge el siguiente job a ejecutar.

## Memoria Virtual

Resuelve tres problemas:

1. No hay suficiente RAM.
1. Tengamos agujeros en el espacio de direcciones, ya que los programas necesitan bloques de memoria continua para funcionar.
1. Seguridad en nuestros programas. Si se inician dos procesos "al mismo tiempo" pueden suceder race conditions en donde un programa sobreescribe la memoria de otro programa.

La memoria virtual resuelve los 3 problemas ya que representa un módulo que actúa como memoria para procesos externos pero internamente puede guardar la memoria real en cualquier lugar que quiera de la RAM, ya sea continua o no.

## Concurrencia

Hacer un job mientras se tiene algo más en proceso también. Requiere de un switch constante entre tareas.

## Paralelismo

El paralelismo sí es hacer 2 cosas al mismo tiempo. Requiere tener más de una sola unidad de procesamiento.

Mejora el throughput del sistema.

Hay dos tipos: simétrico y asimétrico. En el simétrico hay un procesador encargado de asignarle y dividir la carga entre los demás, mientras que en el asimétrico no hay gestión entre procesadores.

## Arquitecturas Multichip y Multicore.

Multichip significa que literalmente tiene más de 1 CPU en la motherboard.

Multicore solamente tiene un CPU pero tiene varios core.

## Cache

Surge de la necesidad de los procesadores de acceder a memoria más rápida. Se usa para guardar funciones de uso frecuente o datos de uso frecuente.

Reside en varios lugares dependiendo del nivel:

- Procesador
- RAM
- VRAM

Cache coherence, sirve para actualizar datos en el procesamiento paralelo por medio del hardware de cache controller.

## Shell

Es un intérprete de instrucciones que permite interactuar con el OS.

- CLI (Command Line Interface)
- GUI (Graphical User Interface)
- NUI (Natural User Interface) (Siri/Alexa)

## Programas del Sistema

Cualquier software incluido en el sistema operativo que nos permite tener ambientes de desarrollo y ejecución.

- File Systems.
- Sistemas de Edición de Texto.
- Compiladores.
- Intérpretes.
- Reportería.
- Calendarizador.

Las interfaces se encuentran un nivel arriba de las system calls.
