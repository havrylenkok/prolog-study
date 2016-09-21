name(petya).
name(lena).
name(tanya).
pet(dog).
pet(cat).
pet(hamster).

relation(X,Y):-
  name(X),X=tanya,Y=cat.
relation(X,Y):-
  name(X),X=petya,pet(Y),not(Y=cat),not(Y=hamster).
relation(X,Y):-
    name(X),X=lena,pet(Y),not(Y=cat).


result(X1,Y1,X2,Y2,X3,Y3):-
  relation(X1,Y1),relation(X2,Y2),relation(X3,Y3),Y1\=Y2,Y2\=Y3,Y1\=Y3.
getResults:-
  result(X1,Y1,X2,Y2,X3,Y3),write(X1),write("-"),write(Y1),nl,write(X2),write("-"),write(Y2),nl,write(X3),write("-"),write(Y3),nl.

:-initialization(getResults).
