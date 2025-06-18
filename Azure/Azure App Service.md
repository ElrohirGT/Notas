# Azure App Service

Es un servicio HTTP para hostear aplicaciones web, REST APIs y backends para
aplicaciones móbiles. Las aplicaciones desarrolladas para este servicio pueden
correr tanto en Linux como en Windows.

Las aplicaciones que utilicen de este servicio tienen soporte para **escalar**
para arriba o para abajo tanto como necesiten, incluyendo cosas como más/menos
instáncias o directamente incrementar la RAM o cores.

Este servicio también soporta correr aplicaciones usando contenedores de Docker.
También soporta aplicaciones con múltiples contenedores, Windows containers y
Docker compose.

Este servicio también cuenta con soporte para CI/CD usando Azure Devops, Github,
Bitbucket, FTP o un repositorio local de Git. También está disponible si
utilizas contenedores mientras estén en el registro de Azure o Docker Hub.

**Deployment Slot**: Un _deployment slot_ son aplicaciones que se encuentran
desplegadas al mismo tiempo, por defecto solamente se tiene el slot de
producción. Si necesitas más sube al plan _Standard_ o superior.

## Limitaciones de usar App Service en Linux

- No puedes beneficiarte del Shared pricing tier.

- Si usas alguna imagen predefinida el contenido de tu aplicación así como su
  código es alojado en un volumen de Azure Storage, acceder a archivos o
  contenido dentro de este volumen es más lento que usando el sistema de
  archivos del contenedor, si tu aplicación necesita usar estos archivos
  constantemente (como assets y demás) entonces es mejor crear una imagen
  custom.

## App Service Environment

En App Service los recursos de infraestructura se comparten, en App Service
Environment todos están dedicados solamente a un cliente individual.

## App Service Plans

Cada _App_ que use el servicio de _App Service_ corre usando un _App Service
Plan_. El plan dfine un conjunto de recursos para que corra una o más
aplicaciones web. Un _Service Plan_ define:

- Operating System (Windows, Linux)
- Region (West US, East US, etc.)
- Number of VM instances
- Size of VM instances (Small, Medium, Large)
- Pricing tier (Free, Shared, Basic, Standard, Premium, PremiumV2, PremiumV3,
  Isolated, IsolatedV2)

Free/Shared son las tiers básicas, todas las apps que corren en estas tiers
comparten recursos con otras apps, la aplicación en sí no puede escalar para
arriba.

Las tiers de Basic para arriba corren en una VM dedicada, solo las aplicaciones
dentro del mismo plan y del mismo cliente comparten recursos. Mientras más alta
sea tu tier más VMs tendrás disponibles para escalar.

Las tiers de Isolated corren en sus propias VMs y también su propia red virtual,
provee el mayor potencial de escalabilidad.

Las aplicaciones dentro de las tier Basic o superior corren de la siguiente
forma:

- Todas las VMs configuradas en el plan son usadas por tu aplicación.
- Si varias aplicaciones son seleccionadas por el mismo plan entonces todas
  comparten todas las instancias de VM.
- Si tienes múltiples _deployment slots_ entonces todos los _slots_ comparten
  las VMs.
- Si se habilitan backups, Webjobs o logs de diagnóstico, entonces también
  utilizan ciclos de CPU y memoria.

En general es posible que ahorres costos teniendo varias aplicaciones dentro de
un mismo _Service Plan_. Separa tu aplicación en un nuevo plan si:

- La aplicación necesitan muchos recursos.
- Te gustaría escalar esta aplicación de forma independiente a las demás.
- La aplicación necesita recursos en una región geográfica distinta.

## Despliegue

Se pueden desplegar de dos formas:

- Despliegue Automatizado: Usando Azure DevOps, Github o Bitbucket.
- Despliegue Manual:
  - Git: App Service brinda una Git URL que se puede agregar como remoto a un
    repositorio. Hacerle push a este remoto con cambios significa hacer un
    deploy.
  - CLI: Con el comando webapp up de la utilidad de consola az.
  - Zip deploy: Puedes subir un archivo .zip usando CURL.
  - FTP/S: La manera tradicional subiendo archivos usando FTP.

