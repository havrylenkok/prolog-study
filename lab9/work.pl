% производитель, количество ядер, ОЗУ, ПЗУ, диагональ, материал крышки, формфактор
% [0]: 3 - samsung, 4 - apple, 2 - xiaomi, 1 - nokia
% [-2]: 1 - glass, 2 - aluminum, 3 - plastic
% [-1]: 1 - mono, 2 - book
% phone(3, 2, 4, 32, 5.5, 1, 2).
% phone(4, 4, 2, 128, 5.0, 2, 1).
% phone(4, 4, 2, 32, 5.0, 2, 1).
% phone(2, 8, 16, 128, 5.2, 1, 1).
% phone(2, 4, 4, 16, 5.5, 1, 1).
% phone(1, 1, 1, 8, 2.1, 3, 1).

phone(4, CPUS, RAM, ROM, Size, Material, Formfactor, Price):-
  Price is 470 + CPUS * 20 + RAM * 10 + ROM * 2 + Size + Material * 5 - Formfactor * 5, !.
phone(3, CPUS, RAM, ROM, Size, Material, Formfactor, Price):-
    Price is 450 + CPUS * 20 + RAM * 10 + ROM * 2 + Size + Material * 6 - Formfactor * 5, !.
phone(2, CPUS, RAM, ROM, Size, Material, Formfactor, Price):-
    Price is 100 + CPUS * 20 + RAM * 10 + ROM / 2 + Size + Material * 3 - Formfactor * 5, !.
phone(1, CPUS, RAM, ROM, Size, Material, Formfactor, Price):-
    Price is 0 + CPUS * 20 + RAM * 10 + ROM / 4 + Size + Material * 1 - Formfactor * 5, !.

goal :-
  write("Let's calculate what is the cost of your phone "),
  nl,
  write("Enter manufacturer: 1 for Nokia, 2 for Xiaomi, 3 for Samsung, 4 for Apple "),
  read(M),
  write("Enter number of CPUs in your phone: "),
  read(C),
  write("Enter RAM in your phone: "),
  read(Ram),
  write("Enter ROM in your phone: "),
  read(Rom),
  write("Enter size of your phone: 1 for <= 5.0\", 2 for > 5.0 "),
  read(S),
  write("Enter material of your phone: 1 for plastic, 2 for glass, 3 for aluminum "),
  read(Mat),
  write("Enter formfactor of your phone: 1 for mono, 2 for book"),
  read(F),
  phone(M, C, Ram, Rom, S, Mat, F, Price),
  write(Price),
  !.
