# Introducción a Sistemas Operativos

**¿Qué es un sistema operativo?**

No hay un consenso, pero definitivamente sabemos que es un software. El cual
puede:

- Manejar hardware (usarlo sin intervención de un usuario).
  - RTOS es un tipo de OS en donde el tiempo de respuesta es crítico. Por
    ejemplo los usados en sistemas médicos y automovilísticos.
- Utilizar hardware (requiere la intervención de un usuario).

Realmente un OS en la mayoría de casos es el puente entre un usuario y el
hardware.

```plantuml
:Usuario; 
:OS;
:Hardware;
```

## Estructura de un Sistema de Computación

1. Usuario: Los que utilizan el sistema (personas o máquinas).
1. Hardware: Los recursos (CPU, Memoria).
1. Aplicaciones: Las cosas que quieren utilizar los recursos.
1. OS: Quien coordina el uso de los recursos.

```plantuml
:Usuario;
:Aplicaciones;
:OS;
:Hardware;
```

La comunicación entre estas partes es **bidireccional**.

**¿Qué hace un sistema operativo?**

Es un software que gestiona los recursos de un sistema. Usualmente sirve como
intermediario entre el usuario y el hardware.

## Kernel

Es un programa _nuclear_ que es el encargado de ejecutar todas las funciones
básicas del OS. Por lo tanto, es el único programa que se está ejecutando el
100% del tiempo.

Tiene 4 metas:

1. Ser seguro: Reestringe el acceso de los recursos y evita acciones no
   autorizadas.
1. Es confiable: Asegura la operación continua y "correcta" del sistema.
1. Privada: Reestringir el acceso de información entre usuarios.
1. Eficiente: Da la cantidad _justa_ de recursos, depende de la aplicación del
   sistema.

## Modo Dual de Operación

Se le llama modo dual porque se tienen dos modos:

- Modo Kernel: Es cualquier código o programa del sistema operativo que se
  ejecuta sobre el hardware.

- Modo Usuario: Cualquier código o programa que son ejecutados por un usuario
  pero con permisos reestringidos.

Normalmente las instrucciones tienen un bit que indica si la operación se
realiza en modo Kernel o Usuario.

Utiliza un reloj o timer que es el encargado de disparar interrupts cuando una
aplicación ejecutada en modo Usuario usa recursos de más.

**Multimode Operation:** Existen otros modelos en donde se utiliza varios
niveles de permisos, en donde el nivel 0 es el kernel y hay n-niveles cada uno
con menos y menos permisos de ejecución.

Para cambiar entre modo Kernel y modo Usuario se utiliza una **System Call**.

## System Calls

Es el nombre que se le da al uso de rutinas específicas para la transición al
modo kernel. De esta manera las apps solicitan servicios al OS.

El OS provee librerías de código compilado con funciones específicas para
proveer servicios a las aplicaciones:

- Se encargan de encapsular estas funciones.
- Se encarga de proveer un punto de acceso.
- Se encarga de entrar en modo Kernel.
- Se encarga de ejecutar la funcionalidad requerida.

La forma en la que las system calls entran al modo kernel es por medio de
interrupciones.

## Interrupciones

Hay 3 tipos:

1. Interrupciones de Software: los que se realizan cuando se solicita un
   servicio.
1. Interrupciones a nivel de Hardware: se recibe un I/O de un device.
1. Excepciones: Se dan cuando el OS detecta acciones no permitidas.

# Tipos de Estructuras

Tiene como propósito manejar estas 4 características:

1. Desempeño
1. Robustez
1. Mantenimiento
1. Complejidad

## Simple

Es la forma más sencilla de estructurizar un OS. Utilizada por MS-DOS y UNIX
Versión 0.

- Fácil de implementar en sistemas pequeños.
- Bajo costo en recursos.
- Difícil de mantener.
- Falta de modularidad.

## Monolítica

Linux versión original y UNIX posteriors.

- Tiene todas las System Calls agrupadas en un mismo kernel junto con sus
  servicios básicos.
- Excelente Desempeño.
- Difícil de modificar.

## Por Capas

Ya no se utiliza, esta estructura permite tener multimodos de operación en
cuanto a permisos en lugar del clásico dual. Usado en WindowsNT y el IBM 360
system.