Es altamente recomendable usar _deployment slots_. Si se usa el plan estándar o
mejor se puede primero hacer despliegue al ambiente staging y luego simplementa
hacer un swap de los ambientes de producción y staging. Este swap se realiza de
tal forma que elimina el downtime.

Para contenedores custom en _Azure Container Registry_ o algún otro registro la
automatización es más compleja:

- **Build and tag the image**: Construye la imagen y usa una tag que sea fácil
  de identificar, no use **latest**.
- **Push the tagged image**: Ya con la imagen construida, súbela al registro y
- **Update the deployment slot with the new image tag**: El sitio se reinicia de
  forma automática, por eso se recomienda usar un slot de staging y luego hacer
  el swap para minimizar el _downtime_.

## Sidecar containers

Se pueden añadir hasta 9 _sidecar containers_ for cada custom container app que
tenga _sidecars_ habilitados. Estos contenedores te permiten desplegar servicios
extras sin que estén asociados directamente con tu aplicación principal, por
ejemplo, servicios de monitoreo, logging, configuración, networking, etc.

## Authentication and Authorization

Esta directamente implementado en la plataforma por lo que no necesita de un
lenguaje en particular, SDK o código y te permite usar múltiples proveedores,
por ejemplo: Microsoft Entra ID, Facebook, Google, X entre otros.

Esta autenticación y autorización es un componente middleware por el que todas
las request HTTP de tu aplicación deben pasar antes de llegar al código de tu
aplicación. Corre en la misma VM pero por separado a tu app y puede ser
configurado por medio de un archivo de configuración o usando Azure Resource
Manager.

**Flujo de autenticación**

| Paso                            | Sin SDK                                                                                                                      | Con SDK                                                                                  |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Sign user in                    | Redirect client to `/.auth/login/<provider>`                                                                                 | El cliente inicia sesión usando el SDK del proveedor y recibe un token de autenticación. |
| Post-authentication             | El proveedor redirecciona al cliente hacia: `/.auth/login/<provider>/callback`                                               | El cliente manda el token a `/.auth/login/<provider>` para validación.                   |
| Establish authenticated session | App Service añade la cookie de autenticación a la response                                                                   | App Services retorna su propio token de autenticación al cliente.                        |
| Serve authenticated content     | El cliente incluye la cookie de autenticación en todas las requests siguientes (manejado de forma automática por el browser) | El cliente manda el token de autenticación en el header: `X-ZUMO-AUTH`                   |

**Authorization Behaviour**

Se puede configurar el comportamiento solamente a estas dos opciones:

- **Permitir requests sin autenticar**: Esta opción refiere la responsabilidad
  de autenticación al código de la aplicación. Es la ideal si se necesita
  mostrar algunas ventanas o pantallas sin la necesidad de estar autenticado.
  También si quieres ofrecer múltiples proveedores the autenticación a tus
  usuarios.
- **Requerir autenticación**: Rechaza cualquier _request_ no autenticada, este
  rechazo se puede configurar como una redirección al login de un único
  proveedor.

_App Service_ provee una **Token Store**, el cual es un repositorio de tokens
asociados a los usuarios de la aplicación, en el caso habilites la autenticación
con algún proveedor. Además si habilitas logs y tracing, también se unirán ahí
los logs de autenticación.

## Networking

Por defecto todas las aplicaciones dentro del _App Service_ son directamente
accesibles por el internet y solamente pueden acceder endpoints del internet
público.

## Multitenant App Service

- _frontends_: Los roles que manejan requests HTTP/HTTPS de ingreso.
- _workers_: Los roles que hostean el _workload_ del cliente.

Debido a que muchas aplicaciones comparten las mismas instancias de VM dentro de
la misma red, no se puede simplemente configurar las dos redes que quieres unir
para las aplicaciones que necesitas. Por esta razón se tiene las _features_:

| Inbound Features     | Outbound Features                            |
| -------------------- | -------------------------------------------- |
| App-assigned address | Hybrid Connections                           |
| Access Restrictions  | Gateway-required virtual netoork integration |
| Service endpoints    | Virtual Network Integration                  |
| Private endpoints    |                                              |

