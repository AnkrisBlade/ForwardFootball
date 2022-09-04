using ForwardFootball
using Test

## Conjunto de Tests sobre lectura

@testset "Lectura de Datos sobre un Partido" begin
    path = "../src/data/Info_Basica/Orange Lions V20-2 vs Orange Lions V20-1/The data report of Orange Lions V20-120200122.xlsx"
    @info "Testeo de la lectura de los datos sobre un partido"
    @test lectura_BasicInfo(path).match_id == "38986AF3-4EC0-4EE0-AD8F-7569BB343ADC"
    @test size(lectura_BasicInfo(path).basic_info) == (8, 2)
    @test lectura_BasicInfo(path).team_id == "4967"
    @test size(lectura_BasicInfo(path).team_info) == (5, 53)
end

@testset "Lectura de Datos sobre un Entrenamiento" begin
    path = "../src/data/Info_Entrenamiento/Orange Lions V20-1/58D7EBEB71C74AAB897D20493B15D912.xlsx"
    @info "Testeo de la lectura de los datos sobre un entrenamiento"
    @test lectura_TrainInfo(path).train_id == "58D7EBEB71C74AAB897D20493B15D912"
    @test lectura_TrainInfo(path).team_id == "4967"
    @test length(lectura_TrainInfo(path).train_physical) == 4
    @test length(lectura_TrainInfo(path).train_bpm) == 4
end