- Multimode Operation.
- Mayor robustez debido al multimode operation.
- Menos desempeño debido al multimode operation.
- Aumenta mucho la complejidad debido al multimode operation.

## Microkernel

El propósito es solo tener el kernel, es decir las funciones más escenciales y
nada más.

- Contiene solo funciones escenciales para gestión.
- Modular.
- Fácil de depurar y mantener.
- Diseño complejo.
- Menor desempeño.

## Sistemas Híbridos

Combinan la monolítica con la microkernel. Permiten subsistemas. Son Representan
los sistemas operativos actuales.

## Comparativa

|Estructura|Desempeño|Robustez|Facilidad de Mantenimiento|Complejidad|
|---|---|---|---|---| |Simple|Alto|Bajo|Bajo|Bajo| |Monolítica|Muy
Alto|Medio|Medio|Medio| |Por capas|Medio|Alto|Alto|Alto| |Microkernel|Bajo|Muy
Alto|Alto|Muy Alto| |Híbrido|Alto|Alto|Alto|Alto|

## Computer Startup

1. PSU transmite energía al CPU. (Power Good Signal).
1. CPU recibe la señal y procede a acceder una dirección establecida de memoria.
   En esa dirección existe un firmware llamado POST (Power On Self Test). El
   POST envía señales eléctricas a los componentes para verificar su integridad.
1. POST cede el control a BOOT Manager o Bootsrap Loader. El cual indica en qué
   direcciones se encuentra la sección de booteo. (POST + Bootstrap Loader =
   BIOS/UEFI).
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

1. Realizar cualquier acción relacionada al mantenimiento del sistema de
   archivos.
1. Gestionar y calendarizar el uso de disco.

## Gestión y Calendarización

### Multiprogramación

Gestión de la RAM.

Nos referimos a tener un job siempre listo para el CPU. Job Scheduling es el
mecanismo que el OS utiliza para escoger y carga jobs en memoria.

### Multitasking

Gestión de CPU.

Nos referimos a la gestión constante y rápido entre jobs. CPU Scheduling es el
mecanismo por el cual el OS escoge el siguiente job a ejecutar.

## Memoria Virtual

Resuelve tres problemas:

1. No hay suficiente RAM.
1. Tengamos agujeros en el espacio de direcciones, ya que los programas
   necesitan bloques de memoria continua para funcionar.
1. Seguridad en nuestros programas. Si se inician dos procesos "al mismo tiempo"
   pueden suceder race conditions en donde un programa sobreescribe la memoria
   de otro programa.

La memoria virtual resuelve los 3 problemas ya que representa un módulo que
actúa como memoria para procesos externos pero internamente puede guardar la
memoria real en cualquier lugar que quiera de la RAM, ya sea continua o no.

## Concurrencia

Hacer un job mientras se tiene algo más en proceso también. Requiere de un
switch constante entre tareas.

## Paralelismo

El paralelismo sí es hacer 2 cosas al mismo tiempo. Requiere tener más de una
sola unidad de procesamiento.

Mejora el throughput del sistema.

Hay dos tipos: simétrico y asimétrico. En el simétrico hay un procesador
encargado de asignarle y dividir la carga entre los demás, mientras que en el
asimétrico no hay gestión entre procesadores.

## Arquitecturas Multichip y Multicore.

Multichip significa que literalmente tiene más de 1 CPU en la motherboard.

Multicore solamente tiene un CPU pero tiene varios core.

## Cache

Surge de la necesidad de los procesadores de acceder a memoria más rápida. Se
usa para guardar funciones de uso frecuente o datos de uso frecuente.

Reside en varios lugares dependiendo del nivel:

- Procesador
- RAM
- VRAM

Cache coherence, sirve para actualizar datos en el procesamiento paralelo por
medio del hardware de cache controller.

## Shell

Es un intérprete de instrucciones que permite interactuar con el OS.

- CLI (Command Line Interface)
- GUI (Graphical User Interface)
- NUI (Natural User Interface) (Siri/Alexa)

## Programas del Sistema

Cualquier software incluido en el sistema operativo que nos permite tener
ambientes de desarrollo y ejecución.

- File Systems.
- Sistemas de Edición de Texto.
- Compiladores.
- Intérpretes.
- Reportería.
- Calendarizador.

Las interfaces se encuentran un nivel arriba de las system calls.
