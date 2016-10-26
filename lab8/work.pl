use_module(library(lists)).

% check if there are digits in input lists
hasDigits([A|B]):- is_digit(A, 10, _) -> write(A), hasDigits(B); hasDigits(B).
hasDigits([]):- !.
count(Sym, [], 0):-!.
count(Sym, [Sym|B], Res) :- count(Sym, B, Res2), Res is Res2+1, !.
count(Sym, [A|B], Res) :- count(Sym, B, Res).
has2SameInRow([A,A|T]) :-!.
has2SameInRow([A,B|T]) :- L = [B|T], has2SameInRow(L).
doubleSymbol(Sym, [], []) :- !.
doubleSymbol(Sym, [Sym|B], Res) :- doubleSymbol(Sym, B, R),Res = [Sym,Sym|R],!.
doubleSymbol(Sym, [A|B], Res) :- doubleSymbol(Sym, B, R), Res = [A|R].



tasks(Letter) :-
  write("Waiting for input: "),
  read(Input),
  open("lab8.txt", write, File),
  write(File, Input),
  write(File, "."),
  close(File),
  atom_chars(Input, LInput),
  hasDigits(LInput),
  open("lab8.txt", read, File2),
  read(File2, FileContents),
  close(File2),
  write(FileContents),
  nl,
  write("Reverse input: "),
  reverse(LInput, RInput),
  text_to_string(RInput, RStr),
  write(RStr),
  nl,
  write("Letter counter: "),
  count(Letter, LInput, C),
  write(C),
  nl,
  write("Double Letter"),
  doubleSymbol(Letter, LInput, DRes),
  write(DRes),
  nl,
  write("Is there 2 same symbols in a row in input? "),
  has2SameInRow(LInput).
