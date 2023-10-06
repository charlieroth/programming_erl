%% Maps: Associative Key-Value Stores
%% ====================================================================
%% Map are appropriate for the following cases:
%% - Representing key-value data structures where the keys are not known
%%   in advance.
%% - Representing data with large numbers of different keys.
%% - As a ubiquitous data structure where efficiency is no important
%%   but convenience of use is.
%% - For "self-documenting" data structures; where the user can make a good
%%   guess at the meaning of the value of a key from the key name.
%% - For representing key-value parse tress such as XML or configuration files.
%% - For communication with other programming languages, using JSON.
-module(mymaps).
-export([person/3, can_drive/1, old_enough_to_drink/1]).

person(Name, Age, City) ->
    #{name => Name, age => Age, city => City}.

can_drive(Person) ->
    case maps:get(age, Person) of
        Age when Age >= 16 -> true;
        _ -> false
    end.

old_enough_to_drink(#{ age := Age}) when Age >= 21 -> true;
old_enough_to_drink(_) -> false.