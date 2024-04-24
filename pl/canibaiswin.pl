% missionarios e canibais win

% canibais tem que ser menor que missionarios (win)

% estado inicial e final
estadoinicial(estado(3, 3, 0, 0, E)).
estadofinal(estado(0, 0, 3, 3, D)).

% member

member(Element, [Element | _]).
member(Element, [_ | Tail]) :- member(Element, Tail).

not_member(Element, List) :- \+ member(Element, List).

% algorítmo solver
  solver(E, Cam, [E|Cam]):-
    estadofinal(E),
    writeln(Cam)!.
  solver(E, Cam, S):-
    not_member(E, Cam),
    operador(E, E1),
    solver(E1, [E|Cam], S).

% criar a função operador 

% solucao([_, 2]).