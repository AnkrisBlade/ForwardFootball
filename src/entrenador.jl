using ForwardFootball

function rendimiento_partido(path::String)
    partido = try
         lectura_BasicInfo(path)
     catch
         @warn "No ha introducido el partido correcto"
         error("Modificar el id introducido del partido")
     end

    df = limpiar_BasicInfo(partido)

end

function rendimiento_entrenamiento(path::String, id_physical::Int64)

    entrenamiento = try
         lectura_TrainInfo(path)
     catch
        @warn "No ha introducido el entrenamiento correcto"
        error("Modificar el id introducido del entrenamiento")
    end

    dfs = limpiar_TrainInfo(entrenamiento)

    df = try
            dfs[id_physical]
        catch
            @warn "No ha introducido el id del entrenamiento correcto"
            error("Se realizan entre 1 a 4 sesiones en cada entrenamiento")
        end

end
