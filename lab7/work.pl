% library {
% Book {
% name : string,
% author : Author,
% publications : [Publication],
% num_of_copies : int
% }
% }
% !!!!
% Author {
% name : string,
% surname : string,
% year_of_birth : int,
% }
% Publication {
% publisher_name : string,
% num_of_publication : int,
% year_of_publication : int,
% num_of_pages : int,
% price : int,
% }

% db

book(bookName1, author(authorName1, authorSurname1, 1970), [
  publication(publisherName1, 1, 1999, 230, 20),
  publication(publisherName2, 2, 2003, 229, 25)
], 10).

book(bookName2, author(authorName2, authorSurname2, 1905), [
  publication(publisherName1, 1, 1935, 430, 40),
  publication(publisherName2, 2, 2010, 629, 55)
], 20).

book(bookName3, author(authorName3, authorSurname3, 1935), [
  publication(publisherName1, 1, 1985, 150, 90),
  publication(publisherName3, 2, 2010, 130, 155)
], 40).

book(bookName4, author(authorName3, authorSurname3, 1935), [
  publication(publisherName2, 10, 1965, 250, 70),
  publication(publisherName3, 20, 2010, 230, 55)
], 15).

book(bookName5, author(authorName3, authorSurname3, 1935), [
  publication(publisherName2, 10, 1965, 250, 70)
], 15).

% найти автора книги опубликованной ранее всех других
find_author_of_earliest_book(R) :-
  findall([N,X], book(_, N, [publication(_,_,X,_,_)|_], _), L),
  walk_e(L,R).
walk_e([X|[]],X):-!.
walk_e([H|T],X):-
  walk_e(T, Y),
  H=[_,A],
  Y=[_,B],
  (A<B->X=H;X=Y).

% найти книги, опубликованные более 1 раза
find_books_published_more_than_once(L) :-
  findall(X, book(X, _, [P1,P2|T], _), L).

% найти книги, опубликованные в последние 10 лет (после 2006 года)
find_books_published_in_last_10_years_by(R) :-
  findall([N,X], book(N, _, X, _), L),
  walk_y(L,R,2006).

walk_y([],[],P) :- !.
walk_y([H|T],R,Pr) :-
  walk_y(T,Res,Pr),
  H = [N,X],
  (check_year(X,Pr)->R=[N|Res];R=Res).

check_year([],X) :- false,!.
check_year([H|T],X) :-
  H = publication(_,_,Y,_,_),
  X < Y; check_year(T,X).

% найти книги, написанные указанным автором
find_books_written_by(AuthorName, AuthorSurname, L) :-
  findall(N, book(N, author(AuthorName,AuthorSurname,_), _, _), L).

% найти книги, цена которых выше указанной
find_books_with_price_more_than(Price, R) :-
  findall([N,X], book(N, _, X, _), L),
  walk(L,R,Price).

walk([],[],P) :- !.
walk([H|T],R,Pr) :-
  walk(T,Res,Pr),
  H = [N,X],
  (check_price(X,Pr)->R=[N|Res];R=Res).

check_price([],X) :- false,!.
check_price([H|T],X) :-
  H = publication(_,_,_,_,Price),
  X < Price; check_price(T,X).
