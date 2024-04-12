package main;

import main.mario.Mario;

public class Main {
    public static void main(String[] args) {
        Mario mario = new Mario();
        mario.pegarCogumelo();
        mario.pegarPena();
        mario.levarDano();
        mario.pegarFlor();
        mario.pegarFlor();
        mario.levarDano();
        mario.levarDano();
        mario.pegarPena();
        mario.levarDano();
        mario.levarDano();
        mario.levarDano();
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