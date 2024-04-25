# classe mario grande
from MarioEst import Mario
from FlyMario import MarioVoador
from MarioSmall import MarioPequeno

class MarioGrande(Mario):
    def __init__(self):
        super().__init__()

    def pegar_pena(self):
        print("Mario Grande")
        opcao = int(input("[1] - Pega Pena [2] - Leva Dano: "))
        if opcao == 1:
            return MarioVoador()
        else:
            return MarioPequeno()