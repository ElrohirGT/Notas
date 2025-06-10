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

## Services

### Virtual Machines

VMs proveen IaaS en la forma de un contenedor virtualizado. Son ideales cuando:

- Se necesita control total del OS.
- La habilidad de correr software custom.
- Se necesita configuraciones custom del hosting.

Para escalar las _virtual machines_ se les puede agrupar usando _scale sets_ o
_availability sets_.

- Scale sets: Te permiten compartir configuraciones entre máquinas virtuales lo
  que te permite manejar, configurar o actualizar una gran cantidad de VM's en
  minutos. La cantidad de VM's puede crecer de acuerdo a demanda o puede crecer
  de acuerdo a un horario predefinido. Además también se usa un _load balancer_
  de forma automática.

- Availability sets: Te permiten salvaguardar tus VM's contra fallos de red o
  energía. Funcionan creando dos subgrupos:

  - Update Domain: Agrupa todas las VM's que pueden ser reiniciadas al mismo
    tiempo.
  - Fault Domain: Agrupa todas las VM's que comparten fuente de energía y red.

Algunos ejemplos de cuándo usar VM's incluyen:

- Durante el desarrollo y el testeo de aplicaciones.
- Cuando se corren aplicaciones en la nube.
- Cuando buscas extender tu _datacenter_ en la nube.
- Para recuperarte de algún altercado.

To create a VM using the terminal utility you can use:

```bash
az vm create --resource-group "learn-92a251e5-7779-49a4-8de9-de5c7f24bbb9" --name my-vm --public-ip-sku Standard --image Ubuntu2204 --admin-username azureuser --generate-ssh-keys
```

To run a script hosted on github inside of a VM using the terminal utility you
can use:

```bash
az vm extension set --resource-group "learn-92a251e5-7779-49a4-8de9-de5c7f24bbb9" --vm-name my-vm --name customScript --publisher Microsoft.Azure.Extensions --version 2.1 --settings '{"fileUris":["https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh"]}' --protected-settings '{"commandToExecute": "./configure-nginx.sh"}'
```

**Azure Virtual Desktop**

Es un tipo de máquina virtual que permite tener una versión de Windows hosteado
en la nube para acceso de varias computadoras. Para conectarse a estos
escritorios simplemente utiliza un software de escritorio virtual o un
navegador.

### Azure Containers

Máquinas virtuales mucho más livianas, Azure soporta docker engine. Hay 3
servicios que soporta Azure para manejo de contenedores:

- **Azure Container Instances**: Son la forma más sencilla de correr
  contenedores, puedes verlo como un 1o1 a correrlos localmente solo que en la
  nube.
- **Azure Container Apps**: Similar a las instancias de contendor, cuentan
  además con escalado y _load balancing_ incorporado.
- **Azure Kubernetes Service (AKS)**: El servicio de Azure que permite tener
  Kubernetes en su nube.

### Azure Functions

Las AWS Lambdas de Azure. Existen de dos tipos:

- Stateless: Cada vez que el evento que las levanta surge, es como si comenzaran
  desde 0.
- Statefull (Durable Functions): Se pasa un contexto como parámetro de la
  función, el cual permite guardar información de las ejecuciones anteriores.

### Azure App Service

Te permite construir y hostear web apps, _background jobs_, _backends_ y
_RESTful APIs_ en una variedad de lenguajes de programación sin tener que
manejar la infraestructura. Te provee escalado y alta disponibilidad de forma
automática, además soporta tanto Windows como Linux y ofrece CI/CD con Github,
Azure DevOps o algún otro repositorio de Git.

**Está enfocado al área web**, aunque para backends de apps de teléfono permite
guardar datos en SQL, realizar Logins con Google, X, MSA entre otros así como
mandar notificaciones Push.

### Azure Virtual Networking

Permite que recursos como VMs, Web Apps y bases de datos se comuniquen entre sí,
con usuarios en internet o con computadoras on-premise. Te permiten realizar:

- Segmentación.
- Comunicación a través de internet.
- Comunicación entre recursos de Azure.
- Comunicación con recursos on-premise.
- Dirigir el tráfico de la red.
- Filtrar el tráfico de la red.
- Conectar otras redes virtuales.

También permiten generar endpoints privados o públicos según quién los pueda
acceder, en donde privado significa miembros de la misma red y públicos,
cualquier persona del internet.

Para agregar una regla de seguridad a una NSG (Network Security Group):

```bash
az network nsg rule create --resource-group "learn-92a251e5-7779-49a4-8de9-de5c7f24bbb9" --nsg-name my-vmNSG --name allow-http --protocol tcp --priority 100 --destination-port-range 80 --access Allow
```

Para listar las reglas asociadas a una cierta NSG puedes usar:

```bash
az network nsg rule list --resource-group "learn-92a251e5-7779-49a4-8de9-de5c7f24bbb9" --nsg-name my-vmNSG --query '[].{Name:name, Priority:priority, Port:destinationPortRange, Access:access}' --output table
```

### Azure Virtual Private Network

Una VPN usa un tunel encriptado dentro de otra red. Generalmente son usadas para
conectar dos o más redes privadas sobre una tercera red que se desconfía de
ella.

### Azure ExpressRoute

Te permite extender las redes _on-premise_ hacia la nube de Microsoft sobre una
conección privada.

### Azure DNS

Es un servicio de hosteo para dominios DNS que te provee la resolución de los
nombres usando la infraestructura de Microsoft Azure. Si hosteas tus dominios
con Azure puedes usar las mismas herramientas que usas para tus otros servicios
para tu dominio.
