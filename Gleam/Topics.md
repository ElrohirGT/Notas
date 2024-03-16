# Function Captures
En Gleam se pueden escribir lambdas del tipo:
```gleam
let add_one_v1 = fn(x) { add(1, x) }
```

Como:
```gleam
let add_one_v1 = add(1, _)
```

Esta sintaxis es válida solamente cuando la función anónima tiene un solo argumento. Esta funcionalidad ayuda mucho al momento de hacer [currying](https://es.wikipedia.org/wiki/Currificaci%C3%B3n).

# Pipelines
En Gleam existe el concepto de `pipe` como en bash. Se ve de la siguiente forma:
```gleam
// Without the pipe operator
io.debug(string.drop_left(string.drop_right("Hello, Joe!", 1), 7))

// With the pipe operator
"Hello, Mike!"
  |> string.drop_right(1)
  |> string.drop_left(7)
  |> io.debug
```

## ¿Cómo funciona?
Si se tiene la siguiente pipeline:
```gleam
a
  |> b(1,2)
```

Entonces Gleam primero intenta `b(a,1,2)` y si esto es inválido entonces intenta `b(1,2)(a)`. Recuerda que puedes usar Funcition Captures para determinar el lugar en el que quieres insertar el parámetro:
```gleam
"1"
  |> string.append("2")
  |> string.append("3", _)
  |> io.debug

// outputs: "312"
```

# Deprecations
Las funciones o tipos pueden ser marcadas como deprecadas utilizando:
```gleam
@deprecated("Use new_function instead")
fn old_function() {
  Nil
}
```

# Pattern Matching
Se puede realizar pattern matching usando el `switch`. Parece que el pattern matching es bien avanzado en Gleam. Hasta puedes hacer  casos como todas las cadenas que inician con `Hello`:
```gleam
case x {
    "Hello, " <> name -> name
    _ -> "Unknown"
}
```

Puedes hacer pattern matching de varios valores utilizando una coma:
```gleam
case x,y {
    _,_ -> io.println("Hello")
}
```

También puedes asignar aliases a patrones para guardarlos en variables y usarlos dentro de la expresión del caso:
```gleam
fn get_first_non_empty(lists: List(List(t))) -> List(t) {
  case lists {
    [[_, ..] as first, ..] -> first
    [_, ..rest] -> get_first_non_empty(rest)
    [] -> []
  }
}
```

Además se pueden agregar `Guards` a los cases de un switch, estas `Guards` son `if`s sencillos que no pueden llamar a funciones externas y solo pueden usar un set limitado de operaciones, para que un caso sea elegido su `Guard` debe retornar `True`:
```gleam
fn get_first_larger(lists: List(Int), limit: Int) -> Int {
  case lists {
    [first, ..] if first > limit -> first
    [_, ..rest] -> get_first_larger(rest, limit)
    [] -> 0
  }
}
```

# Loops
Gleam no tiene loops, en su lugar tienes que usar recursión! La librería estándar provee algunas utilidades para cerrar un poco la brecha pero es posible que la forma más clara de resolver un problema sea creando tu propia función recursiva.

## Tail calls
Es una optimización que ahorra la generación del último stack para una función recursiva. Generalmente para que una función pueda aprovecharse de esta optimización debe hacer uso de un acumulador, por ejemplo si quisiéramos pasar la siguiente función factorial para que utilize esta optimización haríamos:
```gleam
// Sin optimización
pub fn factorial(x: Int) -> Int {
  case x {
    // Base case
    1 -> 1

    // Recursive case
    _ -> x * factorial(x - 1)
  }
}

// Con optimización (se le agregó el acumulador)
pub fn factorial(x: Int) -> Int {
  // The public function calls the private tail recursive function
  factorial_loop(x, 1)
}

fn factorial_loop(x: Int, accumulator: Int) -> Int {
  case x {
    1 -> accumulator

    // The last thing this function does is call itself
    // In the previous lesson the last thing it did was multiply two ints
    _ -> factorial_loop(x - 1, accumulator * x)
  }
}
```

## Iterating over a list
Por ejemplo si quisiéramos iterar sobre una lista para sumar todos sus valores podríamos escribir:
```gleam
fn sum_list(list: List(Int), total: Int) -> Int {
  case list {
    [first, ..rest] -> sum_list(rest, total + first)
    [] -> total
  }
}
```

# Tuples
Gleam tiene soporte para tuplas, aunque la sintaxis no es la más común:
```gleam
let triple = #(1, 2.2, "three")
io.debug(triple)

let #(a, _, _) = triple
io.debug(a)
io.debug(triple.1)
```

# Types
Types en Gleam son Union Types como en Rust. No existen los structs o clases, para definir un struct simplemente se crea un type con una única variante:
```gleam
pub type SchoolPerson {
  Teacher(name: String, subject: String, floor: Int, room: Int)
}

pub fn main() {
  let teacher1 = Teacher(name: "Mr Dodd", subject: "ICT", floor: 2, room: 2)

  // Use the update syntax
  let teacher2 = Teacher(..teacher1, subject: "PE", room: 6)

  io.debug(teacher1.subject)
  io.debug(teacher2.subject)
}
```

# Genéricos
Los genéricos tanto en funciones como en tipos de aplican usando un nombre para el tipo de la variable/atributo en lugar de una clase existente:
```gleam
// Enum genérico para cualquier `inner`
pub type Option(inner) {
  Some(inner)
  None
}
```

# Nil
`Nil` es el tipo unitario de Gleam, no existe el `null` o `undefined` en Gleam. Si una función no retorna nada entonces retorna `Nil`.

# Bit arrays
Son una estructura conveniente para representar data binaria, pueden opcionalmente incluir una tag al final para indicar la conversión a utilizar para binario, por el momento no todos los tipos de conversiones son soportados en javascript:


    size: the size of the segment in bits.
    unit: how many times to repeat the segment.
    bits: a nested bit array of any size.
    bytes: a nested byte-aligned bit array.
    float: a 64 bits floating point number.
    int: an int with a default size of 8 bits.
    big: big endian.
    little: little endian.
    native: the endianness of the processor.
    utf8: utf8 encoded text.
    utf16: utf16 encoded text.
    utf32: utf32 encoded text.


```gleam
pub fn main() {
  // 8 bit int. In binary: 00000011
  io.debug(<<3>>)
  io.debug(<<3>> == <<3:size(8)>>)

  // 16 bit int. In binary: 0001100000000011
  io.debug(<<6147:size(16)>>)

  // A bit array of UTF8 data
  io.debug(<<"Hello, Joe!":utf8>>)
}
``` 

# Use
