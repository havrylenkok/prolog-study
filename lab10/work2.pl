frame(name(smartphone),is_A(mobile_device),where_user_can_bring(everywhere),_).
frame(name(smartphone),is_A(mobile_device),color(purple),_).
frame(name(iphone),is_A(smartphone),color(black),_).
frame(name(xiaomi),is_A(smartphone),color(white),_).
frame(name(nokia),is_A(smartphone),where_user_can_bring(even_to_hell),_).

get(Prop,Obj):-frame(name(Obj),_,Prop,_).
get(Prop,Obj):-frame(name(Obj),is_A(Parent),_,_),get(Prop,Parent).

goal2:-
  get(color(X),iphone),
  write("color of iphone: "),
  write(X),
  nl,
  get(color(Y),nokia),
  write("color of nokia: "),
  write(Y),
  nl,
  get(where_user_can_bring(Z),iphone),
  write("where user can bring iphone: "),
  write(Z),
  nl,
  get(color(D),smartphone),
  write("color of basic phone: "),
  write(D).
