package main;

import main.logger.MarioLogger;
import main.mario.Mario;
import main.mario.MarioMorto;
import main.mario.MarioPequeno;
import main.mario.MarioState;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        boolean isRunning = true;

        while(isRunning) {
            System.out.println("\nSUPER MARIO BROS. (Java State Edition)");
            System.out.println("1. Play");
            System.out.println("2. History");
            System.out.println("0. Quit");
            System.out.print("Option: ");

            String opt = input.nextLine();

            switch(opt) {
                case "1":
                    play(new MarioPequeno());
                    break;
                case "2":
                    MarioLogger.history();
                    break;
                case "0":
                    isRunning = false;
                    break;
                default:
                    break;
            }
        }


    }

    public static void play(MarioState initialState) {
        Mario mario = new Mario(initialState != null ? initialState : new MarioPequeno());
        while (!mario.toString().equals(new MarioMorto().toString())) {
            Scanner input = new Scanner(System.in);

            System.out.println("\nEscolha uma ação para " + mario);
            System.out.println("1. Pegar Cogumelo");
            System.out.println("2. Pegar Flor de Fogo");
            System.out.println("3. Pegar Pena");
            System.out.println("0. Levar dano (Default)");
            System.out.print("Option: ");

            String opt = input.nextLine();
            switch(opt) {
                case "1":
                    mario.pegarCogumelo();
                    break;
                case "2":
                    mario.pegarFlor();
                    break;
                case "3":
                    mario.pegarPena();
                    break;
                case "0":
                default:
                    mario.levarDano();
                    break;
            }
        }
    }
}

/*
 * 2 – Desafio de Programação Orientada a Objetos
 *
 * O padrão de projeto orientado a objetos permitir que um objeto alterar o seu
 * comportamento em função de alterações no seu estado interno. A sua
 * aplicabilidade se encerra quando o comportamento de um objeto depende do
 * seu estado e pode mudar em tempo de execução, assim como quando as
 * operações têm comandos condicionais, com várias alternativas que dependem
 * do estado do objeto. Utilizando o padrão de projeto STATE implemente o jogo
 * Mario, cuja implementação parcial se encontra no seguinte endereço:
 *
 * https://brizeno.wordpress.com/category/padroes-de-projeto/state/\
 *
 * O desafio inclui também implementação de um log de eventos para registrar
 * cada mudança de estado do jogo. O log deve ser uma entidade global, então
 * encontre, entre os padrões de projeto, o padrão que melhor desempenha essa
 * função de entidade global. Cada evento registro deve ter minimamente um
 * identificador da instância do jogo, nome/descrição do evento, timestamp da
 * ocorrência do evento, etc.
 */