Se pueden mezclar todas las características con algunas excepciones. Algunos
ejemplos de casos de uso son:

| Inbound use case                                                 | Feature              |
| ---------------------------------------------------------------- | -------------------- |
| Support IP-Based SSL needs                                       | App-assigned address |
| Support unshared dedicated inbound address                       | App-assigned address |
| Restrict access to your app from a set of well-defined addresses | Acess restrictions   |

- Free/Shared plans hostean toda la carga de trabajo del usuario en workers
  multitenant mientras que los Basic+ plans usan workloads dedicados a un solo
  _App service plan_.
- Si tienes un Standard App Service Plan entonces todas tus aplicaciones
  comparten el mismo worker, si escalas para arriba el worker entoncs todas las
  aplicaciones son replicadas en cada instancia del plan.

Hay muchas direcciones de red que se utilizan para hacer llamadas HTTP desde tu
app hacia afuera, accede a la propiedad `outboundIpAddresses` para saber cuál
podría usar tu servicio. Por ejemplo usando el siguiente comando:

```bash
az webapp show \
    --resource-group <group_name> \
    --name <app_name> \ 
    --query outboundIpAddresses \
    --output tsv
```

Si te interesa saber cuál es alguna posible IP Address independientemente de tu
tier:

```bash
az webapp show \
    --resource-group <group_name> \ 
    --name <app_name> \ 
    --query possibleOutboundIpAddresses \
    --output tsv
```

## Configuration

En App Service, las configuraciones son pasadas como variables de entorno hacia
el código de la aplicación. Cada vez que se modifican, App Service realiza un
reinicio de la aplicación. Puedes acceder a ellos seleccionando: "Environment
variables > Aplication settings".

Las configuraciones pueden depender de acuerdo al _Deployment Slot_ por lo tanto
también debes especificar si esta propiedad de configuración es _swappable_
entre ambientes.

> In a default Linux app service or a custom Linux container, any nested JSON
> key structure in the app setting name like
> ApplicationInsights:InstrumentationKey needs to be configured in App Service
> as ApplicationInsights\_\_InstrumentationKey for the key name. In other words,
> replace any : with \_\_ (double underscore). Any periods in the app setting
> name are replaced with a _ (single underscore).

Para desarrolladores ASP.NET y ASP.NET Core se recomienda usar Connection
Strings, para todos los demás desarrolladores se recomienda usar los App
Settings de forma normal.

En caso se utilicen las Connection Strings entonces estarán disponibles como:

- SQLServer: SQLCONNSTR\_
- MySQL: MYSQLCONNSTR\_
- SQLAzure: SQLAZURECONNSTR\_
- Custom: CUSTOMCONNSTR\_
- PostgreSQL: POSTGRESQLCONNSTR\_
- Notification Hub: NOTIFICATIONHUBCONNSTR\_
- Service Bus: SERVICEBUSCONNSTR\_
- Event Hub: EVENTHUBCONNSTR\_
- Document DB: DOCDBCONNSTR\_
- Redis Cache: REDISCACHECONNSTR\_

Por ejemplo si se guardó una conexión de MySQL con el nombre de SanDB:
MYSQLCONNSTR_SanDB

Si tienes un contendor custom que necesita variables de entorno externas las
puedes agregar desde la terminal usando:

```bash
az webapp config appsettings set --resource-group <group-name> --name <app-name> --settings key1=value1 key2=value2
```

Puedes verificar variables de entorno de forma automática con la URL:
https://<app-name>.scm.azurewebsites.net/Env

### General Settings

En la tab de "Configuration > General Settings" puedes editar algunas
configuraciones más comunes, es posible que necesites cambiar pricing tier para
configurar algunas cosas. Por ejemplo:

- **Stack Settings**: Como el software que se utiliza para correr la aplicación,
  incluyendo las versiones del SDK y el lenguaje. Para aplicaciones de Linux o
  en contendores custom puedes incluso agregar un comando custom de inicio o
  archivo.
