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

% https://stackoverflow.com/questions/44629823/how-to-apply-timeout-on-method-in-erlang
execute(Selector, Doc) ->
    TimeOut = 4000,
    Self = self(),
    _Pid = spawn(fun()->
                         try
                             Result = ejsonpath:execute(Selector, Doc),
                             Self ! {self(), ok, Result}
                         catch
                             _:Reason -> Self ! {self(), error, Reason}
                         end
                 end),
    receive
        {_PidSpawned, ok, Result} -> {ok, Result};
        {_PidSpawned, error, Reason} -> {error, Reason}
    after
        TimeOut -> {error, "Timeout"}
    end.

fail(Reason) ->
    io:fwrite("~s~n", [Reason]),
    init:stop(1).

not_supported(Reason) ->
    io:fwrite("~s~n", [Reason]),
    init:stop(2).

run(Selector, Doc) ->
    case execute(Selector, Doc) of
        {ok, Result} ->
            Json = jiffy:encode(Result),
            io:fwrite("~s~n", [Json]);
        {error, {badmatch, {_, {_, ejsonpath_parse, Message}}}} ->
            not_supported(Message);
        {error, "Timeout"} ->
            fail("Timeout");
        {error, Reason} ->
            exit(Reason)
    end.

start([Selector]) ->
    Bin = read(),
    Doc = jiffy:decode(Bin, [return_maps]),
    run(Selector, Doc).
