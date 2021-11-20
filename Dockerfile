# Hacemos uso del contenedor base oficial de julia, con version 1.6
FROM julia:1.6

# Copiamos los archivos del repositorio al contenedor
COPY ./ .

# Ejecutamos el gestor de tareas
RUN julia make.jl

# Realizamos los tests
CMD ["julia", "make.jl"]