- **Platform Settings**: Te permite configurar cosas como si es de 32-64 bits
  (solo para Windows), si se habilita o no FTP, la versión de HTTP, si utilizan
  Websockets, si solamente se utiliza HTTPS, la versión mínima de TLS
  - Always On: Mantiene la aplicación cargada incluso si no hay tráfico. Por
    defecto si esta opción está desactivada la aplicación se mantiene viva por
    20mins luego del último request. Esta opción es necesario para los Webjobs
    continuos o para los que son iniciados por una CRON expression.
  - ARR Affinity: Cuando se utiliza un _multi-instance deployment_ esta
    configuración se asegura que el cliente siempre sea dirigido a la misma
    instancia durante toda su vida de la sesión. Se puede apagar para
    aplicaciones stateless.
- **Debugging**: Te permite debuggear la aplicación de forma remota, solamente
  para aplicaciones: ASP.NET, ASP.NET Core y NodeJS. Se apaga automáticamente
  luego de 48hrs.
- **Incoming client certificates**: Requiere autenticación mutua usando
  certificados. Se activa para restringir el acceso a la aplicación habilitando
  diferentes tipos de autenticación.

### Path Mappings

Te permite organizar o brindar contenido estático o sub-aplicaciones al mappear
paths virtuales (las URLs que ven los usuarios) a reales (carpetas dentro del
server).

- **Windows (Uncontainerized)**: Te permite agregar scripts custom para manejar
  requests de una extensión de archivo en específico. Cada aplicación tiene el
  root path mapeado hacia: `D:\home\site\wwwroot`. El cual es el lugar en el que
  el código es desplegado por defecto. Para marcar un directorio virtual como
  una aplicación web deschequea el "Directory" check box.
- **Linux/Containerized apps**: Para agregar almacenamiento personalizado a las
  aplicaciones de contenedor/Linux, seleccione **Nuevo montaje de Azure
  Storage**. Te permite configurar:
  - Nombre para mostrar.
  - Si necesita configurar puntos de conexión de servicio, Azure Key Vault ,
    endpoints privados, share name o access key, use la configuración avanzada,
    caso contrario use la configuración básica.
  - Configure la cuenta de almacenamiento asociada a este volumen.
  - Configurar si el ambiente se pasa al deployment slot.

### Diagnostic Logging

| Type                    | Platform      | Location                                      | Description                                                                                                                                                                                              |
| ----------------------- | ------------- | --------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Aplication Logging      | Windows/Linux | App Services file system, Azure Storage blobs | Logs generados por el código de la aplicación                                                                                                                                                            |
| Web Server Logging      | Windows       | App Services file system, Azure Storage blobs | Datos de request HTTP puros en el formato de W3C extendido                                                                                                                                               |
| Detailed Error Messages | Windows       | App Service File System                       | Copias de las páginas `.html` de error que se enviaron al cliente.                                                                                                                                       |
| Failed Request Tracing  | Windows       | App Service File System                       | Información detallada de las requests fallidas, incluye componentes IIS, una carpeta es generada por cada request fallida que incluye el XML (la data del log) y el XSL (los estilos para ver los logs). |
| Deployment Logging      | Windows/Linux | App Service File System                       | Te ayuda a determinar por qué falló un despliegue, no se puede configurar.                                                                                                                               |

#### App Logging Windows

En Windows, los logs que se guardan dentro del **Filesystem** son
**temporales**, ya que solamente regrista las 12 últimas horas luego de haberse
activado. Si se desean logs permanentes entonces se debe usar la opción de Blob
storage. Además se puede configurar el nivel de prioridad que debe tener el log
para registrarse (Error, Warning, Information, Verbose).

#### App Logging Linux/Container

En Linux o aplicaciones contenerizadas utiliza la opción de **Filesystem**.
Selecciona el número de días que los logs deben ser retenidos y la cantidad de
espacio de disco que reservarás para los logs.

#### Web Server Logging

Elige si quieres guardarlos en el **Filesystem** o en el **Blob Storage** de
Azure, y selecciona la cantidad de días que se guardarán los logs en el sistema.

#### Acceder a los Logs

Todos los archivos escritos en `/LogFiles` y que terminen en: .txt, .log, .htm
son tomados como logs por App Service y stremeados por el serivicio.

> Algunos tipos de Logs usan buffers para escribir al archivo, por lo que es
> posible que esto resulte en eventos fuera de orden en el stream.

