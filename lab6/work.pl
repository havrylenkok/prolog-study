% 1 odd & even list + merge

odd(X, Y, L) :- A is X mod 2, A = 0, U is X+1, odd(U, Y, L), !.
odd(X, Y, []) :- X > Y, !.
odd(X, Y, L) :- X=<Y, U is X+2, odd(U,Y, I), L = [X|I].
write_odd(N1, N2) :- odd(N1, N2, L), write(L).

even(X, Y, L) :- A is X mod 2, A = 1, U is X+1, even(U, Y, L), !.
even(X, Y, []) :- X > Y, !.
even(X, Y, L) :- X=<Y, U is X+2, even(U, Y, I), L = [X|I].
write_even(N1, N2) :- even(N1, N2, L), write(L).

merge_lists(X, Y, Z) :- append(X,Y,Z).

% 2 insertion sort

insert_sort(List, Sorted) :- i_sort(List, [], Sorted).
i_sort([], Acc, Acc).
i_sort([H|T], Acc, Sorted) :- insert(H, Acc, NAcc), i_sort(T, NAcc, Sorted).

insert(X, [Y|T], [Y|NT]) :- X > Y, insert(X, T, NT).
insert(X, [Y|T], [X,Y|T]) :- -X =< Y.
insert(X, [], [X]).

demo12(N1, N2) :-  even(N1, N2, E),  odd(N1, N2, O),  merge_lists(E, O, M), insert_sort(M, R), write(R).

% 3 findall grandson & granddaughter

% SEE LAB2, SERIOUSLY, WE WERE PAST ANCESTOR-THEMED TASKS, WERENT WE?
