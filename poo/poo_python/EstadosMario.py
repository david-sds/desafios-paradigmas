# definição dos estados do mario

# mario pequeno
# mario grande
# mario morto

# inicialização do jogo

def mariopequeno():
    print("Mario Pequeno!")
    opcao = int(input("[1] - Pega Cogumelos [2] - Leva Dano: "))
    if opcao == 1:
        mariogrande()
    else:
        mariomortao()
        return
    
        # pega cogumelo
        # fica grande
        # leva dano
        # morre
def mariomortao():
    print("Game Over")
    # pega pena
    # vira mario voando
    # leva dano
    # mario pequeno

def mariogrande():
    print("Mario Grande")
    opcao = int(input("[1] - Pega Pena [2] - Leva Dano: "))
    if opcao == 1:
        mariovoando()
    else:
        mariopequeno()
        return
    # pega pena
    # vira mario voando
    # leva dano
    # mario pequeno

def mariovoando():
    print("Mario Voador")
    while True:
        opcao = int(input("[1] - Voa [2] - Leva Dano: "))
        if opcao == 1:
            print("Mario voando fase ")
        else:
            mariogrande()
            return
   
while True:
    print ("Super Mario True!")
    opcao = int(input("[1] - Iniciar Jogo [2] - Sair: "))

    if opcao != 1 and opcao != 2:
        print ("Selecione a opcao correta")

    if opcao == 1:
        mariopequeno()
    else:
        break

