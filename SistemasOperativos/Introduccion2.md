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
