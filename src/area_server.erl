-module(area_server).
-export([loop/0]).

-import(geometry, [area/1]).

loop() ->
    receive
        {rectangle, _Width, _Height} = Message ->
            Area = area(Message),
            io:format("Area of rectangle is ~p~n", [Area]),
            loop();
        {square, _Side} = Message ->
            Area = area(Message),
            io:format("Area of square is ~p~n", [Area]),
            loop()
    end.