predicates:
% parent, sibling
  parent(symbol, symbol).
  man(symbol).
  woman(symbol).
  % sibling, parent
  mother(A, B):-
    parent(B, A), woman(B).
  % sibling, parent
  father(A, B):-
    parent(B, A), man(B).
  % sibling, parent
  son(A, B):-
    parent(B, A), man(A).
  % sibling, parent
  daughter(A, B):-
    parent(B, A), woman(A).
  % sibling, parent
  grandson(A, B):-
    parent(B, C), son(A, C).
  % sibling, parent
  granddaughter(A, B):-
    parent(B, C), daughter(A, C).
  % parent, sibling
  ancestor(A, B):-
    parent(A, B).
  % parent, sibling
  ancestor(A, B):-
    parent(A, C), ancestor(C, B).
% clauses:
  parent(leonid,oleg).
  parent(tamara,oleg).
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
