action(Type, File) :- Type = 'append', open(File, append, S), write('Write text : '), read(String), write(S, String), close(S), !.
action(Type, File) :- Type = 'read', open(File, read, S), get_char(S, First_Char), process_stream(First_Char, S), close(S), !.
action(Type, File) :- Type = 'clear', open(File, write, S), write(''), close(S), !.
action(Type, File) :- Type = 'create', open(File, append, S), write(S,''), close(S), !.

process_stream(end_of_file, _) :- !.
process_stream(Char, In) :- print(Char), get_char(In, Char2), process_stream(Char2, In).

goal :- write('Write action : '), read(String), write('Write filename : '), read(FileName), action(String, FileName).
