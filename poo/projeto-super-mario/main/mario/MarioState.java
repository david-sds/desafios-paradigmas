package main.mario;

public interface MarioState {
    MarioState pegarCogumelo();

    MarioState pegarFlor();

    MarioState pegarPena();

    MarioState levarDano();
}