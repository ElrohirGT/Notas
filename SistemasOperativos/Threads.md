# Threads

- Es una unidad básica de ejecución de un proceso. Aunque es posible que el
  hardware ayude a su implementación originalmente son meramente conceptuales.
- Versión ligera de un proceso.

Un proceso puede estarse ejecutando en uno o varios threads.

Está compuesto por:

- ID
- Estado
- Program Counter
- Registros
- Stack

Las secciones que le faltan son Data Section y Text Section. Esto se da porque
las comparte del proceso que está ejecutando.

## ¿Qué permiten las threads?

- Los Threads permiten que varias tareas sean hechas por separarado (no
  necesariamente paralelas o concurrentes)
- Crear un proceso es más pesado que crear una thread.

## Beneficios

- Responsiveness: Permite que partes de un proceso puedan seguir trabajando
  incluso si otra parte está siendo bloqueada.

- Resource Sharing: Los threads comparten recursos del proceso

- Economy: Ya que crear threads para realizar tareas es más barato que nuevos
  procesos.

- Scalability: El uso de threads nos permite sacarle provecho a arquitecturas
  multithread o multicore.

## Threads de Kernel y de Usuario

Cada tipo de Thread corresponde a los modos de operación.

- Threads de Usuario:

  - No necesariamente poseen paralelismo.
  - Procesador no hace cambios de contexto.
  - Getionados por la aplicación.

- Threas de Kernel:

  - Ejecutados por el procesador.
  - Permiten paralelismo.
  - Gestionados por el OS.

## Modelos Multithreading

Hay 3 modelos de los cuales realmente solo uno se utiliza actualmente:

- UNO A UNO: Un Thread de usuario utiliza un thread de kernel. La cantidad de
  Threads puede limitarse por overhead, el diseño ayuda a evitar bloqueos y es
  el usado actualmente por la industria.

- MUCHOS A UNO: Muchos threads de kernel asignados a un thread de usuario, este
  modelo no permite paralelismo.

- MUCHOS A MUCHOS: En teoría no posee las desventajas de los otros modelos, sin
  embargo, en la práctica la gestión y creación de threads introduce mucho
  overhead, lo que lo vuelve ineficiente. Se considera anticuado y ya no se usa.

## Retos de Multicore/Multithreading

Presenta nuevos retos:

- **Dividir actividades**: Identificar qué tareas podemos ejecutar por separado.
- **Balancearlas**: Procesadores hacen trabajo equivalente.
- **Separación de Datos**: Datos accedidos por tareas concurrentes deben de
  estar correctamente distribuidos.
- **Dependencias**: Se debe sincronizar las tareas para acomodar su ejecución a
  la dependencia de información que hay entre ellas.
- **Testing/debugging**: Cuando hay paralelismo hay más escenarios que debemos
  testear y tomar en cuenta.

## Paralelismo de datos y tareas

**Paralelismo de tareas**: Con esto nos referimos a operaciones distintas que se
hacen en núcleos distintos (pero sobre los mismos datos).

**Paralelismo de datos**: Consiste en tener un único conjunto de datos el cual
vamos a dividir en subconjuntos para aplicar las mismas operaciones pero en
distintos núcleos por subconjunto.

## Software and Hardware Threads

Multicore/Multithreading está asociado con lo que conocemos como hardware
threads (pensando en la idea de que cada core puede proveer distintos threads de
hardware que cada uno por separado atiende threads de software).

Cada procesador tiene 2 threads de hardware. Este diseño de procesador en donde
se agregan threads de hardware para atender a threads de software se le llama
"Hyperthreading"

Thredas de Hardware == Procesadores Lógicos == Cores Virtuales

Cuando un hilo debe parar para buscar memoria se le llama "Memory Stall".

## Ley de Amdahl

Es una fórmula que nos permite calcular el potencial incremento en performance
que obtendremos de agregar más cores en una aplicación que tiene secciones
"seriales" y secciones paralelizables.

$$
\frac{1}{S+\frac{1-S}{N}} 
$$

- S: Es el porcentaje del programa que es serial.
- N: Es el número de cores/núcleos.

Speedup: Incremento en rapidez de ejecución.

## Threads en OS Modernos

### Linux

En Linux usualmente se le llaman task a los threads. Estas tasks son
representadas con estructuras de datos que tienen su información en
`task_struct`.

### Windows

Se usa la WinAPI para su creación. Cada thread tiene por lo menos:

- Thread Id.
- Un estado.
- Un stack (dependiendo de si está en modo usuario o kernel usamos stacks
  separados).

## Thread Libaries

Hay dos formas de implementarlo:

- User Space: Rápido y eficiente, mayor portabilidad. No tiene paralelismo real
  y varias threads pueden bloquearse.
- Kernel Space: Permite paralelismo real y no hay bloqueos de threads pues puede
  hacer siempre lo que quiera. Si se crean demasiadas se puede hacer una
  sobrecarga del sistema y tiene menos portabilidad.

## Thread Implícito

El threading implícito es una manera en la cual los compiladores y ciertas
bibliotecas pueden ayudarnos a gestionar un poco nuestros threads.

