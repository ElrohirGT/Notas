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
