package main.mario;

public class MarioMorto implements MarioState {

    @Override
    public MarioState pegarCogumelo() {
        return null;
    }

    @Override
    public MarioState pegarFlor() {
        return null;
    }

    @Override
    public MarioState pegarPena() {
        return null;
    }

    @Override
    public MarioState levarDano() {
        return null;
    }

    @Override
    public String toString() {
        return "Mario Morto";
    }

}