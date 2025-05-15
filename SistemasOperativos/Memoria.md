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
