# classe mario pequeno
from MarioEst import Mario
from BigMario import MarioGrande
from DeadMario import MarioMorto

class MarioPequeno(Mario):
    def __init__(self):
        super().__init__()

    def pegar_cogumelo(self):
        print("Mario Pequeno!")
        opcao = int(input("[1] - Pega Cogumelos [2] - Leva Dano: "))
        if opcao == 1:
            return MarioGrande()
        else:
            return MarioMorto()