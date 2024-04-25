# Mario voador
from MarioEst import Mario
from BigMario import MarioGrande

class MarioVoador(Mario):
    def __init__(self):
        pass

    def voar(self):
        print("Mario Voador")
        while True:
            opcao = int(input("[1] - Voa [2] - Leva Dano: "))
            if opcao == 1:
                print("Mario voando fase ")
            else:
                return MarioGrande().pegar_pena()