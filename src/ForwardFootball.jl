module ForwardFootball

export lectura_BasicInfo, lectura_TrainInfo
export limpiar_BasicInfo, limpiar_TrainInfo
export esfuerzo_partido, esfuerzo_entrenamiento
export rendimiento_partido, rendimiento_entrenamiento
export compara_esfuerzo_partido, compara_esfuerzo_entrenamiento

include("leer_Partido.jl")
include("leer_Entrenamiento.jl")
include("jugador.jl")
include("entrenador.jl")

end
