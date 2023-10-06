-module(area_server).
-export([start/0, loop/0, area/2, rpc/2]).

start() ->
    spawn(area_server, loop, []).

area(Pid, What) ->
    rpc(Pid, What).

rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        {Pid, Response} -> Response
    end.

loop() ->
    receive
        {From, {rectangle, Width, Height}} ->
            Area = geometry:area({rectangle, Width, Height}),
            From ! {self(), Area},
            loop();
        {From, {square, Side}} ->
            Area = geometry:area({square, Side}),
            From ! {self(), Area},
            loop();
        {From, {circle, Radius}} ->
            Area = geometry:area({circle, Radius}),
            From ! {self(), Area},
            loop();
        {From, Other} ->
            From ! {self(), {error, Other}},
            loop()
    end.
    

