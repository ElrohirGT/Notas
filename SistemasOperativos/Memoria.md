# Manejo de Memoria

Es el conjunto de mecanismos por el cual el OS oculta la complejidad de la
memoria física y ofrece una vista más flexible y útil.

- **Reubicación**: Los procesos consultan direcciones relativas. Afecta la MMU
  (Memory Management Unit) y el Swapping (cambio de memoria principal/secundario
  o visceversa).

- **Protección**: Hace referencia a que los procesos tienen espacios de memoria
  aislados. Esto aplica para el mismo OS.

- **Mecanismos para compartir memoria**: Para optimizar memoria es necesario
  permitir que los procesos puedan compartirla:

  - IPC (Inter Process Communication)
  - Bibliotecas Compartidas
  - Dynamic Linking

- **Organización**: Cómo se distribuye lógicamente la memoria y también cómo lo
  hacemos eficiente:

  - Segmentación
  - Paginación
  - Jerarquías de memoria.

## Espacio de direcciones, direcciones lógicas y físicas

La abstracción de la memoria física se presenta como un espacio de direcciones.
El espacio de direcciones es el conjunto de direcciones de memoria a los cuales
un proceso puede acceder.

- **Direcciones lógicas**: Son las direcciones relativas que los procesos
  utilizan para acceder a memoria.

- **Direcciones físicas**: Direcciones reales en la memoria física.

## Vinculación de Direcciones

Es el procesador el encargado de traducir direcciones lógicas a físicas. La
traducciones se da gracias a 2 registros que se definen al momento de crear el
proceso.

- **Base**: Es la mínima dirección de memoria física que podemos utilizar.
- **Limit**: Es la máxima dirección de memoria física que podemos utilizar a
  partir de la base.

## Memory Management Unit (MMU)

Es una unidad de procesamiento del CPU dedicada al manejo de memoria introducida
en la arquitectura de los CPUs con el concepto de memoria virtual.

- Agujeros en el espacio de direcciones.
- Insuficiencia de memoria principal.
- Seguridad de accesos entre procesos.

## Dinamyc Loading y Linking

**Dinamyc Loading:** Es una técnica de manejo de memoria que permite que rutinas
y objetos se carguen dinámicamente hasta que se necesiten.

Dinamic loading se utiliza para rutinas que no se ejecutan en el flujo principal
de la aplicación. Un ejemplo para tal podría ser el manejo de errores.

**Dinamyc Linking:** Técnica de manejo de memoria que permite que las rutinas y
objetos se carguen en memoria una vez y si desean ser utilizados nuevamente se
hace un link a la rutina origninal. En Windows el archivo utilizado es DLL
(Dinamic Linking Library).

## Swapping

Es una técnica de manejo de memoria que permite que los procesos sean
cargados/descargados de memoria principal hacia memoria secundaria según el OS
decida.

## Segmentación

Es una técnica de manejo de memoria que permite la asignación de memoria de
manera no continua. Esto significa dividir los procesos en segmentos. Cada
segmento tiene su propio base+limit, los cuales le indican el inicio y bytes
luego del inicio que pertenecen a ese segmento.

La segmentación depende del lenguaje de programación + compilador. El OS tiene
una estructura llamada tabla de segmentos.

## Paginación

**LAS PÁGINAS NO SE COMPARTEN ENTRE PROCESOS**

Es una técnica de manejo e memoria en donde se separa la memoria física y lógica
en trozos pequeños de igual tamaño. Este si es un mecanismo que viene provisto
por el OS. El tamaño de las páginas se dan en tamaños de potencias de 2. Se
mueven de memoria primaria a secundaria.

Si tenemos:

- $2^m$ direcciones lógicas disponibles.
- $2^n$ tamaño de la página en bytes.

Entonces tendremos una cantidad de páginas disponibles igual a:

$$
2^{m-n}
$$

Cada página tiene asignado un frame, ambos son iguales, solo que se les llama
frame si está en memoria física o página si está en memoria lógica.

Se tiene una page table por proceso, también tenemos un frame table para saber
qué página va a qué frame.

### Mecanismos para complementar la paginación

- **Paginación Jerárquica**: Tienes árboles de páginas, para no tener que lidiar
  con la lista lineal pura de $2^64$ páginas.

- **Paginación con Hashing**: Se tiene la dirección lógica y se le pasa un hash,
  este hash se utiliza para la memoria física.

- **Paginación Inversa**: Se tiene una gran estructura la cual tiene un mapa de
  procesos a frames.

### Operaciones del OS

- Obtención: ¿Qué página debo cargar?

  - Demand paging
  - Prepaging

- Posicionamiento: Hacia qué frame se mapea la página

- Reemplazo: ¿Qué página se reemplaza?

  - LRU (Least Recently Used)
  - FIFO (First In/First Out)
  - Política de Reloj
