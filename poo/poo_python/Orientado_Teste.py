# execucao do Python Orientado

class Mario:
    def __init__(self):
        pass

    def pegar_cogumelo(self):
        pass

    def levar_dano(self):
        pass

    def morrer(self):
        pass


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


class MarioVoador(Mario):
    def __init__(self):
        super().__init__()

    def voar(self):
        print("Mario Voador")
        while True:
            opcao = int(input("[1] - Voa [2] - Leva Dano: "))
            if opcao == 1:
                print("Mario voando fase ")
            else:
                return MarioGrande()


class MarioMorto(Mario):
    def __init__(self):
        super().__init__()

    def morrer(self):
        print("Game Over")


def main():
    while True:
        print("Super Mario True!")
        opcao = int(input("[1] - Iniciar Jogo [2] - Sair: "))

        if opcao != 1 and opcao != 2:
            print("Selecione a opcao correta")
            continue

        if opcao == 1:
            mario = MarioPequeno()
            while not isinstance(mario, MarioMorto):
                mario = mario.pegar_cogumelo()
                if isinstance(mario, MarioVoador):
                    mario = mario.voar()
        else:
            break


if __name__ == "__main__":
    main()
