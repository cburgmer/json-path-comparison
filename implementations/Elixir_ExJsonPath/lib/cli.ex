defmodule Jsonpath.CLI do
  def main(args) do
    json = IO.read(:stdio, :all)
    selector = hd(args)
    {:ok, result} = Elixir.ExJSONPath.eval(Poison.decode!(json), selector)
    IO.puts(Poison.encode!(result))
  end
end
