using DataFrames, XLSX

struct BasicInfo
    match_id::String
    basic_info::DataFrame
    team_id::String
    team_info::DataFrame
end

function lectura_BasicInfo(path::String)
    xf = XLSX.readxlsx(path)
    sps_names = XLSX.sheetnames(xf)

    info_match = xf[sps_names[1]]
    df_info_match = DataFrame(info_match[:], :auto)
    deleteat!(df_info_match, 1)
    df_info_match = rename(df_info_match, ["Basic Info", "Data"])
    match_id = df_info_match[2,2]

    info_players = xf[sps_names[2]]
    df_info_players = DataFrame(info_players[:], :auto)
    column_names = Vector{String}(df_info_players[1, :])
    df_info_players = rename(df_info_players, column_names)
    deleteat!(df_info_players, 1)
    team_id = df_info_match[5, 2]

    BasicInfo(match_id, df_info_match, team_id, df_info_players)

end

function limpiar_BasicInfo(partido::BasicInfo)
    team_info_cleaned =
        select(partido.team_info, [ "id",
                                    "Time Played",
                                    "Max. HR",
                                    "Highest Speed",
                                    "Calorie",
                                    "Physical Load",
                                    "Distance Covered"])

    team_info_cleaned[!, :id] = parse.(Int64, team_info_cleaned[!, :id])
    team_info_cleaned[!, 2:end] = parse.(Float32, team_info_cleaned[!, 2:end])
    team_info_cleaned

end