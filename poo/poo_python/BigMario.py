# classe mario grande
from MarioEst import Mario

class MarioGrande(Mario):
    def __init__(self):
        pass

    def pegar_pena(self):
        from FlyMario import MarioVoador
        from MarioSmall import MarioPequeno
        print("Mario Grande")
        opcao = int(input("[1] - Pega Pena [2] - Leva Dano: "))
        if opcao == 1:
            return MarioVoador().voar()
        else:
            return MarioPequeno().pegar_cogumelo()