Si tienes la herramienta de consola puedes usar el siguiente comando para
stremear los logs:

```bash
az webapp log tail --name <appname> --resource-group <myResourceGroup>
```

Para descargar los logs puedes visitar:

- Linux/Container: https://<app-name>.scm.azurewebsites.net/api/logs/docker/zip
- Windows: https://<app-name>.scm.azurewebsites.net/api/dump

Si es una aplicación de contenedor o Linux entonces se guardan logs para tanto
el contenedor como el host del contendor, si la aplicación tiene varias
instancias, se guardan los logs para las múltiples instancias.

### Security Certificates

_App Service_ te permite crear, subir o importar certificados privados a
públicos para tu aplicación. El certificado está asociado al _Resource Group_
del _Service Plan_ de la aplicación, así como a la región (a esto se le llama un
**webspace**). El certificado es accesible a otras aplicaciones del mismo
_Resource Group_ o _Region_ combinadas.

Puedes:

- Crear un certificado privado manejado por App Service de forma gratuita.
- Comprar un Certificado de App Service manejado por Azure.
- Importar un certificado del _Key Vault_
- Subir un certificado privado.
- Subir un certificado público.

El certificado gratis/comprado de App Service ya cumple con todos los
requerimientos, pero si quieres usar uno personalizado entonces:

- Exported as a password-protected PFX file, encrypted using triple DES.
- Contains private key at least 2,048 bits long.
- Contains all intermediate certificates and the root certificate in the
  certificate chain.

Para crear certificados custom de TLS/SSL o habilitar certificados del cliente
en App Service tu plan debe ser Basic, Standard, Premium o Isolated. El
certificado gratuito es manejado completamente por Azure por lo tanto puede
cambiar en cualquier momento el issuer de certificados que usa internamente,
**evite depender del issuer o cualquier otra parte de la jerarquía del
certificado**.

El Certificado gratis tiene las siguientes limitantes:

- No soporta certificados con wildcards.
- No soporta el uso como un certificado de cliente.
- No soporta DNS privadas.
- No es exportable.
- No es soportado en App Service Environment.
- Solamente soporta caracteres alfanuméricos, guiones y puntos.
- Solo dominios de hasta 64 caracteres son soportados.

Si compras un certificado de Azure entonces Azure maneja:

- El proceso de compra con el proveedor.
- Verificación de dominio del certificado.
- Mantener el certificado en Azure Key Vault.
- Renovación del certificado.
- Sincronización de forma automática con las copias de App Service Apps.

## Scaling applications

_App Service_ soporta escalado manual así como de forma automática, en caso sea
automática soporta dos formas:

- **Azure autoscale**: Defines reglas y Azure escala en base a ellas.
- **Automatic scaling**: Defines parámetros y toma decisiones de escalamiento
  por tí. Depende en general del tráfico HTTP.

| Factor                  | Autoscale         | Automatic Scaling    |
| ----------------------- | ----------------- | -------------------- |
| Available Pricing tiers | Standard y arriba | PremiumV2, PremiumV3 |
| Schedule-based scaling  | YES               | NO                   |
| Prewarmed instsances    | YES               | YES (default 1)      |
| Per-app maximum         | NO                | YES                  |

Automatic Scaling siempre tiene al menos una instancia siempre lista para
recibir rquests, Autoscale no.

Autoscale ajusta la cantidad de servidores que tienes corriendo, pero no los
recursos disponibles para cada una de estas copias. Ten cuidado definiendo las
reglas porque puedes quedar vulnerable a un DoS. Filtra las request antes de que
lleguen a tu servicio.

### Autoscale

Provee elasticidad, ya que reduce incrementa la carga según el uso. Mejora el
porcentaje de disponibilidad de la aplicación así como su resistencia a fallos,
puesto que si una instancia falla siempre se puede iniciar otra y de forma
automática.

Debido a que funciona agregando/quitando servidores, si una tarea utiliza de
forma intensiva los recursos como el CPU/Memoria no tiene un efecto
significativo. Además si te anticipas a la cantidad de usuarios que tendrás
eventualmente podrías ahorrar dinero ya que monitorear si se necesita o no
realizar un escalado consume recursos.

