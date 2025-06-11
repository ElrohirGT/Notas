# Azure Management and Governance

## Costs in Azure

El modelo de costos de Azure es _pay as you go_ pero también se puede pagar por
una reserva fija de cómputo por 1-3 años con descuento (incluso 72% de
descuento!). Este segundo modelo además tiene como _backup_ el _pay as you go_
por lo que si en algún momento las estimaciones fueron erróneas y se necesita
más puedes pagar el extra usado con el modelo normal de Azure.

### Price Calculators

Existen 2 calculadoras de precio para Azure:

- **Pricing Calculator**: Está diseñada para dar un estimado sobre el costo de
  los recursos en Azure
- **TCO Calculator**: (Total Cost of Ownership). Esta calculadora está diseñada
  para comparar el precio de correr la infraestructura _on-premise_ versus en la
  nube de Azure.

[Link a la calculadora de precios](https://azure.microsoft.com/en-us/pricing/calculator/)

### Cost Management

Es un servicio de Azure que te permite crear presupuestos y alertas en base a
costos y predicciones de consumo.

## Microsoft Purview

Es una familia de herramientas que te permite tener una vista unificada de toda
tu data en la nube (incluso _buckets_ de S3).

## Azure Policy

Te permite asegurarte que todos tus recursos sigan una cierta combinación de
reglas y te alerta en dado caso no lo hagan debido a un cambio en la
configuración. Las pólizas se pueden agrupar en lo que se llama iniciativas.

Las pólizas se pueden aplicar a cualquier nivel de la jerarquía de recursos y se
heredan a todos los hijos.

Si necesitas que algún recurso en específico no cumpla con la póliza, lo puedes
marcar como una excepción, así que siempre tienes el control total del ambiente.

## Resource Locks

Previenen que un recurso sea borrado o actualizado de forma accidental. Para
editar un recurso que ha sido bloqueado con uno de estos locks, primero se debe
remover el lock y luego podrá editar o modificar lo que sea que tenga permiso a
modificar según su role en el recurso.

## Azure Arc

Te permite extender tu verificación y monitoreo de recursos a configuraciones
híbridas o _multicloud_.

## Azure Resource Manager (ARM)

Es el servicio de despliegue de Azure. Te permite crear, modificar y borrar
recursos de tu cuenta de Azure. Funciona por medio de templates.

Una Azure Resource Template es un archivo JSON que define qué quieres desplegar
en Azure.

### Bicep

Es un lenguaje declarativo para desplegar recursos en Azure. Tienden a usar una
sintaxis más simple y conscia que el JSON de las Azure templates.

## Azure Advisor

Mira todos tus recursos y hace recomendaciones para mejorar la seguridad,
rendimiento o confianza, también ayuda a reducir costos.

## Azure Service Health

Te permite saber el estatus de cualquier recurso dentro de tu infraestructura en
la nube.

## Azure Monitor

Recolecta información sobre tus recursos, ya sea métricas, logs, traces y te
permite analizarla, visualizarla o incluso actuar de forma automática según los
resultados (como por ejemplo lanzar alertas o auto escalar).
