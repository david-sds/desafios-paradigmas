package main.logger;

import main.mario.*;

import java.sql.Timestamp;
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

    public MarioState setInitialState(MarioState initialState) {
        history.add(initialState);
        return initialState;
    }

    public MarioState log(String action, MarioState newState) {
        MarioState lastState = history.get(history.size() -1);
        boolean isStateChange = !newState.equals(lastState);

        System.out.println();
        System.out.println(new Timestamp(System.currentTimeMillis()));
        if (isStateChange) {
            if (newState.toString().equals(new MarioMorto().toString())) {
                System.out.println(newState);
            } else {
                System.out.println(lastState + " " + action + " e se tornou " + newState + ".");
            }
        } else {
            System.out.println(newState + " " + action + " e ganhou 1000 pontos!");
        }

        history.add(newState);
        return newState;
    }

    public static void history() {
        System.out.println("\nHistórico de Jogos (Estados)");
        for (MarioState state : history) {
            System.out.println(state);
        }
    }
}
