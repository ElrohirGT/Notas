# Models

AWS permite definir modelos para compartir entre las API endpoints. Estos
modelos se definen utilizando
[JSON Schema](https://json-schema.org/learn/getting-started-step-by-step). Por
ejemplo el siguiente schema define un objeto Producto de un catálogo inventado:

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://example.com/product.schema.json",
  "title": "Product",
  "description": "A product from Acme's catalog",
  "type": "object",
  "properties": {
    "productId": {
      "description": "The unique identifier for a product",
      "type": "integer"
    },
    "productName": {
      "description": "Name of the product",
      "type": "string"
    },
    "price": {
      "description": "The price of the product",
      "type": "number",
      "exclusiveMinimum": 0
    },
    "tags": {
      "description": "Tags for the product",
      "type": "array",
      "items": {
        "type": "string"
      },
      "minItems": 1,
      "uniqueItems": true
    },
    "dimensions": {
      "type": "object",
      "properties": {
        "length": {
          "type": "number"
        },
        "width": {
          "type": "number"
        },
        "height": {
          "type": "number"
        }
      },
      "required": [ "length", "width", "height" ]
    },
    "warehouseLocation": {
      "description": "Coordinates of the warehouse where the product is located.",
      "$ref": "https://example.com/geographical-location.schema.json"
    }
  },
  "required": [ "productId", "productName", "price" ]
}
```

Para definir una validación del body de una request de acuerdo a un modelo se
cambia el `Method Request` para que valide el body de la request y se selecciona
el schema a usar para validar.
