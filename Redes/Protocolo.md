# Protocolo

- Se pueden tener protocolos dentro de otros protocolos.

- Gobiernan toda comunicación.

- Definen el formato y orden de los mensajes enviados y recibidos entre entidade
  de la red, y las acciones tomadas en la transmisión o recepción de los
  mensajes.

## Arquitectura de Capa

Una arquitectura de capas es una estructura explícita que permite la
identificación y relación entre las piezas de un sistema.

Cada capa implementa un servicio e interfaces para comunicarse con otras capas.
Cada caa confía en los servicios proveídos por las otras capas.

- **Servicios**: Son las acciones de cada capa.
- **Interfaces**: La forma en la que se utilizan los servicios entre las capas.
- **Protocolos**: Definen la forma en la que se comunican entre capas.

## Modelo OSI

1. **Aplicación**: Servicios de aplicación, archivo, impresión, mensaje y bases
   de datos.
1. **Presentación**: Cifrado, compresión y traducción
1. **Sesión**: Control de conexiones y diálogo.
1. **Transporte**: Conexión punto a punto.
1. **Red**: Conmutación.
1. **Enlace de datos**: Entrega de paquetes.
1. **Física**: Conexión directa.

## Momdelo TCP/IP

1. Aplicación
1. Transporte
1. Internet
1. Acceso
