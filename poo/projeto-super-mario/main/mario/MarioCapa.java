package main.mario;

import main.logger.MarioLogger;

public class MarioCapa implements MarioState {
    MarioLogger logger = MarioLogger.getInstance();

    @Override
    public MarioState pegarCogumelo() {
        return logger.pontos();
    }

    @Override
    public MarioState pegarFlor() {
        return logger.fogo();
    }

    @Override
    public MarioState pegarPena() {
        return logger.pontos();
    }

    @Override
    public MarioState levarDano() {
        return logger.grande();
    }

    @Override
    public String toString() {
        return "Mario de Capa";
    }
}