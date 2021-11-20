# Nos ubicamos en la direccion del repositorio
cd(@__DIR__)
# Haciendo uso de Pkg.jl
using Pkg
# Inicializamos el entorno de este repositorio
Pkg.activate(".")
# Inicializamos los tests
Pkg.test()
