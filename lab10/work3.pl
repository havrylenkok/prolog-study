goal3:-question,action(X),write(X),retract(cond(_)).
question:-write('Do you have money?'),nl,read(X),X='yes', asserta(cond(have_money)),fail.
question:-write('Has new iphone already been released?'),nl,read(X),X='yes',asserta(cond(iphone)),fail.
question:-write('Do you really need new iphone?'),nl,read(X),X='yes', asserta(cond(new_one)).
question.
action('don\'t buy new iphone, save money for food'):- \+ (cond(have_money)),!.
action('wait for Apple to realease new iphone'):-cond(have_money), \+ (cond(iphone)),!.
action('wait for another iphone'):-cond(have_money),cond(iphone), \+ (cond(new_one)),!.
action('buy new iphone'):-cond(iphone),cond(new_one),!.
