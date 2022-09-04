# ForwardFootball.jl

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Build Status](https://app.travis-ci.com/vntr-CC/ForwardFootball.svg?branch=main)](https://app.travis-ci.com/github/vntr-CC/ForwardFootball)

Sistema de análisis del rendimiento de jugadores de fútbol en base a distintas métricas.

***

![ForwardFooball](docs/imgs/forward_football.png)

## Descripción del problema

La competitividad en los deportes hace que los diferentes clubes busquen las mejores herramientas para realizar las modificaciones pertienentes en los múltiples aspectos dentro de su juego. Gracias a diferentes sensores son capaces de generar grandes cantidades de datos referentes a cada una de las diferentes características que pueden encontrarse en su campo. Forward Football se centra en concreto en el deporte del fútbol. Las diferentes características que son analizadas varían entre las condiciones físicas de cada jugador hasta la posición de la pelota en un partido. El diseño de una aplicación web capaz de analizar estas grandes cantidades de datos con el objetivo de realizar cientos de cálculos para mejorar la comprensión acerca de los mejores cambios a realizar en la estrategia de juego y de entrenamiento es fundamental. Asimismo el diseño de otra herramienta capaz de predecir en función de los calculos realizados qué jugadores están en las mejores condiciones para el próximo partido, resulta de gran interés.

### Solución propuesta

Para dar una solución a estas necesidades se propone una aplicación web en la que tanto jugadores como entrenadores como managers puedan consultar los diferentes parámetros y obtener los cálculos de mayor interés, al igual que diferentes gráficos que permitan una mejor comprensión a la hora de estudiar diferentes aspectos como el movimiento de la pelota o del jugador durante el partido. Los datos disponibles vienen presentados en forma de excel,
teniendo que realizar su limpieza y transformaciones pertinenetes para su almacenamiento en una base de datos que tendrá que ser diseñada. Posteriormente se habilitará una aplicación web que haga uso de estos datos para su presentación a los diferentes usuarios.

El lenguaje de programación pensado para la esta resolución es el llamado Julia, aunque en caso de encontrar dificultades en el desarollo el lenguaje empleado será Python.

### ¿A quién beneficia?

Esta herramienta beneficiaría tanto a un jugador del cual se conocen los datos, como a un entrenador de un equipo, como al manager de un club. Pero de manera más general beneficiaría a la industria del fútbol ya que esto supone una mejora inigualable a las técnicas realizadas previas a la incorporación de la metodología del Big Data.

***

## Creación y configuración del repositorio
- [Enlace](docs/hitos/Hito_0.md) referente a la problemática a resolver, y la configuración del repositorio.

***

## Planificación del proyecto
- Enlace para acceder a la planificación inicial del proyecto, las _historias de usuario_ que describen los roles descritos en el [Hito 1](docs/hitos/Hito_1.md) la creación de las primeras clases

***
## Tests
- Enlace para acceder a la descripición del [gestor de dependencias y a los tests que añadidos](docs/hitos/Hito_2.md).

***
## Docker
- Enlace para acceder a la descripción del [diseño de un contenedor](./docs/hitos/Hito_3.md) con el que se puedan ejecutar los tests unitarios sobre la aplicación.
***
##

## Integración Continua


***

La documentación relacionada con hitos anteriores se podrá consultar a través de los siguientes enlaces:

* [Hito 0](docs/hitos/Hito_0.md)
* [Hito 1](docs/hitos/Hito_1.md)
* [Hito 2](docs/hitos/Hito_2.md)
* [Hito 3](docs/hitos/Hito_3.md)

## Licencia

* [Licencia](./LICENSE)
