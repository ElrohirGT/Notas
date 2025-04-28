# Network

## REST vs SOAP

REST: REpresentational State Transfer SOAP: Simple Object Access Protocol

Ambos son enfoques de diseño de API, SOAP es altamente estructurado y fuerza a
utilizar el formato XML, mientras que REST es más flexible y permite múltiples
formatos.

- Ambos describen reglas y estándares sobre cómo se deben comunicar las
  aplicaciones.
- Ambos utilizan HTTP y tienen soporte para SSL/TLS.

REST se creó luego de SOAP y soluciona muchos de los problemas de éste último.

Ventajas de SOAP:

- Permite invocar procedimientos remotos de muchos lenguajes.
- Es posible transmitir texto por medio de HTTP o de SMTP y FTP.

Desventajas de SOAP:

- Debido a usar XML es mucho más lento.
- Depende del WSDL (WebService Description Language) el cual se utiliza para
  describir la interfaz.
- No es soportado en todos los lenguajes al 100%, en especial los más nuevos.

Ventajas de REST:

- Tiene operaciones bien definidas (POST, GET, etc).
- Consume pocos recursos en comparación.
- Se puede usar con casi cualquier lenguaje.
- Dependiendo del diseño de la API, puede que traigamos más información de la
  que realmente necesitamos.
- Si no se sabe gestionaro con cautela, la seguridad podría ser difícil.

REST se ajusta mejor a casos de uso "stateless" y escalables, generalmente su
arquitectura es mucho más fácil de mantener. Además también se utiliza para
servicios que requieren comunicación en REALTIME.

SOAP se ajusta mejor para sistemas que necesitan un método muy seguro y
confiable para intercambiar data entre aplicaciones
