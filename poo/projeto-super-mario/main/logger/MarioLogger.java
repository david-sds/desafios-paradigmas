package main.logger;

import main.mario.*;

import java.util.ArrayList;
import java.util.List;

public class MarioLogger {
    private static MarioLogger logger;
    private static final List<MarioState> history = new ArrayList<>();

    public static MarioLogger getInstance() {
        if (logger == null) {
            logger = new MarioLogger();
        }
        return logger;
    }

    public void setInitialState(MarioState initialState) {
        history.add(initialState);
    }

    private MarioState log(String action, MarioState newState) {
        MarioState lastState = history.get(history.size() -1);

        String effect = newState.equals(lastState)
                ? "continuou igual."
                : "virou o " + newState + ".";

        System.out.println(System.currentTimeMillis());
        System.out.println(lastState + " " + action + " e " + effect);
        System.out.println();
        history.add(newState);
        return newState;
    }

    public MarioState pontos() {
        return log("ganhou 1000 pontos", history.get(history.size() - 1));
    }

    public MarioState fogo() {
        MarioState novoMario = new MarioFogo();
        return log("comeu a Flor de Fogo", novoMario);
    }

    public MarioState capa() {
        MarioState novoMario = new MarioCapa();
        return log("pegou a Capa", novoMario);
    }

    public MarioState grande() {
        MarioState novoMario = new MarioGrande();
        return log("comeu o Cogumelo", novoMario);
    }

    public MarioState pequeno() {
        MarioState novoMario = new MarioPequeno();
        return log("levou dano", novoMario);
    }

    public MarioState morrer() {
        return log("morreu", new MarioMorto());
    }

    public static void history() {
        for (MarioState state : history) {
            System.out.println(state);
        }
    }
}
