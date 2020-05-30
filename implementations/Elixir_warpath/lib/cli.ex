defmodule Jsonpath.CLI do
  def main(args) do
    json = IO.read(:stdio, :all)
    selector = hd(args)
    case Warpath.query(Poison.decode!(json), selector) do
      {:ok, result} -> IO.puts(Poison.encode!(result))
      {:error, %Warpath.ExpressionError{message: message}} ->
        IO.puts(message)
        System.halt(2)
      {:error, exception} -> raise exception
    end
  end
end
