import pandas as pd
import os


# Es necesario Instalar xlrd para leer archivos excel.
"""
- Al disponer de múltiples excels de los tres tipos, recorreremos
el directorio de los archivos actualizando el path.

- Se quiere desarrollar este código en Julia, para su optimización.

"""

class BasicInfo:
    """
    Lectura de la información básica del excel y devolver el
    resultado en una lista conteniendo los diferentes data frames.
    """

    def __init__(self, path):
        """
        Inicializar el objeto BasicInfo
        Si la ruta no exsiste devolver FileNotFoundError

        :param path: Ruta del archivo excel
        """
        if not os.path.isfile(path):
            raise FileNotFoundError(path)
        self.path = path
    def excel_to_df(self):
        df_list = []

        # Leemos el excel haciendo uso de la clase ExcelFile
        xlx_basic_info = pd.ExcelFile(self.path)

        # Obtenemos los nombres de las diferentes hojas
        sps_names = xlx_basic_info.sheet_names
        # Lectura de la primera
        df_info_match = pd.read_excel(xlx_basic_info, sheet_name=sps_names[0])

        # Establecer como indice Basic Info
        df_info_match.set_index('Basic Info', inplace=True)

        # Transponemos la tabla para tener las categorias en las filas
        dft_info_match = df_info_match.transpose()

        # Reseteamos los indices
        dft_info_match.reset_index(drop=True, inplace=True)

        # Obtenemos el id del partido
        match_id = dft_info_match.iloc[0]["Match ID"]

        # Obtenemos el id del equipo
        team_id = dft_info_match.iloc[0]["Exported team ID"]

        # Leemos la segunda hoja ('Players')
        df_info_players = pd.read_excel(xlx_basic_info, sheet_name=sps_names[1])
        df_info_players.reset_index(drop=True, inplace=True)

        df_list.append((str(match_id) + "/" + str(team_id) + "/basic_match", dft_info_match))
        df_list.append((str(match_id) + "/" + str(team_id) + "/basic_players", df_info_players))

        return df_list
