% is_A(Child, Parent)
% property(Obj, Prop, Val)

is_A(smartphone, mobile_device).
is_A(iphone, smartphone).
is_A(xiaomi, smartphone).
is_A(smart_watch, mobile_device).
is_A(apple_watch, smart_watch).
is_A(google_watch, smart_watch).

property(mobile_device, capacity, variable).
property(mobile_device, display, 1).
property(smart_watch, capacity, one).
property(smartphone, capacity, many).
property(iphone, display, 8).
property(xiaomi, display, 5).

has_prop(Obj,Prop,Val):-property(Obj,Prop,Val),!.
has_prop(Obj,Prop,Val):-is_A(Obj,Parent),has_prop(Parent,Prop,Val).

goal:-
  has_prop(iphone,display,X),
  write("size of display of the iphone: "),
  write(X),
  nl,
  has_prop(iphone,capacity,Y),
  write("capacity of the iphone: "),
  write(Y),
  nl,
  has_prop(apple_watch,capacity,Z),
  write("apple watch capacity: "),
  write(Z),
  nl,
  has_prop(apple_watch,display,D),
  write("size of display of apple watch: "),
  write(D).
