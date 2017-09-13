-module(useless).
-export([add/2,hello/0,greet_and_add_two/1]). 

% -module(Name) is always the first attribute, used to call functions:
%       e.g M:F(A)

% -export([Function1/Arity, Function2/Arity etc...])
% exported functions represent a modules interface - it is
% important to define an interface revealing only what is necessary

add(A,B) ->
    A + B.

% syntax of a function follows form:
%               Name(Args) -> Body. 
% where Name is an atom, and Body is a series of expressions seperated by commas

hello() ->
    io:format("Hello, World! ~n").

greet_and_add_two(X) ->
    hello(),
    add(X,2).

