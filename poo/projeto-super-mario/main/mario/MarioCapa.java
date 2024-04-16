package main.mario;

import main.logger.MarioLogger;

public class MarioCapa implements MarioState {
    MarioLogger logger = MarioLogger.getInstance();

    @Override
    public MarioState pegarCogumelo() {
        return logger.log("pegou um cogumelo", this);
    }

    @Override
    public MarioState pegarFlor() {
        return logger.log("pegou uma flor de fogo", new MarioFogo());
    }

    @Override
    public MarioState pegarPena() {
        return logger.log("pegou uma pena", new MarioCapa());
    }

    @Override
    public MarioState levarDano() {
        return logger.log("levou dano", new MarioGrande());
    }

    @Override
    public String toString() {
        return "Mario com Capa";
    }
}