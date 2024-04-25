# main para execução do mario
from FlyMario import MarioVoador
from MarioSmall import MarioPequeno
from DeadMario import MarioMorto

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