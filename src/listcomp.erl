-module(listcomp).
-export([test/1, qsort/1, pythag/1]).

%% List Comprehensions
%% 
%% Expressions that create lists without having to use
%% funs, maps, or filters. Designed to make programs shorter
%% and easier to understand once understood.
%% 
%% [F(X) || X <- L]
%% The list of F(X) where X is taken from the list L
%%
%% [2 * X || X <- L]
%% The list of 2 * X where X is taken from the list L
%% 
%% The most general form of a list comprehension is an expression
%% in the following form:
%% [X || Qualifier1, Qualifier2, ...]
%% 
%% X is an arbitrary expression and each Qualifier is either a generator,
%% a bitstring generator, or a filter.
%% 
%% Generators: Pattern <- ListExpr where ListExpr must be an expression
%% that evaluates to a list of terms.
%% 
%% Bitstring Generators: BitStringPattern <= BitStringExpr where BitStringExpr
%% must be an expression that evaluates to a bitstring.
%% 
%% Filters are either predicates (functions that return true or false) or
%% boolean expressions.

qsort([]) -> [];
qsort([Pivot | Rest]) ->
    qsort([X || X <- Rest, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- Rest, X >= Pivot]).


%% Pythagorean Triplets
%% A set of integers {A, B, C} where A^2 + B^2 = C^2

pythag(N) ->
    [
        {A, B, C} ||
            A <- lists:seq(1, N),
            B <- lists:seq(1, N),
            C <- lists:seq(1, N),
            A + B + C =< N,
            A*A+B*B =:= C*C
    ].

test(L) ->
    A = lists:map(fun(X) -> X * X end, L),
    B = [X * X || X <- L],
    A =:= B.