defmodule Mix.Tasks.Execute do
  use Mix.Task

  def run(args) do
    json = IO.read(:stdio, :all)
    stream = [json]
    selector = hd(args)
    result = stream |> Jaxon.Stream.query(Jaxon.Path.parse!(selector)) |> Enum.to_list()
    IO.puts(Poison.encode!(result))
  end
end
