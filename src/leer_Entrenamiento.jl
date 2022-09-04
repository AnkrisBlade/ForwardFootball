using DataFrames, XLSX

struct TrainInfo
    train_id::String
    train_info::DataFrame
    team_id::String
    train_team::DataFrame
    train_player::DataFrame
    train_physical::Vector{DataFrame}
    train_bpm::Vector{DataFrame}
end

function lectura_TrainInfo(path::String)
    xf = XLSX.readxlsx(path)
    sps_names = XLSX.sheetnames(xf)

    info_match = xf[sps_names[1]]
    df_train = DataFrame(info_match[:], :auto)

    column_names_train = Vector{String}(df_train[1, :])
    df_train_info = df_train[1:2, :]
    rename!(df_train_info, column_names_train)
    deleteat!(df_train_info, 1)
    train_id = df_train_info[1, 1]

    column_names_team = Vector{String}(df_train[5, 1:2])
    df_train_team = df_train[5:6, 1:2]
    rename!(df_train_team, column_names_team)
    deleteat!(df_train_team, 1)
    team_id = df_train_team[1, 1]

    column_names_player = Vector{String}(df_train[9, 1:7])
    df_train_player = df_train[10:end, 1:7]
    rename!(df_train_player, column_names_player)

    dfs_physical = Vector{DataFrame}()
    dfs_bpm = Vector{DataFrame}()
    for i in 2:lastindex(sps_names)
        info_players = xf[sps_names[i]]
        df_players = DataFrame(info_players[:], :auto)

        player_id = df_players[2:end, 1]
        replace!(player_id, missing => 0)
        d = findfirst(x -> x == 0, player_id)

        column_names_physical = Vector{String}(df_players[1, :])
        df_train_physical = df_players[2:d, :]
        rename!(df_train_physical, column_names_physical)
        push!(dfs_physical, df_train_physical)

        column_names_bpm = Vector{String}(player_id[1:d-1])
        df_train_bpm = df_players[d+5:end, 1:d-1]
        rename!(df_train_bpm, column_names_bpm)
        push!(dfs_bpm, df_train_bpm)
    end

    TrainInfo(train_id, df_train_info, team_id, df_train_team, df_train_player, dfs_physical, dfs_bpm)
end

function limpiar_TrainInfo(entrenamiento::TrainInfo)
    physicals = entrenamiento.train_physical
    physical_cleaned = Vector{DataFrame}()
    for i in 1:length(physicals)
        physical = select(physicals[i], ["id", "duration", "maxHR", "maxSpeed", "calories", "exerciseLoad", "distance"])
        for col in eachcol(physical)
            replace!(col, missing => 0)
        end
        push!(physical_cleaned, physical)
    end

    for i in 1:lastindex(physical_cleaned)
        physical_cleaned[i][!, :id] = parse.(Int64, physical_cleaned[i][!, :id])
        physical_cleaned[i][!, 2:end] = parse.(Float32, physical_cleaned[i][!, 2:end])
    end
    physical_cleaned

end
