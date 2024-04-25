# mario morrendo 

from MarioEst import Mario

class MarioMorto(Mario):
    def __init__(self):
        super().__init__()

    def morrer(self):
       print("GAME OVER")
       return None