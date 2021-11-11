## Hito 2

Una vez conocido el proyecto a realizar (ver [Hito 0](https://github.com/vntr-CC/Forward-Football/blob/main/Documentacion/Hitos/Hito-0.md)), y conocido los diferentes roles, los escenarios, las primeras historias de usuario y los primeros milestones (ver [Hito 1](https://github.com/vntr-CC/ForwardFootball/blob/main/Documentacion/Hitos/Hito-1.md)), es momento de definir el gestor de tareas que emplearemos e implementar los diferentes tests que van a cubrir el código del sistema.


* [Gestor de Tareas](#tareas)
* [Biblioteca de Aserciones](#aserciones)
* [Marco de Pruebas](#pruebas)
* [Metodología de diseño software](#metodologia)

<a name="tareas"></a>
### Gestor de Tareas 📓
Un [gestor de tareas o herramienta de construcción](https://jj.github.io/curso-tdd/temas/gestores-tareas.html):

> Permite usar, como subcomandos de un solo programa y especificados en un solo fichero, todas las tareas que se tienen que llevar a cabo con una aplicación, desde su compilación hasta la generación de la documentación pasando por todo lo necesario para ejecutar todo tipo de tests y desplegarlo.

Para realizar esta cometido en el lenguaje de programación Julia haremos uso del servicio de Integración Contínua de **Travis CI**. Donde primeramente comprobará la integración del proyecto ejecutando los tests y posteriormente inicializará los pasos necesarios para su compilación y generación de la documentación.
Para ver otras opciones haga clic [aquí](https://github.com/vntr-CC/Forward-Football/blob/main/Documentacion/Hitos/gestor-tareas.md).

<a name="aserciones"></a>
### 📚 Biblioteca de Aserciones 📚

Julia está en rápido desarrollo y tiene un extenso conjunto de pruebas para verificar la funcionalidad en múltiples plataformas. En este caso haremos uso del módulo **Test** en conjunto con **SafeTestsets** para la definición de los diferentes tests que cubren los múltiples aspectos de la lógica de negocio. Para ver otras opciones haga clic [aquí](https://github.com/vntr-CC/Forward-Football/blob/main/Documentacion/Hitos/biblioteca-aserciones.md)

Comentar que al desarrollar el proyecto puramente en Julia, la necesidad de un archivo `build.jl` desaparece. Gracias al archivo del proyecto `Project.toml` que describe el proyecto a un nivel alto, conteniendo por ejemplo, las dependencias de los diferentes paquetes o las restricciones de compatibilidad. También en él se definen diferentes campos que nos permiten diferenciar los paquetes que necesitamos en las diferentes fases de compilación. En nuestro caso, al utilizar dos librerrías para los tests, definiendo sus dependencias bajo el campo `extras`, nos aseguramos que estas librerías solo se instalarán en el proceso de testeo del proyecto.

<a name="pruebas"></a>
### ✅ Marco de Pruebas ❎
Para utilizar y lanzar los tests en Julia, solo necesitamos tener Julia instalado y añadir el proyecto como paquete a un ecosistema de nuestra elección. Nosotros lo instalaremos en el que se crea por defecto, pero aconsejamos que si se va a descargar software de terceros se inicialice en un ecosistema diferente en caso de causar fallos de dependencias que podría haber con otros paquetes que tuviera ya instalados. Los pasos son los siguientes:

Una vez abierto el REPL de Julia, presionamos `]`, en el teclado español se realiza mediante `AltGr + ]`, para entrar en el REPL del administrador de paquetes (para retornar presionar la tecla `Delete`). Luego indicamos el paquete a añadir que en nuestro caso es la dirección de este repositorio:

```julia-repl
(@v1.6) pkg> add https://github.com/vntr-CC/ForwardFootball.git
```
Una vez instalado, somos capaces de testearlo dentro del mismo REPL de la siguiente manera:
```julia-repl
(@v1.6) pkg> test PerformFootball
```

<a name="metodologia"></a>
### 📝 Metodología de diseño software 📝

A la hora de implementar los tests, haremos uso de la metodología TDD para comprobar el funcionamiento general del código, y haremos uso de la metodología BDD para comprobar el comportamiento indicado por las historias de usuario.

Para comprobar cuántas funcionalidades de nuestro proyecto están cubiertos por los tests, podemos hacer uso de [Coveralls](https://coveralls.io/) o [Codecov](https://about.codecov.io/).
