using ForwardFootball
using Test

## Conjunto de Tests sobre los roles

@testset "Rendimiento de un equipo durante un Partido" begin
    path = "../src/data/Info_Basica/Orange Lions V20-2 vs Orange Lions V20-1/The data report of Orange Lions V20-120200122.xlsx"
    @info "Testeando el rendimiento de un Equipo durante un partido"
    @test rendimiento_partido(path)[!, 1] == [94822, 94825, 94816, 94828, 94824]
    @test rendimiento_partido(path)[!, 2] ≈ [911.0, 946.0, 946.0, 946.0, 946.0]
    @test rendimiento_partido(path)[!, 3] ≈ [190.0, 183.0, 188.0, 186.0, 185.0]
    @test rendimiento_partido(path)[!, 4] ≈ [6.7, 6.0, 6.4, 6.4, 6.3]
    @test rendimiento_partido(path)[!, 5] ≈ [45.0, 168.0, 34.0, 27.0, 26.0]
    @test rendimiento_partido(path)[!, 6] ≈ [20.9, 20.3, 17.2, 13.9, 21.6]
    @test rendimiento_partido(path)[!, 7] ≈ [699.4, 779.3, 648.4, 827.5, 813.5]
    @info "Testeando la advertencia de introducir un partido incorrecto"
    @test_throws ErrorException rendimiento_partido("path")

end

@testset "Rendimiento de un equipo durante un Entrenamiento" begin
    path = "../src/data/Info_Entrenamiento/Orange Lions V20-1/58D7EBEB71C74AAB897D20493B15D912.xlsx"
    @info "Testeando el rendimiento de un equipo durante un entrenamiento"
    @test rendimiento_entrenamiento(path, 1)[!, 1] == [94820, 94824, 94812, 94823, 94811, 94822, 94817,
                                                 94828, 94827, 94815, 94826, 94825, 94818, 94829, ]
    @test rendimiento_entrenamiento(path, 1)[!, 2] ≈ [358546.0, 358546.0, 358546.0, 358546.0, 358546.0, 358546.0, 358546.0, 358546.0, 358546.0, 358546.0, 358546.0, 358546.0, 358546.0, 358546.0]
    @test rendimiento_entrenamiento(path, 1)[!, 3] ≈ [106.0, 134.0, 0.0, 135.0, 129.0, 117.0, 163.0, 151.0, 72.0, 145.0, 180.0, 158.0, 138.0, 150.0]
    @test rendimiento_entrenamiento(path, 1)[!, 4] ≈ [1.68, 3.77, 0.00, 2.93, 1.70, 3.06, 1.97, 3.71, 0.00, 2.58, 2.91, 3.33, 2.89, 3.68]
    @test rendimiento_entrenamiento(path, 1)[!, 5] ≈ [12.0, 4.00, 0.00, 3.00, 3.00, 5.00, 8.00, 7.00, 0.00, 7.00, 8.00, 33.0, 7.00, 21.0]
    @test rendimiento_entrenamiento(path, 1)[!, 6] ≈ [0.350, 1.06, 0.00, 0.90, 0.35, 0.48, 3.30, 2.18, 0.00, 1.56, 5.69, 1.88, 0.88, 1.13]
    @test rendimiento_entrenamiento(path, 1)[!, 7] ≈ [39.06, 46.56, 0.00, 25.91, 59.15, 22.18, 32.66, 47.1, 0.00, 64.58, 20.96, 23.6, 34.42, 52.58]
    @info "Testeando la advertencia de introducir un entrenamiento incorrecto"
    @test_throws ErrorException rendimiento_entrenamiento("path", 1)
    @info "Testeando la advertencia de introducir una sesion de entrenamiento incorrecta"
    @test_throws ErrorException rendimiento_entrenamiento(path, 5)
end

@testset "Esfuerzo de un Jugador durante un Partido" begin
    path = "../src/data/Info_Basica/Orange Lions V20-2 vs Orange Lions V20-1/The data report of Orange Lions V20-120200122.xlsx"
    @info "Testeando el esfuerzo de un Jugador durante un partido"
    @test esfuerzo_partido(path, 94828).max_HR ≈ 186
    @test esfuerzo_partido(path, 94828).vel_max ≈ 6.4
    @test esfuerzo_partido(path, 94828).cal ≈ 27
    @test esfuerzo_partido(path, 94828).dist_covered ≈ 827.5
    @info "Testeando la advertencia de introducir un partido incorrecto"
    @test_throws ErrorException esfuerzo_partido("path", 99999)
    @info "Testeando la advertencia de introducir el id del jugador incorrecto"
    @test_throws ErrorException esfuerzo_partido(path, 99999)
end

@testset "Esfuerzo de un Jugador durante un Entrenamiento" begin
    path = "../src/data/Info_Entrenamiento/Orange Lions V20-1/58D7EBEB71C74AAB897D20493B15D912.xlsx"
    @info "Testeando el esfuerzo de un Jugador durante un entrenamiento"
    @test esfuerzo_entrenamiento(path, 94820, 1).max_HR ≈ 106
    @test esfuerzo_entrenamiento(path, 94820, 1).vel_max ≈ 1.68
    @test esfuerzo_entrenamiento(path, 94820, 1).cal ≈ 12.0
    @test esfuerzo_entrenamiento(path, 94820, 1).dist_covered ≈ 39.06
    @info "Testeando la advertencia de introducir un entrenamiento incorrecto"
    @test_throws ErrorException esfuerzo_entrenamiento("path", 94820, 1)
    @info "Testeando la advertencia de introducir una sesion de entrenamiento incorrecta"
    @test_throws ErrorException esfuerzo_entrenamiento(path, 94820, 5)
    @info "Testeando la advertencia de introducir el id del jugador incorrecto"
    @test_throws ErrorException esfuerzo_entrenamiento(path, 99999, 1)
end
