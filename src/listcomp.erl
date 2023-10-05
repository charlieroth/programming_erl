-module(listcomp).
-export([test/1, qsort/1]).

qsort([]) -> [];
qsort([Pivot | Rest]) ->
    qsort([X || X <- Rest, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- Rest, X >= Pivot]).

test(L) ->
    A = lists:map(fun(X) -> X * X end, L),
    B = [X * X || X <- L],
    A =:= B.