%%%-------------------------------------------------------------------
%% @doc programming_erl public API
%% @end
%%%-------------------------------------------------------------------

-module(programming_erl_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    programming_erl_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
