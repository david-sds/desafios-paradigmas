% 3 missionarios e 3 canibais (um problema ético)
% todos os 6 estão do lado direito
% 1 barco pra poder passar todo mundo
% não pode ter mais canibais que missionarios em algum lado do RIVER
% barco suporta no máximo duas pessoas
%
% canibais <= missionarios
%
% Problema de Estados (semelhante aos jarros de água)
%
% 1° abordagem

%estado(ME, CE, MD, CD, Barco).
%
% 2° abordagem

%estado(ME, CE, Barco).
%
 %MD = 3 - ME.
 %CD = 3 - CE.
%
% Definindo os Movimentos (esquerda e direita)
%
% 1 missionario p/esquerda
% 1 canibal p/esquerda
% 1 missionario p/direita
% 1 canibal p/direita
% 2 missionario p/esquerda
% 2 canibais p/esquerda
% 2 missionarios p/direita
% 2 canibais p/direita
% 1 missionario e 1 canibal p/esquerda
% 1 missionario e 1 canibal p/direita
%
% Gerando a movimentação
%


  mov(mover(M,C,esquerda), estado(ME,CE,direita), estado(ME2,CE2,esquerda)):-
    ME2 is ME + M, ME2 >= 0, ME2 =< 3,
    CE2 is CE + C, CE2 >= 0, CE2 =< 3.

  mov(mover(M,C,direita), estado(ME,CE,esquerda), estado(ME2,CE2,direita)):-
    ME2 is ME - M, ME2 >= 0, ME2 =< 3,
    CE2 is CE - C, CE2 >= 0, CE2 =< 3.


% por favor não mude a estrutura do meu código movimentos dos
% missionarios e canibais
  mover(1,1,_).
  mover(2,0,_).
  mover(0,2,_).
  mover(1,0,_).
  mover(0,1,_).

% verificar validade da movimentaçao
  nvalido(estado(2,3,_)).
  nvalido(estado(1,3,_)).
  nvalido(estado(1,2,_)).
  nvalido(estado(2,1,_)).
  nvalido(estado(1,0,_)).
  nvalido(estado(2,0,_)).
% solver do problema
solver(Inicio,Inicio,_,[]).

solver(Inicio,Fim,Visitado,[mover(M, C, Dir)|Solver]):-
    mover(M,C,Dir),
    mov(mover(M,C,Dir),Inicio,Auxiliar),
    \+ nvalido(Auxiliar),
    \+ member(Auxiliar,Visitado),
    solver(Auxiliar,Fim,[Auxiliar|Visitado],Solver).
