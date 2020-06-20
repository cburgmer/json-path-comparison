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
        {_PidSpawned, ok, Result} -> Result;
        {_PidSpawned, error, Reason} -> exit(Reason)
    after
        TimeOut -> exit("Timeout")
    end.

not_supported(Reason) ->
    io:fwrite("~s~n", [Reason]),
    init:stop(2).

print_result(Selector, Doc) ->
    try
        Result = execute(Selector, Doc),
        Json = jiffy:encode(Result),
        io:fwrite("~s~n", [Json])
    catch
        _:{badmatch, {_, {_, ejsonpath_parse, Message}}} -> not_supported(Message)
    end.

start([Selector]) ->
    Bin = read(),
    Doc = jiffy:decode(Bin, [return_maps]),
    print_result(Selector, Doc).
