import pandas as pd
import os


# Es necesario Instalar xlrd para leer archivos excel.
"""
- Al disponer de múltiples excels de los tres tipos, recorreremos
el directorio de los archivos actualizando el path.

- Se quiere desarrollar este código en Julia, para su optimización.

"""

class Train:
    """
    Lectura de la información de entramiento del excel y devolver el
    resultado en una lista conteniendo los diferentes data frames.
    """

    def __init__(self, path):
        """
        Inicializar el objeto Train
        Si la ruta no exsiste devolver FileNotFoundError

        :param path: Ruta del archivo excel
        """
        if not os.path.isfile(path):
            raise FileNotFoundError(path)
        self.path = path

    def excel_to_df(self):

        list_df = []

        # Proceso similar realizado en BasicInfo
        xlx_train_info = pd.ExcelFile(self.path)
        sps_names = xlx_train_info.sheet_names

        # Leemos la primera hoja del excel de entrenamiento
        df_train = pd.read_excel(xlx_train_info, sheet_name=sps_names[0])
        col_train = df_train.columns

        # Obtenemos la información del entrenamiento
        df_train_info = df_train.loc[:0, :]
        df_train_info.reset_index(drop=True, inplace=True)

        # Obtenemos la información del equipo de entrenamiento
        df_train_team = df_train.loc[3:4, :]
        df_train_team = df_train_team[['trainingId', 'beginTime']]
        df_train_team.columns = df_train_team.iloc[0]
        df_train_team.drop(df_train_team.index[0], inplace=True)
        df_train_team.reset_index(drop=True, inplace=True)

        # Obtenemos la información del entrenamiento de los jugadores
        df_train_player = df_train.iloc[7:, :]
        df_train_player = df_train_player.loc[:, col_train[:7]]
        df_train_player.columns = df_train_player.iloc[0]
        df_train_player.drop(df_train_player.index[0], inplace=True)
        df_train_player.reset_index(drop=True, inplace=True)

        # Guardamos el id del entrenamiento
        train_id = df_train_info.iloc[0]["trainingId"]
        list_df.append((str(train_id) + "/train_info", df_train_info))
        list_df.append((str(train_id) + "/train_team", df_train_team))
        list_df.append((str(train_id) + "/train_player", df_train_player))

        # El resto de hojas son "Physical"
        for i in range(1, len(sps_names)):
            df_train_physical = pd.read_excel(xlx_train_info, sheet_name=sps_names[i])

            # Como las tablas tienen un tamaño flexible hay que determinar
            # el divisor
            player_id = df_train_physical["id"].fillna("0").tolist()
            player_id = [str(i) for i in player_id]
            div = [player_id.index(x) for x in player_id if not x.isdigit()][0]

            # Obtenemos la tabla de datos generales
            df_physical = df_train_physical.iloc[:div - 3, :]

            # Obtenemos la tabla de latidos por segundo de los jugaodres "BPM"
            df_bpm_avg = df_train_physical.iloc[div + 1:, :len(df_physical.index)]
            df_bpm_avg.columns = player_id[:div - 3]
            df_bpm_avg = df_bpm_avg.transpose()
            df_bpm_avg.columns = range(1, len(df_bpm_avg.columns) +1)
            df_bpm_avg.reset_index(level=0, inplace=True)
            df_bpm_avg.rename(columns={"index": "Player_id"}, inplace=True)

            list_df.append((str(train_id) + "/train_physical_A" + str(i) + "/" + sps_names[i], df_physical))
            list_df.append((str(train_id) + "/BPM_Avg_A" + str(i), df_bpm_avg))

        return list_df
