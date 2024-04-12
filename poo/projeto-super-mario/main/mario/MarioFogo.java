package main.mario;

import main.logger.MarioLogger;

public class MarioFogo implements MarioState {
    MarioLogger logger = MarioLogger.getInstance();

    @Override
    public MarioState pegarCogumelo() {
        return logger.pontos();
    }

    @Override
    public MarioState pegarFlor() {
        return logger.pontos();
    }

    @Override
    public MarioState pegarPena() {
        return logger.capa();
    }

    @Override
    public MarioState levarDano() {
        return logger.grande();
    }

    @Override
    public String toString() {
        return "Mario de Fogo";
    }
}