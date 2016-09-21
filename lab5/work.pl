% S=2(X^2+Y^2)/(X+Y)
privateCalcS(X,Y,Z):-
  Z is 2*(X*X+Y*Y)/(X+Y).
calcS:-
  read(X),read(Y),privateCalcS(X,Y,Z),write(Z).

% ak=(k+1)/(k+2);
calcSum(0,X):-
  X is 1/2.
calcSum(K,X):-
  L is K-1, calcSum(L, Y), X is Y+(K+1/K+2),!.
