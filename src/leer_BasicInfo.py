import pandas as pd
import os


# Install xlrd

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
