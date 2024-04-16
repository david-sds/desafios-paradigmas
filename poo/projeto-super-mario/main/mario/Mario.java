package main.mario;

import main.logger.MarioLogger;

public class Mario {
    MarioLogger logger = MarioLogger.getInstance();
    protected MarioState estado;

    public Mario(MarioState initialState) {
        estado = logger.setInitialState(initialState);
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

    @Override
    public String toString() {
        return estado.toString();
    }
}