package main.mario;

import main.logger.MarioLogger;

public class MarioPequeno implements MarioState {
    MarioLogger logger = MarioLogger.getInstance();

    @Override
    public MarioState pegarCogumelo() {
        return logger.grande();
    }

    @Override
    public MarioState pegarFlor() {
        return logger.fogo();
    }

    @Override
    public MarioState pegarPena() {
        return logger.capa();
    }

    @Override
    public MarioState levarDano() {
        return logger.morrer();
    }

    @Override
    public String toString() {
        return "Mario Pequeno";
    }
}