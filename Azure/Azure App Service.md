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
