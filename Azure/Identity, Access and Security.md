# Identity Access And Security

Microsoft Entra ID es un servicio de directorios, te permite acceder tanto a
aplicaciones de Microsoft como aplicaciones propias que estén en la Nube.

Microsoft Entra ID es para:

- IT Administrators: Para controlar el acceso a aplicaciones y recursos según
  los requerimientos del negocio.
- App Developers: Para proveer un estándar sobre el cuál agregar funcionalidad a
  las aplicaciones que construyen como SSO.
- Users: Pueden usar Microsoft Entra ID para construir identidades y tomar
  acciones de mantenimiento en sus cuentas como resetear su contraseña.
- Online Service Subscribers: Microsoft 365, Azure, Microsoft Dynamics CRM
  Online y demás ya utilizan Microsoft Entra Id para autenticarse dentro de sus
  cuentas.

Es básicamente el Cognito de Azure.

## Métodos de Autenticación

### SSO (Single Sign-On)

Permite a los usuarios iniciar sesión una sola vez y usar esas mismas
credenciales entre varios recursos o aplicaciones. Para que funcione muchas
aplicaciones deben confiar en el autenticador inicial.

### MFA (Multifactor Authentication)

Permite proteger al usuario en casos de que la contraseña haya sido
comprometida.

## External Identities

Se define una _External Identity_ como aquella persona, dispositivo, servicio,
etc que se encuentra fuera de tu organización. Por ejemplo un usuario puede
autenticarse usando su cuenta de google, pero se maneja el acceso igual usando
Microsoft Entra Id.

## Conditional Access

Son señales que le dicen a Microsoft Entra ID si debe permitir o denegar el
acceso a recursos. Algunas pueden ser: la identidad del usuario, en dónde se
encuentra el usuario geográficamente hablando, qué dispositivo está intentando
acceder y demás.

## Azure RBAC (Role Based Access Control)

Azure permite generar jerarquías de roles para tener un control más granular
sobre los permisos a los recursos de la organización. Funcionan de forma similar
a AWS. El _scope_ de un _role_ se refiere a qué recursos, subscripciones, y
grupos (tanto de recursos como de manejo) aplica.
