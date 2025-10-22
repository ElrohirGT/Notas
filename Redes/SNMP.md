# SNMP

Se utiliza para administrar una red.

Los componentes de una red son:

- Servidor de administración.
- Dispositivo administrado.
- **Data**: Información sobre el estado, configuración y estadísticas del
  dispositivo administrado.
- **Protocolo de administración**: Usado por el servidor para configurar el
  dispositivo administrado, usado por el dispositivo para informar sobre eventos
  al servidor.

## Enfoques

- **CLI**: Entrada directa del operador a un dispositivo individual.
- **SNMP/MIB**: Consulta/seteo de información de los dispositivos de la red a
  través del lenguaje SMI (Structured Management Information).

## Protocolo SNMP

Conceptos claves:

- **Administrador**: Dispositivo que monitorea (server).
- **Agente**: Aplicación que se ejecuta en el servidor y los dispositivos
  administrados.
- **Evento Trampa**: Acción que se "dispara" cuando ocurren ciertas condiciones,
  informa al administrador.

**OID**: Sigue una estructura jerárquica de árbol. Cada número en la dirección
apunta a un componente de información específica.
