defmodule Jsonpath.CLI do
  def run(j, selector) do
    Warpath.query(j, selector)
  rescue
    exception in [FunctionClauseError, Jason.DecodeError] ->
      {:error, exception}
  end

  def main(args) do
    json = IO.read(:stdio, :all)
    selector = hd(args)
    case run(Poison.decode!(json), selector) do
      {:ok, result} -> IO.puts(Poison.encode!(result))
      {:error, %Warpath.ExpressionError{message: message}} ->
        IO.puts(message)
        System.halt(2)
      {:error, {:unsupported_operation, message}} ->
        IO.puts(message)
        System.halt(1)
      {:error, %Jason.DecodeError{}} ->
        IO.puts("Jason.DecodeError")
        System.halt(1)
      {:error, %FunctionClauseError{}} ->
        IO.puts("FunctionClauseError")
        System.halt(1)
      {:error, exception} ->
        IO.puts(exception)
        System.halt(1)
    end
  end
end
