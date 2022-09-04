## Hito 3

Una vez conocido el proyecto a realizar (ver [Hito 0](Hito_0.md)), conocido los diferentes roles, los escenarios, las primeras historias de usuario y los primeros milestones (ver [Hito 1](Hito_1.md)), e implementado el gestor de tareas y los tests (ver [Hito 2](Hito_2.md)), es momento de definir el contenedor que va a permitir el despliegue repetible y el testeo del proyecto.

* [Contenedor Base](#contenedor)
* [Docker Hub](#docker)
* [GitHub Container Registry](#gitcontainer)
* [Documentación Adicional](#documentación-adicional)

<a name="contenedor"></a>
### Contenedor Base

Existen distintas imágenes para nuestro contenedor que podemos emplear, dependiendo del uso o características que queramos que tenga, como el tiempo de ejecución, el tamaño, módulos adicionales... Es por ello que hemos realizado un [estudio sobre las distintas opciones](../extra/contenedor_base.md) llegando a la conclusión acerca de la imagen será, 
```Dockerfile
julia:1.6
```

<a name="docker"></a>
### Docker Hub y su actualización automática

Este servicio se ha empleado para el almacenamiento del contenedor creado, permitiendo su descarga y despliegue en cualquier otra aplicación. 

Siguiendo la estructura establecida por la [documentación de GitHub](https://docs.github.com/es/actions/publishing-packages/publishing-docker-images),
hemos definido el workflow `push-docker&Git.yml` que se encargará de actualizar y publicar de manera automática la imagen, tanto en Docker Hub como en el Registro del paquete de Github. Además hemos especificado que solo se actualice al realizar un push a la rama principal `main`, en vez de que sea en cada commit.

Las versiones utilizadas para los webhooks y obtenidas de los repositorios de docker son las siguientes:

- actions/checkout@v2
- docker/login-action@v1
- docker/metadata-action@v3
- docker/build-push-action@v2

Se utilizan esas versiones con esos tag's específicos ya que son las más adecuadas según el mismo repositorio y las más utilizadas por la comunidad.

Para la actualización tanto del contenedor publicado en _Docker Hub_ como para subirlo también a _GitHub Container Registry_, se ha incluido lo siguiente:

```yml
- name: Log in to the Container registry
    uses: docker/login-action@v1
    with:
        registry: ghcr.io
        username: ${{ github.actor }}
        password: ${{ secrets.GITHUB_TOKEN }}
    ...
    with:
        images: |
            vntrcc/forwardfootball
            ghcr.io/${{ github.repository }}
        tags: |
            latest
- name: Run docker tests
    run: docker run -t -v `pwd`:/app/test vntrcc/forwardfootball
```

Comprobadno su funcionamiento, al hacer push a la rama principal, podemos ver su actualización en _Docker Hub_:

![docker_hub]()

Y en _Github Container Registry_:

![github_container_registry]()

<a name="gitcontainer"></a>
### GitHub Container Registry

El Registro del paquete de GitHub nos permite alojar y administrar nuestras imágenes de contenedores de Docker en GitHub. Uno de los beneficios es que se podemos definir permisos para la imagen de Docker independientemente de los de cualquier repositorio. Esto quiere decir que nuestro repositorio podría ser privado y la imagen de Docker pública. Es por ello por lo que hemos decidido utilizar _GitHub Container Registry_ como registro de imagenes alternativo al de _Docker Hub_.

Para demostrar el despliegue de nuestro contenedor a _GitHub Container Registry_ hemos seguido los pasos indicados en la documentación oficial:

- Creación de un TOKEN desde el apartado _Developer Settings_ en GitHub, copiándolo y guardándolo en una variable de la manera: `export TOKEN=TOKEN`.
- Luego nos logueamos con nuestro TOKEN guardado en docker para poder subir la imagen de la forma: `echo $CR_PAT | docker login ghcr.io -u vntrcc --pasword-stdin`
- Finálmente se sube la imagen con la extensión adecuada: docker push `ghcr.io/vntrcc/forwardfootball` y comprobamos que se ha subido correctamente:

![]()

Ya solo queda enlazarlo a _GitHub_ para que aparezca como _Package_, cambiando la visibilidad del paquete a **público** y conectarlo al repositorio, quedando de la forma:

![]()

Si comprobamos ahora el repositorio:

![]()

Para más información acerca de diferentes registros públicos de contenedores clicar [aquí](../extra/registros_alternativos.md).

<a name="Additional"></a>
## Documentación Adicional

- [Workflow de actualización automática](../../.github/workflows/push-docker&Git.yml)
- [Hito 2](Hito_2.md)
- [Hito 4](Hito_4.md)
- [Inicio](../../README.md)
