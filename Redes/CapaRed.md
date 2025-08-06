# Capa de Red

Emisor: Encapsula segmentos (transporte) en datagramas.

Receptor: Obtiene el datagrama de los frames recibidos (enlace).

Los protoclos están implementados en cada uno de los routers.

Router: Mueve los datagramas.

La capa de red es la que elige la ruta por la que pasará el paquete.

**Head of Line Blocking (HOL)**: Un datagrama en espera, bloquea otros
datagramas.

## Protocolos de Ruteo

### Algoritmo Flooding

Siempre se hace broadcast de los mensajes, así siempre llegará al router
destino.

### Dijkstra Link State

Los costos de los enlaces son conocidos por todos los nodos (debido al
broadcast).

Calcula las rutas de menor costo para un nodo origen a todos los demás nodos.

Es iterativo, después de k iteraciones conoce la ruta de menor costo.
