package main.mario;

import main.logger.MarioLogger;

public class MarioGrande implements MarioState {
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
        return logger.capa();
    }

    @Override
    public MarioState levarDano() {
        return logger.pequeno();
    }

    @Override
    public String toString() {
        return "Mario Grande";
    }
}