# Nos ubicamos en la direccion del repositorio
cd(@__DIR__)
# Haciendo uso de Pkg.jl
using Pkg
# Inicializamos el entorno de este repositorio
Pkg.activate(".")
# Instalamos las dependencias especificadas en el Project.toml
# generando el archivo Manifest.toml
Pkg.instantiate()
# Inicializamos los tests
Pkg.test()
