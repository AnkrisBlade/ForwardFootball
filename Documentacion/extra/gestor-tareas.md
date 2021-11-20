# Opciones de Gestor de Tareas 📓

Las diferentes opciones contempladas haciendo uso del lenguaje de programación Julia son las siguientes:

## Travis CI

Según [Wikipedia](https://en.wikipedia.org/wiki/Travis_CI):
> Travis CI es un servicio de integración continua alojado que se utiliza para crear y probar proyectos de software alojados en GitHub y Bitbucket. Travis CI fue el primer servicio de CI que brindó servicios a proyectos de código abierto de forma gratuita y continúa haciéndolo.

En un servicio que da soporte de forma general a muchos lenguajes para realizar la función de gestionar las tareas de manera continua, probando la integridad del proyecto en cada commit realizado y ejecutando las diferentes ordenes establecias en un archivo `.travis.yml` que tiene la siguiente estructura:

```yml
language: julia
julia:
  - nightly
  - 1.0.6
  - 1.5.2
```
Para más información acerca de este servicio clique [aquí](https://www.travis-ci.com/).

## Appveyor

Según [Wikipedia](https://en.wikipedia.org/wiki/AppVeyor):
> AppVeyor es un servicio de integración continua alojado y distribuido que se utiliza para construir y probar proyectos alojados en GitHub y otros servicios de alojamiento de código fuente en una máquina virtual Microsoft Windows, así como máquinas virtuales Ubuntu Linux.

Es un servicio similar a Travis CI pero con mayor soporte en la comprobación de la integridad del proyecto en sistemas Windows. Para ello se ha de crear un archivo `.appveyor.yml` que tiene la siguiente estructura:

```yml
environment:
  matrix:
  - julia_version: 0.7
  - julia_version: 1
  - julia_version: nightly

platform:
  - x86 # 32-bit
  - x64 # 64-bit
```
Para más información acerca de este servicio clique [aquí](https://www.appveyor.com/).

***
**Aclaración**

La versión `nightly` hace referencia a la última versión de [Julia](https://github.com/JuliaLang/julia).

***
