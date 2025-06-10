# Architecture and Services

## Azure Account

Azure tiene cuentas las cuales generalmente representan el nivel más alto de la
jerarquía, esta cuenta se puede dividir en varias subscripciones las cuales
tienen permisos distintos sobre los recursos.

## Azure Infrastructure

La infraestructura de azure se puede agrupar en 2:

- **Physical Infrastructure**: Inicia con los _datacenters_, que están agrupados
  en regiones (también llamadas "Availability Zones").

  - Region: Es un área geográfica que contiene por lo menos 1 _datacenter_ pero
    generalmente más, todos juntos en una red de baja latencia.
  - Availabilty Zone: Son zonas físicamente separadas dentro de una región.
    Puede tener uno o más _datacenters_. Si una cae las otras dos pueden tomar
    su lugar. **No todas las regiones tienen Availability Zones**.
  - Region Pairs: Cada región tiene una pareja asignada, si ocurre algún evento
    catastrófico que destruya o inhabilite todas las zonas dentro de la región
    los recursos se trasladan a esta pareja. **No todos los recursos se duplican
    de forma automática**.
  - Sovereign Regions: Son instancias de Azure que no están asociadas a la
    primaria de todo el mundo, usada en China y el Gobierno de US.

- **Management Infrastructure**: Incluye las cuentas, subscripciones, grupos de
  recursos y los recursos en sí mismos.

  - Resource Group: Un recurso puede estar solamente en un grupo a la vez y
    tampoco pueden estar unos grupos dentro de otros. **Todo recurso está
    asociado a un grupo**.
  - Azure Subscriptions: Te ayudan a organizar de forma lógica tus grupos de
    recursos y facilitan la facturación. Puedes usar la subscripción para
    definir límites sobre productos, servicios o recursos, hay dos tipos de
    límites:
    - Billing Boundary: Azure genera reportes separados para cada subscripción
      para manejar mejor el tema de costos.
    - Acces Control Boundary: Azure puede aplicar reestricciones de acceso al
      nivel de la subscripción para ciertos recursos, reflejando así la
      estructura de la organización.
  - Management Group: Así como los _resource group_ te permiten agrupar
    recursos, los _management group_ te permiten agrupar subscripciones. A
    diferencia de los _resource groups_ estos sí permiten tener varios niveles
    de jerarquía, así que podemos tener un grupo dentro de otro.
    - 10,000 grupos es el límite por directorio.
    - 6 niveles de profundidad es el límite, no incluye el nivel root.
    - Cada grupo puede tener solamente 1 papá.

Las subscripciones también se pueden usar para ambientes de desarrollo, teniendo
algún límite para el ambiente de testing y development, y límites de acceso para
la subscripción productiva.
