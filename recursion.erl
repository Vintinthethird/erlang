-module(recursion).
-export([fac/1,len/1,tail_fac/1,tail_len/1,tail_duplicate/2,tail_sublist/2,tail_lenient_zip/2,quicksort/1]).


% Function that gives N!
fac(0) -> 1;
fac(N) when N>0 -> N*fac(N-1).

% Recursion =:= a function that calls itself
% needs a stop condition

%% Function that counts elements in list

% Need a base case, a function that calls itself

% Base Cases:
%   len([]) -> 0;
%   len([_]) -> 1.

len([]) -> 0;
len([_|T]) -> 1 + len(T).


%% Tail Recursion %%

% The above example keeps a lot of values in memory, which could be a problem for a list with 10000000 items
% Tail recursion transforms the linear process into an iterative one

tail_fac(N) -> tail_fac(N,1).

tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).

% tail_fac(3) = tail_fac(3,1)
% tail_fac(3,1) = tail_fac(2,3*1)
% tail_fac(2,3) = tail_fac(1,2*3)
% tail_fac(1,6) = tail_fac(0,6)
% = 6

tail_len(L) -> tail_len(L,0).
tail_len([],Acc) -> Acc;
tail_len([_|T],Acc) -> tail_len(T,Acc+1).

% Takes an integer and any other parameter, creates n copies of 2nd parameter

duplicate(0,_) -> []; % This is the basic recursive form
duplicate(N,Term) when N > 0 -> [Term|duplicate(N-1,Term)].

tail_duplicate(N,Term) -> tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) ->
    List;
tail_duplicate(N,Term,List) when N > 0 -> 
    tail_duplicate(N-1,Term,[Term|List]).



reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++[H].

tail_reverse(L) -> tail_reverse(L,[]).
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T,[H|Acc]).


sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N>0 ->
    [H|sublist(T,N-1)].

tail_sublist(L,N) -> reverse(tail_sublist(L,N,[])).

tail_sublist(_,0,Sublist) -> Sublist;
tail_sublist([],_,Sublist) -> Sublist;
tail_sublist([H|T],N,Sublist) when N > 0 ->
    tail_sublist(T,N-1,[H|Sublist]).
    

% zip function that join two lists of equal length

% i.e [a,b,c],[1,2,3] -> [{a,1},{b,2},{c,3}]

lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs],[Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].



tail_lenient_zip(X,Y) -> tail_lenient_zip(X,Y,[]).

tail_lenient_zip([],_,List) -> List;
tail_lenient_zip(_,[],List) -> List;
tail_lenient_zip([X|Xs],[Y|Ys],List) -> tail_lenient_zip(Xs,Ys,[{X,Y}|List]).

%% Quicksort %%

% Takes first element in list, puts all elements =< in one list rest in a different list
% Take each list and do the same
% until 0 in lists, add all lists together

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller,Larger} = partition(Pivot,Rest,[],[]),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

 partition(_,[],Smaller,Larger) -> {Smaller,Larger};
 partition(Pivot,[H|T],Smaller,Larger) ->
     if H =< Pivot -> partition(Pivot,T,[H|Smaller],Larger);
        H > Pivot -> partition(Pivot,T,Smaller,[H|Larger])
    end.