Algunos métodos de cómo se hace esto:

- Thread Pool

en este método se crean anticipadamente y se almacenan en un pool de threads:

| Ventajas                                                                                                               | Desventajas                                                             |
| ---------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| Evita el overhead de creación y eliminación de Threads. Cuando un thread se termina de usar son devueltos al pool      | Podemos estar consumiendo/reservando recursos "por gusto".              |
| Ofrece control sobre el límite de threads que una aplicación maneja.                                                   | Si un programa necesita un thread y todos están ocupados, toca esperar. |
| Para desarrolladores se separa la parte administrativa de la parte práctica en la programación de tareas concurrentes. |                                                                         |

- Fork Join

En este método múltiples threads son "forked" y luego "joined" a demanda del
problema.

- OpenMP

Es un estándar más que un método. Permite la programación paralela en ambientes
de memoria compartida (Es decir, sistemas con múltiples núcleos).

```
- Determina bloques de ejecución en paralelo.
- Crea tantos threads como núcleos disponibles para la ejecución de los bloques en paralelo.
- Se compila con la bander -fopenmp.
```

- Grand Central Dispatch

Es una tecnología desarrollada por Apple para gestionar la ejecución concurrente
de tareas en sus dispositivos y computadoras.

Permite identificar bloques de código para poner en colas.

Cada aplicación tiene:

1. Una cola principal (main queue) que es secuencial y se ejecuta en el hilo
   principal (usualmente usada para actualizar la interfaz gráfica).

1. Varias colas concurrentes globales, administradas por el sistema y
   diferenciadas por priodidad.

- Intel Threading Building Blocks

Método desarrollado por Intel para facilitar la escritura de programas que
exploten el paralelismo en C++.

Este método implementa lo que se llama "task stealing", el cuál tiene como
objetivo balancear la carga.

La forma en la que funciona es que cada proceso tiene su cola de tareas y cuando
un core está idle porque termino de ejecutar las tareas de su cola entonces
"roba" tareas de otro procesador.

Para usar este método, el hardware debe poder soportarlo.

## Precauciones con Threads

Algunas de las precauciones/consideraciones que debemos de tener en cuenta
cuando diseñamos programas multithread son:

- Semántica de las system calls fork() y exec().

Según POSIX, cuando un programa multithreaded llama a fork() **solo se duplica
el thread que invocó fork()** en el proceso hijo.

La llamaad a exec() reemplaza la imagen del proceso actual por un nuevo
programa. Esto implica que:

```
- Todo el espacio de memoria del proceso se reemplaza.
- Todos los threads del proceso desaparecen.
- Solo queda un nuevo hilo ejecutando el programa especificado en exec().
```

- Signal Handling

Una señal es un mecanismo de los sistemas UNIX que se utiliza para notificar a
un proceso que un evento en particular ocurrió. La señal puede ser recibida ya
sea de manera asíncrona o síncrona dependiendo de la fuente y de la razón por la
cual la señal está siendo creada.

1. Una señal es generada por la ocurrencia de un evento en particular.
1. La señal es entregada a un proceso.
1. Una vez entregada la señal debe ser manejada.

Estas señales pueden ser manejadas de 2 posibles maneras:

1. Un signal handler default (manejado por el kernel).
1. Un signal handler definido por el usuario.

Si tenemos varias threads entonces tenemos algunas opciones:

1. Entregar la señal al thread en donde la señal aplica.
1. Entregar la señal a todos los threads.
1. Entregar la señal a ciertos threads.
1. Asignar un thread específico para recibir todas las señales del proceso.

- Cancelación de Threads

La cancelación de threads significa terminar un thread antes de que sea
completado.

El thread que será cancelado se le refiere como el `target_thread`. Pueden haber
dos escenarios:

1. **Cancelación Asíncrona**: Esto significa que un thread termina de inmediato
   al target thread. El OS reclama los recursos.
1. **Cancelación Diferida**: Esto significa que el thread objetivo esta
   chequeando constantemente si debe cancelarse o terminarse a sí mismo. Esto
   permite que el thread termine "normalmente". `pthread_cancel(tid)`.

- Thread Local Storage

Los Threads que pertenecen a un proceso comparten recursos con el proceso.
Claramente, compartir esta data provee uno de los beneficios del multithreading.
Sin embargo, en ciertas circunstancias cada thread puede que necesite su propia
copia de cierta data. A esta cierta data es lo que conocemos como Thread Local
Storage (TLS).

- Scheduler Activations

Una buena comunicación entre el Kernel y la Thread Library de usuario es
necesaria. Esta coordinación es fundamental para que el sistema pueda ajustar
dinámicamente el número de threads de kernel y maximizar el rendimiento.

En este contexto muchos sistemas operativos utilizan una estructura intermedia
conocida como Light Weight Process.

Es especialmente útil cuando se tienen arquitecturas de varios niveles (de
muchos a muchos) el OS tiene que recalendarizar todo el trabajo asignado cada
vez que algún core/thread se muera o no esté disponible por algún motivo.
