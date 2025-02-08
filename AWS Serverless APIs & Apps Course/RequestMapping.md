# Request/Response Body Mapping

Es buena práctica hacer que tus lambdas solamente tomen como argumentos las
cosas que necesitan. Tu request posiblemente tenga más datos de los que la
lambda necesita para funcionar. Si este es el caso se puede utilizar una técnica
que se llama **body mapping**.

Esta técnica consiste en agregar una acción dentro de la `Integration Request`.
Esta acción utiliza [Apache Velocity](https://velocity.apache.org/) como su
lenguaje principal para extraer información de la request original. Por ejemplo:

Este objeto...

```json
    {
        person: {
            name: "Max",
            age: 28
        },
        order: {
            id: "6asdf821ssa"
        }
    }
```

Se convierte en:

```json
    {
        personName: "Max",
        orderId: "6asdf821ssa"
    }
```

Al utilizar la siguiente body mapping:

```json
    {
        "personName": "$input.json('$.person.name')",
        "orderId": "$input.json('$.order.id')"
    }
```

Es importante notar que las propiedaes dentro de la body mapping están con "".
Esto se debe a que `personName` y `orderId` son propiedades de tipo string. Si
fueran números, objetos o booleans no harían falta los "".

La variable `$input` es una proveída por AWS y se refiere al body original de la
request. La función json parsea el atributo dado por la request original y
`$.person.name` se refiere a `[objeto original].person.name` en la request
original. Para más información puedes ver
[las otras variables y funciones que ofrece AWS](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-mapping-template-reference.html#input-variable-reference).
