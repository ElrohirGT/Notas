# Estructura de un Compilador

```plantuml
start
-> Flujo de Caracteres;

:Analizador Léxico;
->Flujo de Tokens;

:Analizador Sintáctico;
->Árbol Sintáctico;

:Analizador Semántico;
->Árbol Sintáctico;

:Generador de Código Intermedio;
->Representación Intermedia;

:Optimizador de Código;
note right
No necesariamente da una pasada,
puede dar varias.
end note

->Representación Intermedia;

:Generador de Código;
->Código máquina destino;

:Optimizador de Código independiente de la máquina;
note left
No necesariamente da una pasada,
puede dar varias.
end note

->Código máquina destino;
end
```