Para utilizar el autoscaling puedes realizarlo por medio de dos parámetros:

- Basado en una métrica como la longitud de disco o el número de solicitudes
  HTTP en espera.
- Escalado a un número específico de instancias según un horario.

Puedes combinar cualquiera de estas dos métricas varias veces para lograr un
escalado incremental.

Las métricas que se pueden usar son:

- **CPU Percentage**: Indica la cantidad de uso del CPU de todas las instancias.
- **Memory Percentage**: Indica la cantidad de memoria que la aplicación ocupa
  entre todas las instancias.
- **Disk Queue Length**: Indica cuántas solicitudes de I/O están en cola entre
  todas las instancias.
- **HTTP Queue Length**: Indica cuántas HTTP request de los clientes están
  esperando para ser procesadas por la aplicación.
- **Data In**: La cantidad de bytes recibidos entre todas las instancias.
- **Data Out**: La cantidad de bytes enviados entre todas las instancias.

Autoscale funciona analizando las métricas sobre el tiempo en todas las
instancias.

1. Agrupa todos los valores recibidos para la métrica seleccionada por un
   período de tiempo predefinido (conocido como _time grain_). Este período
   cambia según la métrica pero generalmente es 1min. Las opciones de agregación
   son: Promedio, Minimo, Máximo, Suma, Último, Cuenta.

1. Debido a que 1min es un tiempo demasiado corto, se procede a agrupar los
   valores previamente agrupados sobre un rango de tiempo más largo (este
   segundo período de tiempo se conoce como _Duration_). El usuario tiene
   control sobre el tamaño de este segundo período pero el mínimo es 5mins.

El cálculo para el agrupamiento de _Duration_ puede ser distinto que para el
_time grain_. Se puede usar promedio para el _time grain_ y máximo para el
_duration_ por ejemplo.

Una vez se ha determinado que el límite de la regla se ha superado entonces se
ejecuta la acción de la regla, generalmente subiendo/bajando la cantidad de
instancias disponibles. Todas las acciones tienen un _cooldown period_
especificado en minutos. El mínimo es 5mins.

Definir una regla de escalado para afuera no implica que se realize un escalado
para abajo de forma automática, **define las reglas en parejas!**

Una condición de escalado puede contener varias reglas que no necesariamente
estén relacionadas entre sí, además la forma en la que se combinan importa. Por
ejemplo:

- Si la cola de HTTP llega a 10 o más, scale out by 1.
- Si la utilización del CPU supera 70%, scale out by 1.
- Si la cola de HTTP es 0, scale in by 1.
- Si la utilización del CPU baja a 50%, scale in by 1.

Cuando el sistema determina si debe hacer un **scale out**, busca hacerlo si
**cualquiera** de las reglas se cumple. Cuando busca hacer un **scale in**,
solamente lo hará si **todas las reglas se cumplen**. Si necesitas hacer un
_scale in_ cuando solamente alguna de las reglas se cupmle entonces ponlas en
distintas condiciones de escalado.

> No todas las tiers soportan autoscaling, sube a las tiers S1 o P para poder
> habilitarlo.

El portal de Azure te permite visualizar el historial de cambios que las reglas
de autoscaling realizaron en tu servicio dentro de la opción "Scale Out > run
History".

**MEJORES PRÁCTICAS**

- Todos los éxitos y fallos de autoscale se envían al Activity Log, puedes
  configurar alertas en este log para ser notificado cuando haya actividad.
- Asegúrate que los valores máximos y mínimos son diferentes y que tienen un
  margen adecuado entre ellos: Asegúrate de mantener un margen entre ellos pues
  son límites inclusivos y el autoscale solo puede suceder entre estos márgenes.
- Elige la estadística apropiada para tu métrica: La más común es promedio, pero
  no es la única disponible.
- Elige los límites sabiamente para cada tipo de métrica: NO UTILICES REGLAS DE
  LA FORMA (Ya que es posible que al aplicar _scale in_ la cantidad de Threads
  (o la métrica en cuestión) supere de nuevo el límite establecido y tenga que
  hacer scale out de nuevo):
  - Increase instances by on count when Thread Count >= 600
  - Decrease instances by one when Thead Count \<= 600
