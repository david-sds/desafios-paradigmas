# mario morrendo 
from DeadMario import MarioMorto
from MarioEst import Mario

class MarioMorto(Mario):
    def __init__(self):
        super().__init__()

    def morrer(self):
        print("Game Over")