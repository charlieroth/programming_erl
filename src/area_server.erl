-module(area_server).
-export([loop/0, rpc/2]).
-import(geometry, [area/1]).

rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        {Pid, Response} -> Response
    end.

loop() ->
    receive
        {From, {rectangle, Width, Height}} ->
            Area = area({rectangle, Width, Height}),
            From ! {self(), Area},
            loop();
        {From, {square, Side}} ->
            Area = area({square, Side}),
            From ! {self(), Area},
            loop();
        {From, {circle, Radius}} ->
            Area = area({circle, Radius}),
            From ! {self(), Area},
            loop();
        {From, Other} ->
            From ! {self(), {error, Other}},
            loop()
    end.
    