- Recuerda que si tienes varias reglas por perfil entonces para hacer scale out
  solamente se debe cumplir alguna de todas las reglas mientras que para hacer
  scale in, todas deben cumplirse.
- Siempre selecciona una cantidad segura para la cuenta por defecto de tus
  instancias.

### Automatic Scaling

Se habilita por un Service Plan y se configura para un rango de instancias de
aplicaciones web, monitorea la cantidad de tráfico HTTP recibido y balancea la
carga agregando/removiendo instancias. Los recursos pueden ser compartidos
cuando múltiples aplicaciones de un mismo Service Plan necesitan escalar para
afuera simultáneamente.

Debes usar Automatic Scaling si:

- No quieres definir reglas para autoescalar en base a métricas de recursos.
- Quieres que tus aplicaciones dentro del mismo Service Plan escalen de forma
  distinta e independiente entre ellas.
- Si tu aplicación depende de una base de datos o un sistema legacy, puedes
  definir un límite de escalamiento lo que te permite evitar que sobrecargues
  esa dependencia.

## Deployment Slots

Si utilizas la tier Standard o superior puedes usar un deployment slot separado
del de producción (el por defecto). Los deployment slots son aplicaciones
desplegadas con su propio host name distinto entre ellas. La configuración y el
contenido de la aplicación puede ser intercambiado entre dos deployment slots
incluyendo el de producción.

Los beneficios son:

- Te permite tener una _staging area_ para verificar que la aplicación funciona
  antes de pasarla a producción.
- Todas las instancias del nuevo despliegue ya fueron encendidas para el
  deployment slot por lo tanto no hay downtime y no se pierden requests durante
  el cambio.
- Si algo sale mal, la aplicación que antes estaba en producción se encuentra en
  el slot de staging, por lo que es sencillo regresar de nuevo al último estado
  bueno.

