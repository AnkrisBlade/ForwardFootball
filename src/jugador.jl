using ForwardFootball, Statistics

struct Esfuerzo
    max_HR::Float32
    vel_max::Float32
    cal::Float32
    dist_covered::Float32
end

function esfuerzo_partido(path::String, id_jugador::Int64)

    partido = rendimiento_partido(path)

    stats = partido[in([id_jugador]).(partido.id), :]
    if isempty(stats)
        @warn "No ha introducido el id del jugador correcto"
        error("Este jugador no existe o no ha jugado este partido")
    end

    Esfuerzo(stats[!, 3][1], stats[!, 4][1], stats[!, 5][1], stats[!, 7][1])

end

function esfuerzo_entrenamiento(path::String, id_jugador::Int64,
                                id_physical::Int64)

    entrenamiento = rendimiento_entrenamiento(path, id_physical)

    stats = entrenamiento[in([id_jugador]).(entrenamiento.id), :]
    if isempty(stats)
        @warn "No ha introducido el id del jugador correcto"
        error("Este jugador no existe o no ha realizado este entrenamiento")
    end

    Esfuerzo(stats[!, 3][1], stats[!, 4][1], stats[!,5][1], stats[!, 7][1])

end

function compara_esfuerzo_partido(path::String, id_jugador::Int64)

    partido = rendimiento_partido(path)

    stats = partido[in([id_jugador]).(partido.id), :]
    if isempty(stats)
        @warn "No ha introducido el id del jugador correcto"
        error("Este jugador no existe o no ha jugado este partido")
    end

    esfuerzo = Esfuerzo(stats[!, 3][1],
                        stats[!, 4][1],
                        stats[!, 5][1],
                        stats[!, 7][1])

    media = Esfuerzo(mean(partido[!, 3]),
                     mean(partido[!, 4]),
                     mean(partido[!, 5]),
                     mean(partido[!, 7]))

    println("El resultado al comparar su esfuerzo con el del resto de compañeros
    es el siguiente:
        La frecuencia cardíaca es un $(esfuerzo.max_HR*100/media.max_HR)% de la media
        La velocidad máxima es un $(esfuerzo.vel_max*100/media.vel_max)% de la media
        Las calorias consumidas son un $(esfuerzo.cal*100/media.cal)% de la media
        La distancia cubierta es un $(esfuerzo.dist_covered*100/media.dist_covered)% de la media")
end

function compara_esfuerzo_entrenamiento(path::String, id_jugador::Int64,
                                        id_physical::Int64)

    entrenamiento = rendimiento_entrenamiento(path, id_physical)

    stats = entrenamiento[in([id_jugador]).(entrenamiento.id), :]
    if isempty(stats)
        @warn "No ha introducido el id del jugador correcto"
        error("Este jugador no existe o no ha realizado este entrenamiento")
    end

    esfuerzo = Esfuerzo(stats[!, 3][1],
                        stats[!, 4][1],
                        stats[!, 5][1],
                        stats[!, 7][1])

    media = Esfuerzo(mean(entrenamiento[!, 3]),
                     mean(entrenamiento[!, 4]),
                     mean(entrenamiento[!, 5]),
                     mean(entrenamiento[!, 7]))

    println("El resultado al comparar su esfuerzo con el del resto de compañeros
    es el siguiente:
        La frecuencia cardíaca es un $(esfuerzo.max_HR*100/media.max_HR)% de la media
        La velocidad máxima es un $(esfuerzo.vel_max*100/media.vel_max)% de la media
        Las calorias consumidas son un $(esfuerzo.cal*100/media.cal)% de la media
        La distancia cubierta es un $(esfuerzo.dist_covered*100/media.dist_covered)% de la media")
end
