defmodule Mix.Tasks.Execute do
  use Mix.Task

  def run(args) do
    json = IO.read(:stdio, :all)
    selector = hd(args)
    {:ok, result} = Elixir.ExJSONPath.eval(Poison.decode!(json), selector)
    IO.puts(Poison.encode!(result))
  end
end
