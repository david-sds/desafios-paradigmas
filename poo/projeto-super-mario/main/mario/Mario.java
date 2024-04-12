package main.mario;

import main.logger.MarioLogger;

public class Mario {
    protected MarioState estado;
    MarioLogger logger = MarioLogger.getInstance();

    public Mario() {
        MarioState initialState =new MarioPequeno();
        logger.setInitialState(initialState);
        estado = initialState;
    }

    public void pegarCogumelo() {
        estado = estado.pegarCogumelo();
    }

    public void pegarFlor() {
        estado = estado.pegarFlor();
    }

    public void pegarPena() {
        estado = estado.pegarPena();
    }

    public void levarDano() {
        estado = estado.levarDano();
    }
}