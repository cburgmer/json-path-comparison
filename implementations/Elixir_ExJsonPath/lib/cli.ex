defmodule Jsonpath.CLI do
  def main(args) do
    json = IO.read(:stdio, :all)
    selector = hd(args)
    case ExJSONPath.eval(Poison.decode!(json), selector) do
      {:ok, result} -> IO.puts(Poison.encode!(result))
      {:error, %ExJSONPath.ParsingError{message: message}} ->
        IO.puts(message)
        System.halt(2)
      {:error, exception} ->
        System.halt(1)
    end
  end
end
