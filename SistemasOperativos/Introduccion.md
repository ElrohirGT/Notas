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
