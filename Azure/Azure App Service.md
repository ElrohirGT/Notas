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
