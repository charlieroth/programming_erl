-module(shop).
-export([cost/1, total/1]).

total([{Item, Quantity} | Rest]) ->
    case cost(Item) of
        not_found -> not_found;
        Cost -> Cost * Quantity + total(Rest)
    end;
total([]) -> 0.

cost(oranges) -> 5;
cost(apples) -> 4;
cost(bananas) -> 6;
cost(newspaper) -> 8;
cost(_) -> 0.