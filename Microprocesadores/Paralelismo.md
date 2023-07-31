# Paralelismo
Existen distintos tipos de paralelismo:
* **Data-level (DLP)**: Elementos de datos que pueden procesarse al mismo tiempo.
* **Task-level (TLP)**: Tareas que pueden operar independientemente y en paralelo.
* **Instruction-level (ILP)**: aprovecha DLP a través del compilador, aprovecha pipelines y ejecución especulativa (branch prediction).

## Taxonomía de Flynn
|Datos/Instrucciones|Datos Simples| Datos múltiples|
|---|---|---|
|Simples | (SISD) Uniprocesadores| (SIMD) ILP, GPUs, uP vectoriales|
|Múltiples | (MISD) Sin aplicaciones prácticas| (MIMD) Clusters, Warehouse, HPC|
