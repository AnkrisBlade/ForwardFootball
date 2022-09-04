## Hito 1

Una vez conocido el proyecto a realizar (ver [Hito 0](Hito_0.md)), se procederemos a definir lo siguiente:


* [Roles](#roles)
* [Escenarios](#escenarios)
* [Historias de usuario](#historias)
* [Milestones](#milestones)
* [Documentación Adicional](#documentación-adicional)


<a name="roles"></a>
### ⚽ Roles ⚽

A continuación, se definirán los distintos roles que existirán en el sistema:

* **Jugador**: El rol jugador se corresponde con los jugadores de un equipo de fútbol. Este tipo de usuarios quiere poder ver su rendimiento durante un partido, comprobar los resultados de un entrenamiento y compararse con el resto de jugadores del equipo.

* **Entrenador**: El rol del entrenador se corresponde con un entrenador de un equipo de fútbol. Este tipo de usuario quiere poder estudiar las condiciones físicas de sus jugadores tanto en un partido como en un entrenamiento.

<a name="escenarios"></a>
### Escenarios

A continuación, se presentarán una serie de escenarios que puedan darse al usarse la aplicación:

##### Escenario 1
>Soy un jugador de un equipo de los países bajos. Mi trabajo consiste en rendir durante un partido de fútbol. Para impedir mi despido me gustaría poder ser capaz de observar mi rendimiento durante el partido y poder compararme con mis compañeros para así saber la dedicación necesaria en mi entrenamiento.

##### Escenario 2
>Soy un jugador de un equipo de los países bajos. Después de hacer un estudio del rendimiento realizado comparado con el de mis compañeros, es mi trabajo mejorar aquellos aspectos que considere necesarios durante un entrenamiento. Me gustaría poder constatar mi dedicación pudiendo saber la distancia recorrida y las calorías consumidas. Del mismo modo me gustaría poder comparar mi esfuerzo con el de mis compañeros.

##### Escenario 3
>Soy un entrenador de un equipo de fútbol. Mi trabajo depende de una administración correcta de los jugadores. Para impedir mi despido me gustaría poder ser capaz de obtener las condiciones físicas de mis jugadores y su rendimiento durante un partido.

##### Escenario 4
>Soy un entrenador de un equipo de fútbol. Después de hacer un estudio del rendimiento mostrado por mis jugadores durante un partido, es mi trabajo asignar entrenamientos de aquellas partes que considere convenientes. Me gustaría poder obtener las condiciones físicas de los jugadores tras el entrenamiento, como el cansancio acumulado o la frecuencia cardíaca, para no causar lesiones entre otras cosas.

<a name="historias"></a>
### Historias de Usuario

A partir de la definición de los roles y una serie de escenarios posibles se extraen las historias de usuario:

* [HU1 - Como jugador, para poder mejorar cada día, necesito conocer mi esfuerzo durante un partido sin tener que depender solamente del tiempo que me dedica el entrenador](https://github.com/vntr-CC/Forward-Football/issues/3)
* [HU2 - Como jugador, para perfeccionar mis capacidades, necesito poder conocer mi esfuerzo durante un entrenamiento sin tener que depender solamente del tiempo que me dedica el entrenador](https://github.com/vntr-CC/Forward-Football/issues/4)
* [HU3 - Como jugador, para ver mi mejora en el equipo, necesito poder comparar mi rendimiento con la media del equipo](https://github.com/vntr-CC/Forward-Football/issues/17)
* [HU4 - Como entrenador, para mejorar mi equipo, necesito conocer el rendimiento de mis jugadores durante un partido sin tener que estar pendiente de todos ellos en todo momento](https://github.com/vntr-CC/Forward-Football/issues/5)
* [HU5 - Como entrenador, para preparar mejor al equipo, necesito conocer el rendimiento de mis jugadores durante un entrenamiento sin tener que estar pendiente de todos ellos en todo momento](https://github.com/vntr-CC/Forward-Football/issues/6)

A partir de estas historias de usuario, se crean las primeras tareas o issues:

* [Se necesita poder leer los datos de un archivo excel](https://github.com/vntr-CC/Forward-Football/issues/7)
* [Se neceista comprobar que el tipado de los datos extraidos es el correcto](https://github.com/vntr-CC/Forward-Football/issues/8)
* [Se necesita conocer el rendimiento de los jugadores durante un partido](https://github.com/vntr-CC/Forward-Football/issues/18)
* [Se necesita conocer el rendimiento de los jugadores durante un entrenamiento](https://github.com/vntr-CC/Forward-Football/issues/19)
* [Se necesita poder comparar el rendimiento de un jugador durante un partido con el de otro](https://github.com/vntr-CC/Forward-Football/issues/11)
* [Se necesita poder comparar el rendimiento de un jugador durante un entrenamiento con el de otro](https://github.com/vntr-CC/Forward-Football/issues/13)

Para observar todos los issues añadidos posteriormente pulsar [aquí](https://github.com/vntr-CC/ForwardFootball/issues).

<a name="milestones"></a>
### Milestones

Las historias de usuario y sus respectivas tareas será agrupadas en los siguientes Milestones:

* [PMV 1 - Se habilita la obtención del rendimiento de un jugador durante un partido](https://github.com/vntr-CC/Forward-Football/milestone/2)
* [PMV 2 - Se habilita la obtención del rendimiento de un jugador durante un entrenamiento](https://github.com/vntr-CC/Forward-Football/milestone/3)
* [PMV 3 - Se habilita la capacidad de comparar el rendimiento de los jugadores](https://github.com/vntr-CC/Forward-Football/milestone/4)

Para observar todos los milestomes añadidos posteriormente pulsar [aquí](https://github.com/vntr-CC/ForwardFootball/milestones).

Dicho rendimiento viene definido por el tiempo entrenado, la frecuencia cardíaca por minuto, el cansancio físico, las calorías consumidas, la velocidad máxima lograda y la distancia cubierta.

<a name="Additional"></a>
## Documentación Adicional

En esta sección se muestra documentación adicional al proyecto que ha sido relevante para el desarrollo del mismo, y otros enlaces de interés:

- Enlace para acceder al archivo [cc.yaml](../../cc.yaml).
- [Enlace](../../src/data/) para acceder a los archivos de donde se obtiene la información de los jugadores, tanto de un partido como del entrenamiento. 
- Enlace para acceder a la entidad [lectura_BasicInfo](../../src/leer_Partido.jl) que se encarga de sustraer la información de los archivos de datos sobre un partido.
- Enlace para acceder a la entidad [lectura_TrainInfo](../../src/leerTrainInfo.jl) que se encarga de sustraer la información de los archivos de datos sobre un entrenamiento.
- Enlace para acceder a la entidad [jugador.jl](../../src/jugador.jl) que contiene las funciones necesarias para conocer el esfuerzo de un jugador.
- Enlace para acceder a la entidad [entrenador.jl](../../src/entrenador.jl) que contiene las funciones necesarias para conocer el rendimiento de los jugadores de un equipo.
- [Hito 0](Hito_0.md)
- [Hito 2](Hito_2.md)
- [Inicio](../../README.md)
