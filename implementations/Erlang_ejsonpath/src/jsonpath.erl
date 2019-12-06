-module(jsonpath).
-export([start/1]).

-define(BLK_SIZE, 16384).

read() ->
    ok = io:setopts(standard_io, [binary]),
    read(<<>>).

read(Acc) ->
    case file:read(standard_io, ?BLK_SIZE) of
        {ok, Data} ->
            read(<<Acc/bytes, Data/bytes>>);
        eof ->
            Acc
    end.

print_result(Selector, Doc) ->
    Result = ejsonpath:execute(Selector, Doc),
    Json = jiffy:encode(Result),
    io:fwrite("~s~n", [Json]).

start([Selector]) ->
    Bin = read(),
    Doc = jiffy:decode(Bin, [return_maps]),
    try print_result(Selector, Doc)
    catch
        _:Reason -> exit(Reason)
    end.
