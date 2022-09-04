using SafeTestsets

@safetestset "Tests de Lectura de Ficheros" begin
    include("lectura_tests.jl")
end

@safetestset "Test de Historias de Usuario" begin
    include("roles_tests.jl")
end
