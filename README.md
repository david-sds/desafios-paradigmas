# Desafios de Paradigmas de Programação
## Programa de Pós-Graduação em Informática da PUCPR
### Profs. Edson Emílio Scalabrin e Fabrício Enembreck

### O problema dos missionários e canibais
• Três missionários e três canibais estão em uma margem de um rio. Na
mesma margem existe um bote com capacidade para no máximo duas
pessoas.
• O problema é o de encontrar uma forma de levar as 6 pessoas para a
outra margem do rio, sem nunca deixar numa margem um número maior
de canibais do que de missionários.

### 1 – Desafio de Programação Lógica
Utilizando o solver de busca em profundidade desenvolvido em sala e um
modelo de operadores similar ao problema dos jarros de água, desenvolva a
representação de estados e os operadores necessários para se resolver o
problema dos missionários e canibais.

### 2 – Desafio de Programação Funcional
Utilizando o solver de busca em profundidade cujo desenvolvimento foi iniciado
em sala e o modelo de operadores similar ao problema dos jarros de água,
conclua a implementação do solver, desenvolva a representação de estados e os
operadores necessários para se resolver o problema dos missionários e canibais.

### 2 – Desafio de Programação Orientada a Objetos
O padrão de projeto orientado a objetos permitir que um objeto alterar o seu
comportamento em função de alterações no seu estado interno. A sua
aplicabilidade se encerra quando o comportamento de um objeto depende do
seu estado e pode mudar em tempo de execução, assim como quando as
operações têm comandos condicionais, com várias alternativas que dependem
do estado do objeto. Utilizando o padrão de projeto STATE implemente o jogo
Mario, cuja implementação parcial se encontra no seguinte endereço:
https://brizeno.wordpress.com/category/padroes-de-projeto/state/
O desafio inclui também implementação de um log de eventos para registrar
cada mudança de estado do jogo. O log deve ser uma entidade global, então
encontre, entre os padrões de projeto, o padrão que melhor desempenha essa
função de entidade global. Cada evento registro deve ter minimamente um
identificador da instância do jogo, nome/descrição do evento, timestamp da
ocorrência do evento, etc.
