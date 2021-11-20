## Hito 3

Una vez conocido el proyecto a realizar (ver [Hito 0](./Hito-0.md)), conocido los diferentes roles, los escenarios, las primeras historias de usuario y los primeros milestones (ver [Hito 1](./Hito-1.md)), e implementado el gestor de tareas y los tests (ver [Hito 2](./Hito-2.md)), es momento de definir el contenedor que va a permitir desplegar el proyecto en cualquier tipo de aplicación.


* [Contenedor Base](#contenedor)
* [Docker Hub](#docker)
* [GitHub Container Registry](#gitcontainer)

<a name="contenedor"></a>
### Contenedor Base

El contenedor base empleado para el despliegue del proyecto ha sido el siguiente:
```Dockerfile
FROM julia:1.6
```
Para más información acerca del estudio realizado sobre otras opciones clicar [aquí](../extra/contenedor-base.md).

<a name="docker"></a>
### Docker Hub

Se ha empleado para el almacenamiento del contenedor creado, permitiendo su descarga y despliegue en cualquier otra aplicación. 

Siguiendo la estructura establecida por la [documentación de GitHub](https://docs.github.com/es/actions/publishing-packages/publishing-docker-images),
hemos definido el workflow `push-docker&Git.yml` que se encargará de actualizar y publicar de manera automática en cada push a la rama principal `main` la imagen, tanto en Docker Hub como en el Registro del paquete de Github.  

<a name="gitcontainer"></a>
### GitHub Container Registry

El Registro del paquete de GitHub nos permite alojar y administrar nuestras imágenes de contenedores de Docker en GitHub. Uno de los beneficios es que se podemos definir permisos para la imagen de Docker independientemente de los de cualquier repositorio. Esto quiere decir que nuestro repositorio podría ser privado y la imagen de Docker pública.

Como hemos descrito en el apartado anterior, hemos definido el workflow de la publicación de la imágen en GitHub Container Registry junto con su publicación en Docker Hub.

Para acceder a dicho archivo clicar [aquí](../../.github/workflows/push-docker&Git.yml).

Para más información acerca de diferentes registros públicos de contenedores clicar [aquí](../extra/registros-alternativos.md). 