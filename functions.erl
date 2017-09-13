-module(functions).
-compile(export_all).

greet(male,Name) ->
    io:format("Hello, Mr. ~s!", [Name]);
greet(female,Name) ->
    io:format("Hello, Mrs. ~s!",[Name]);
greet(_,Name) -> 
    io:format("Hello, ~s!",[Name]).

% As shown, can use pattern matching to define 
% what part of a function should be used

% i.e :
%   function(X) ->
%       Expression;
%   function(Y) ->
%       Expression;

% Each expression is called a function clause, and is 
% seperated by semicolons.

head([H|_]) -> H.

% acts like inbuilt hd/1, returns first item of a list

second([_,X|_]) -> X.

% gets second element of list by deconstructing

same(X,X) ->
    true;
same(_,_) ->
    false.

% when same(a,a) is called, first X is unbound so automatically takes value a.
% When goes to second argument, sees X is already bound, compares to second argument.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
    io:format("The date tuple (~p) says today is: ~p/~p/~p,~n",
    [Date,Y,M,D]),
    io:format("The time tuple (~p) indicates: ~p:~p:~p. ~n",
    [Time,H,Min,S]);
valid_time(_) ->
    io:format("Wrong data!").

% This dunctions could take anything for values, even text or atoms, as long as the 
% tuples {{A,B,C},{D,E,F}}. This can be improved with guards.

%% Guards %%

old_enough(X) when X >= 16, X=< 104 ->
    true;
right_age(_) ->
    false.

% A basic rule for guard expression is they must return true to succeed.
% Guards wont accept user-defined functions
% The ; and , are similar to orelse and andalso. 
% However, : and , will catch exceptions as they happen
