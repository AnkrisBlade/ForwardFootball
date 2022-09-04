# Hacemos uso del contenedor base oficial de julia, con version 1.6
FROM julia:1.6

# Definimos el usuario sin privilegios
ENV USERNAME=ForwardFootball
ENV USER_UID=1000

RUN groupadd --gid ${USER_UID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_UID} -m ${USERNAME} \
    && chown -R ${USER_UID}:${USER_UID} /home/${USERNAME}

# Definimos el directorio de trabajo
WORKDIR /ForwardFootball

# Copiamos los archivos necesarios para la ejecución de los tests
COPY Project.toml .
COPY make.jl .

COPY ./src/. src

COPY ./test/. test

# Ejecutamos el gestor de tareas
RUN julia make.jl

# Inizializamos el usuario sin privilegios
USER ${USERNAME}

# Definimos el comando a ejecutar cuando se inicializa el contenedor
CMD ["julia", "make.jl"]