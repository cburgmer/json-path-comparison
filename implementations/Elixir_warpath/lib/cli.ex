defmodule Jsonpath.CLI do
  def run(j, selector) do
    Warpath.query(j, selector)
  rescue
    exception -> {:error, exception}
  end

  def main(args) do
    json = IO.read(:stdio, :all)
    selector = hd(args)

    case run(Poison.decode!(json), selector) do
      {:ok, result} ->
        IO.puts(Poison.encode!(result))

      {:error, %Warpath.ExpressionError{message: message}} ->
        IO.puts(message)
        System.halt(2)

      {:error, %{__exception__: true, __struct__: module_name}} ->
        IO.puts(inspect(module_name))
        System.halt(1)

      {:error, error} ->
        IO.puts("#{inspect(error)}")
        System.halt(1)
    end
  end
end
