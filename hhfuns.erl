-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X,Y) -> X() + Y().

% Only works with
%   - hhfuns:add(fun hhfuns:one/0, fun hhfuns:two/0)

% fun Module:Function/Arity binds the function to a variable


increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].
decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].

% The above functions are very similar -  they both cycle through a list
% and apply a function before calling themselves

map(_,[]) -> [];
map(F,[H|T]) -> [F(H)|map(F,T)].

incr(X) -> X+1.
decr(X) -> X-1.

% the map function abstracts the similar parts of the two functions