Cada tier soporta una cantidad distinta de deployment slots, no hay cargo extra
por usar los deployment slots, visita
[App Service Limits](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits#app-service-limits).
Si necesitas escalar tu aplicación a otra tier, asegúrate que esa otra tier
soporta la cantidad de slots que tu aplicación ya utiliza.

Puedes desplegar a un slot usando un repositorio diferente o una rama distinta
dentro del mismo repositorio. Por defecto todos los slots nuevos inician sin
contenido.

El proceso para el swap funciona de la siguiente manera:

1. Aplica las siguientes configuraciones del target slot a todos los source
   slots:
   - Slot-specific app settings and connection strings if applicable.
   - CD settings if enabled.
   - App Service Authentication settings, if enabled.

Cuando cualquiera de esas configuraciones son aplicadas al source slot, el
cambio produce un reinicio de todas las instancias del slot. Si se habilita la
opción de realizar el swap con un previw entonces la operación se pausa y te
permite validar que el source slot funcione correctamente con los settings del
target slot.

2. Espera a que todas las instancias del source slot terminen su reinicio, si
   alguna falla la operación es revertida y detenida.
1. Si se habilitó el cache local, inicia una llamada HTTP al root de la
   acplicación en cada instancia del source slot, espera a que cada instancia
   retorne alguna response HTTP. La inicialización del cache local causa otro
   reinicio en cada instancia.
1. Si auto-swap está habilitado con _custom warm-up_ se inicia la iniciación de
   la aplicación hacinedo una request HTTP al root de la aplicación o al path
   que indique `applicationInitialization`. Una instancia es considerada como
   "iniciada" si retorna alguna respuesta HTTP.
1. Si todas las instancias del source slot ya fueron iniciadas de forma
   satisfactoria entonces realiza el swap de ambos slots cambiando las reglas de
   enrutamiento de ambos slots. Luego de este paso el target slot (por ejemplo
   el de producción) tiene la applicación que fue previamente inicalizada en el
   source slot.

En cualquier punto del _swap_ todo el trabajo ocurre en el source slot, el
target slot se mantiene en línea independientemente de si falla o no el _swap_.
Si quieres cambiar el swap de producción con algún otro entorno, asegúrate de
que el de producción siempre sea el target así nunca lo afectas.

Algunas configuraciones pueden cambiar de slot cuando se realiza el swap, otras
no:

| Swapped             | Aren't swapped                                 |
| ------------------- | ---------------------------------------------- |
| General Settings    | Publishing endpoints                           |
| App Settings        | Custom Domain names                            |
| Connection strings  | Nonpublic certificates and TLS/SSL settings    |
| Handler Mappings    | Scale Settings                                 |
| Public Certificates | WebJobs Schedulers                             |
| WebJobs content     | IP restrictiones                               |
| Hybrid connections  | Always On                                      |
| Service endpoints   | CORS                                           |
| Path mappings       | Virtual Network Integration                    |
|                     | Managed identities                             |
|                     | Seetings que terminan con: \_EXTENSION_VERSION |

> Para hacer configuraciones que se puedan cambiar entre slots añade:
> WEBSITE_OVERRIDE_PRESERVE_DEFAULT_STICKY_SLOT_SETTINGS en cada slot de la
> aplicación y asígnale el valor de 0 (o false). Estos settings son o todos
> _swappable_ o ninguno lo es. Managed Identities NUNCA son intercambiables y no
> son afectadas por este setting!

### Auto Swap

Te permite realizar un swap con cada push de código a un determinado slot, **NO
ESTA SOPORTADO PARA LINUX O WEB APP CONTAINERS**.

### Custom WarmUp

La propiedad `applicationInitialization` del `web.config` te permite especificar
acciones de inicialización custom, como por ejemplo realizar varias request a
varias rutas de tu misma aplicación, para así determinar con mejor exactitud
cuando tu app está iniciada o no.

También puedes configurar:

- WEBSITE_SWAP_WARMUP_PING_PATH: El path a darle ping para revisar si tu sitio
  ya funciona, por ejemplo: `/statuscheck`. El valor por defecto es `/`.
- WEBSITE_SWAP_WARMUP_PING_STATUSES: Códigos válidos de respuesta HTTP para la
  operación de inicialización, es una lista separada por comas. Por defecto
  todos los códigos son válidos.
- WEBSITE_WARMUP_PATH: El Path relativo del sitio a usar cada vez que el sitio
  se reinicie (no solo durante slot swaps). por ejemplo: `/statuscheck` o `/`.

Si la operación de swap toma demasiado tiempo, recuerda que puedes ver los logs
en el Activity Log.

### Commands

Para crear un deployment slot desde la consola puedes usar:

```bash
az webapp deployment slot create -n $appName -g $resourceGroup --slot staging
```

Para desplegar código a un slot en específico:

```bash
az webapp deploy -g $resourceGroup -n $appName --src-path ./stagingcode.zip --slot staging
```

La estructura del .zip depende del proyecto, pero para una webapp sencilla:

```
|- css/
|- fonts/
|- img/
|- index.html
|- js/
|- LICENSE
|- README.md
```

### Routing Traffic

Por defecto todas las solicitudes son llevadas a la URL de producción, es decir,
al production slot. Es posible redirigir parte del tráfico a otro slot, por
ejemplo si quisieras tener feedback de usuarios pero todavía no estás listo para
un release total.

**Redirección automática**

Se realiza de forma aleatoria y se especifica por cada slot. Luego de que un
cliente sea redirigido a un slot específico se queda en ese slot por toda la
duración de su sessión. En el browser puedes ver a qué slot esta asociada tu
sesión viendo la cookie: x-ms-routing-name. Si es producción tiene el valor de
"self" sino el nombre del slot.

**Redirección Manual**

Se puede especificar que solamente ciertas requests sean redirigidas. Importante
si quieres tener usuarios en estado beta y otros no. Para hacer un ruteo de
forma manual utilizas el parámetro `x-ms-routing-name` dentro de tu request:

```html
<a href="<webappname>.azurewebsites.net/?x-ms-routing-name=self">Go back to production app</a>
```

Si un slot tiene un porcentaje de 0% en su traffic parameter esto significa que
ningún cliente final es redirigido a este slot, sin embargo, por medio de routeo
manual todavía se puede acceder a ese slot.
