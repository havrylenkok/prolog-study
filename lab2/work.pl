predicates:
  parent(symbol, symbol).
  man(symbol).
  woman(symbol).
  mother(A, B):-
    parent(B, A), woman(B).
  father(A, B):-
    parent(B, A), man(B).
  son(A, B):-
    parent(B, A), man(A).
  daughter(A, B):-
    parent(B, A), woman(A).
  grandson(A, B):-
    parent(B, C), son(A, C).
  granddaughter(A, B):-
    parent(B, C), daughter(A, C).
clauses:
  parent(tamara,oleg).
  parent(leonid,oleg).
  parent(vera, irina).
  parent(timur, irina).
  parent(oleg, kirill).
  parent(oleg, daniil).
  parent(irina, kirill).
  parent(irina, daniil).
  man(leonid).
  man(timur).
  man(oleg).
  man(kirill).
  man(daniil).
  woman(tamara).
  woman(vera).
  woman(irina).

  % get all the results as list: findall(X, parent(_,X),L).
