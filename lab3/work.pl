
route(1, paris, 18, pair).
route(2, london, 12, notpair).
route(3, rome, 04, everyday).

listAll():-
  findall([X,Y,Z,R],route(X,Y,Z,R),L),write(L).
pairedRoutes():-
  findall(X, route(X,_,_,pair),L),write(L).
listRoutesBefore(MaxTime, ResultList):-
  findall([Number, Name, Time], (route(Number, Name,Time,_),Time<MaxTime), ResultList).
routesBefore():-
  read(X),listRoutesBefore(X,L),write(L).
