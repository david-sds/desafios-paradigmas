# main para execução do mario
from FlyMario import MarioVoador
from MarioSmall import MarioPequeno
from DeadMario import MarioMorto

def main():
    while True:
        print("Super Mario True!")
        opcao = int(input("[1] - Iniciar Jogo [2] - Sair: "))

        if opcao != 1 and opcao != 2:
            print("Selecione a opção correta")
            continue

        if opcao == 1:
            mario = MarioPequeno()
            while True:
                mario.pegar_cogumelo()
                if isinstance(mario, MarioMorto):
                    break  # Sai do loop se o Mario estiver morto
                
                if isinstance(mario, MarioVoador):
                    mario.voar()
                else:
                    break
        else:
            break

if __name__ == "__main__":
    main()
