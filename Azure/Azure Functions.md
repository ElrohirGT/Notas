# Azure Functions

Azure Functions permite desarrollar aplicaciones sin servidor en Azure. Son el
equivalente a AWS Lambdas. De la misma forma que las Lambdas, Azure Functions
soportan Triggers, para iniciar la ejecución del código y _bindings_ para
simplificar el input y output de la data.

## Comparación con Azure Logic Apps

Ambos permiten entornos de trabajo serverless. Azure Functions permiten
computación serverless, mientras Azure Logic Apps es una plataforma de
integración.

| Topic             | Azure Functions                                                      | Logic Apps                                                                                              |
| ----------------- | -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Development       | Code-first                                                           | Designer-first                                                                                          |
| Connectivity      | About a dozen built-in binding types, write code for custom bindings | Larger collection of connectors, Enterprise integration Pag for B2B scenarios, build custom connectors. |
| Actions           | Each activity is an Azure Function; Write the code for the activity. | Large collection of ready-made actions                                                                  |
| Monitoring        | Azure Application Insights                                           | Azure portal, Azure Monitor logs                                                                        |
| Management        | REST API, Visual Studio                                              | Azure portal, REST API, PowerShell, Visual Studio                                                       |
| Execution Context | Runs in Azure or locally                                             | Runs in Azure, locally or on premises                                                                   |

## Comparación con WebJobs

Ambos son centrados en developers y con un enfoque de código, ambos usan App
Service y soportan integración con source control, authenticación y monitoreo
usando Application Insights. Azure Functions está construido encima del WebJobs
SDK, así que comparte muchos de los mismos eventos y conectores.

| Factor                                      | Functions                                                                                  | WebJobs with SDK                                                                                                        |
| ------------------------------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| Serverless App Model with Automatic Scaling | YES                                                                                        | NO                                                                                                                      |
| Develop and test in browser                 | YES                                                                                        | NO                                                                                                                      |
| Pay-per-use pricing                         | YES                                                                                        | NO                                                                                                                      |
| Integration with Logic Apps                 | YES                                                                                        | NO                                                                                                                      |
| Trigger Events                              | Los mismos que WebJobs (a excepción de File System) y agrga HTTP/Webhook, Azure Event Grid | Timer, Azure Storage Queues y blobs, Azure Service Bus Queues y topic, Azure Cosmos DB, Azure Event Hubs y File system. |

Para muchos escenarios, Azure Functions son la mejor opción entre WebJobs y
ellos.

## Hosting Options

| Hosting Option        | Service              | Availability             | Container Support |
| --------------------- | -------------------- | ------------------------ | ----------------- |
| Consumption Plan      | Azure Functions      | Generally Available (GA) | None              |
| Flex Consumption Plan | Azure Functions      | Generally Available      | None              |
| Premium Plan          | Azure Functions      | Generally Available      | Linux             |
| Dedicated Plan        | Azure Functions      | Generally Available      | Linux             |
| Container Apps        | Azure Container Apps | Generally Available      | Linux             |

La opción de Hosting que selecciones dicta:

- Cómo la aplicación escala.
- Los recursos disponibles para cada _function app instance_.
- Soporte para funcionalidad avanzada como Azure Virtual Network Connectivity.
- Soporte para contenedores de Linux.
- Los costos de correr tu función.

### Consumption Plan

Es el plan por defecto, pagas por los recursos de computación solamente cuando
tus funciones están corriendo con automatic scale. Las instancias de tu función
son añadidas y removidas según el número de eventos que llegan.

### Flex Consumption Plan

Igual que el Consumption Plan y agrega: opciones de cómputo, virtual networking,
y reducción de los _cold starts_ pues te permite tener un número de funciones
siempre listas, sigue escalando según la demanda.

### Premium Plan

Igual que el Flex Consumption Plan pero las instancias son más poderosas. Se
recomienda cuando:

- Las _Function Apps_ corren de forma continua o casi continua.
- Quieres más control sobre las instancias y quieres desplegar múltiples
  _Function apps_ en el mismo plan con _event-driven scaling_.
- Tienes un alto número de pequeñas ejecuciones pero un gran costo de ejecución,
  pero bajos GB/s en el Consumption Plan.
- Necesitas más opciones de CPU o memoria.
- Tu código necesita correr más tiempo que el máximo dado por el _Consumption
  Plan_.
- Necesitas conectividad a redes virtuales.
- Necesitas especificar una imagen Linux custom en la cual correr tus funciones.

### Dedicated Plan

Corre las funciones en App service a los mismos precios que App Service. Es
mejor usar este plan para casos donde la función necesita correr por mucho
tiempo y no se puede usar _Durable Functions_. Consideralo para:

- Si necesitas tener una facturación completamente predecible o te gustaría
  escalar de forma manual las instancias.
- Te gustaría correr múltiples aplicaciones web o funciones en el mismo plan.
- Necesitas acceso a mayores opciones de cómputo.
- Completo aislamiento y acceso de red seguro proveído por App Service
  Environment (ASE).
- Mayor uso de memoria y alta escalabilidad (ASE).

### Container Apps

Las _Function Apps_ serán desplegadas en un ambiente completamente manejado por
Azure Container Apps. Considera usarlo si:

- Necesitas usar librerías custom dentro de tu mismo código.
- Necesitas migrar código _on premise_ o legacy a microservicios de la nube que
  corran en contenedores.
- Quieres evitar la complejidad de manejar tu propio kluster de kubernetes y
  cómputo dedicado.
- Necesitas el alto poder de procesamiento de recursos de CPU dedicado.

## Timeout

La propiedad `functionTimeout` del `host.json` indica el timeout al correr tu
apliación para las funciones dentro de tu aplicación.

| Plan                  | Default | Maximo    |
| --------------------- | ------- | --------- |
| Flex Consumption Plan | 30      | Unbounded |
| Premium Plan          | 30      | Unbounded |
| Dedicated Plan        | 30      | Unbounded |
| Container Apps        | 30      | Unbounded |
| Consumption Plan      | 5       | 10        |

Algunas anotaciones importantes:

- Sin importar el timeout definido para la ejecución de la función, si el evento
  de origen fue una request HTTP, 230s es la máxima duración que el Azure Load
  Balancer espera antes de responder de forma automática. Si se tiene tiempos de
  procesamiento más largos se recomienda usar el patrón:
  [Durable Functions Async Pattern](https://learn.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-overview?tabs=in-process%2Cnodejs-v3%2Cv1-model&pivots=csharp#async-http).
- No hay un máximo de timeout de ejecución, sin embargo se le da 60mins durante
  un scale-in en el Flex Consupmtion Plan y Premium Plan, y 10mins durante
  actualizaciones de plataforma.
- Para el _Dedicated Plan_ se necesita que el plan esté con el setting de
  _Always On_. Se da un período de gracia de 10mins para las actualizaciones de
  plataforma.
- Para las _Container Apps Plan_, si el número de replicas mínimas es 0 el
  time-out por defecto depende de los triggers específicos usados en el app.
