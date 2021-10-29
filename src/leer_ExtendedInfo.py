import pandas as pd
import os

# Es necesario Instalar xlrd para leer archivos excel.
"""
- Al disponer de múltiples excels de los tres tipos, recorreremos
el directorio de los archivos actualizando el path.

- El lenguaje empleado para los comentarios es el ingles, se irá traduciendo
posteriormente.

- Se quiere desarrollar este código en Julia, para su optimización.
"""

class ExtendInfo:
    """
    Lectura de la información extensa del partido y devolver el
    resultado en una lista conteniendo los diferentes data frames.
    """

    def __init__(self, path):
        """
        Inicializar el objeto ExtendInfo
        Si la ruta no exsiste devolver FileNotFoundError

        :param path: Ruta del archivo excel
        """
        if not os.path.isfile(path):
            raise FileNotFoundError(path)
        self.path = path
        self.xlx_extend_info = pd.ExcelFile(self.path)
        self.sps_names = self.xlx_extend_info.sheet_names

    def excel_to_df(self):
        list_df = []
        # First spreadsheet Extended Info
        df_extended_info = pd.read_excel(self.xlx_extend_info, sheet_name=self.sps_names[0])
        # Get matchID table
        df_extended_match = df_extended_info.loc[:0, :'timestamp']
        df_extended_match.reset_index(drop=True, inplace=True)
        # Get Overall Statistics match players
        df_extended_players = df_extended_info.iloc[5:, :]
        df_extended_players.columns = df_extended_players.iloc[0]
        df_extended_players = df_extended_players.drop(df_extended_players.index[0])
        df_extended_players.reset_index(drop=True, inplace=True)
        # Get 'Match Coordinates Statistics'
        df_extended_coord = pd.read_excel(self.xlx_extend_info, sheet_name=self.sps_names[1])
        list_df_coord = coord(df_extended_coord)
        # Match id
        match_id = df_extended_info.iloc[0]["matchId"]
        list_df.append((str(match_id) + "/extend_match", df_extended_match))
        list_df.append((str(match_id) + "/extend_players", df_extended_players))
        list_df.append([str(match_id) + "/extend_coord", list_df_coord])

        # dictionary where keys: (Intervals, IMA, Events), values: spreadsheet name
        dict_names = name_intervals_events_ima(self.sps_names)

        # lists of different sps dfs
        list_df_intervals = name_df(dict_names['Intervals'], self.xlx_extend_info, "interval")
        list_df_events = name_df(dict_names['Events'], self.xlx_extend_info, "event")
        list_df_ima_events = name_df(dict_names['IMA'], self.xlx_extend_info, "ima")
        list_df.append((str(match_id), list_df_intervals))
        list_df.append((str(match_id), list_df_ima_events))

        # dict of event types
        dict_df_event_type = event_type(list_df_events)
        list_df.append((str(match_id), dict_df_event_type))

        return list_df


def coord(df_coord):
    count = 0
    for i in df_coord.columns:
        if 'player' in i:
            count += 1
    s1 = []
    timestamp = df_coord["timestamp"]
    df_ball = df_coord.loc[:, :'posY']
    ball_id = df_coord.iloc[0]['ballId']
    s1.append((str(ball_id) + '/ballId', df_ball))
    for i in range(count):
        if i == 0:
            df_player_coord = df_coord.loc[:, 'posX.' + str(i + 1): 'posY.' + str(i + 1)]
            df_player_coord["timestamp"] = timestamp
            player_id = df_coord.iloc[0]['playerId']
            s1.append((str(player_id) + "/player", df_player_coord))
        else:
            df_player_coord = df_coord.loc[:, 'posX.' + str(i + 1): 'posY.' + str(i + 1)]
            df_player_coord["timestamp"] = timestamp
            player_id = df_coord.iloc[0]['playerId.' + str(i)]
            s1.append((str(player_id) + "/player", df_player_coord))

    return s1


def name_intervals_events_ima(sps_names):
    """
    Reads the names of the spreadsheets, there are three types: Intervals, Events, IMA Events
    :param sps_names: names of the spreadsheets
    :return: dictionary where keys: (Intervals, Events or IMA), values: name of the spreadsheet
     because in there is the id of the player analyzed.
    """
    dic_info = {}
    intervals = []
    events = []
    ima = []
    for name in sps_names:
        if 'Intervals' in name:
            intervals.append(name)
            dic_info['Intervals'] = intervals
        elif 'IMA' in name:
            ima.append(name)
            dic_info['IMA'] = ima
        elif 'Events' in name:
            events.append(name)
            dic_info['Events'] = events
        else:
            pass
    return dic_info


def name_df(names, xlx_extend_info, category):
    """
    From the name of the spreadsheet stores in a list that name and the data frame of it.
    :param names: name of the spreadsheets to read
    :param xlx_extend_info: excel of those spreadsheets
    :param category: type of spreadsheet: interval, event or ima
    :return: list of tuples where 0: name of sps, 1: df
    """
    s2 = []
    for name in names:
        df = pd.read_excel(xlx_extend_info, sheet_name=name)
        # if empty data frame continue
        if len(df.index) == 0:
            continue
        player_id = ''.join(x for x in name if x.isdigit())
        s2.append((str(player_id) + "/" + str(category), df))
    return s2


def event_type(df_events):
    """
    There is three different types in the events spreadsheet (Pass, Shot, Tackle),
    this from the event df separates the three types of event inside of the df.
    The three different events don't need to appear.
    :param df_events: df of the event in name_df format
    :return: dict where key: player_id/event/type; and value: (player_id/event/type, df)
    """
    dict_df_events = {}
    event_pass = []
    event_shot = []
    event_tackle = []

    for event in df_events:

        if 'Pass' in event[1]['Type'].tolist():
            df_pass = event[1].loc[event[1]['Type'] == 'Pass']
            df_pass.reset_index(drop=True, inplace=True)
            event_pass.append((str(event[0]) + '/pass', df_pass))

        if 'Shot' in event[1]['Type'].tolist():
            df_shot = event[1].loc[event[1]['Type'] == 'Shot']
            df_shot = df_shot.loc[:, :'posY']
            df_shot.reset_index(drop=True, inplace=True)
            event_shot.append((str(event[0]) + '/shot', df_shot))

        if 'TacklesAndInterceptions' in event[1]['Type'].tolist():
            df_tackle = event[1].loc[event[1]['Type'] == 'TacklesAndInterceptions']
            df_tackle = df_tackle.loc[:, :'posY']
            df_tackle.reset_index(drop=True, inplace=True)
            event_tackle.append((str(event[0]) + '/tackle', df_tackle))

    dict_df_events["Pass"] = event_pass
    dict_df_events["Shot"] = event_shot
    dict_df_events["Tackle"] = event_tackle

    return dict_df_events
