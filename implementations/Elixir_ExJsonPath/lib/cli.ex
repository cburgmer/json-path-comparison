defmodule Jsonpath.CLI do
  def encode(j) do
    case Poison.encode(j) do
      {:ok, result} ->
        result

      {:error, {:invalid, object}} ->
        IO.puts("Invalid object returned")
        System.halt(1)
    end
  end

  def run(j, selector) do
    ExJSONPath.eval(j, selector)
  rescue
    exception ->
      {:error, exception}
  end

  def main(args) do
    json = IO.read(:stdio, :all)
    selector = hd(args)

    case run(Poison.decode!(json), selector) do
      {:ok, result} ->
        IO.puts(encode(result))

      {:error, %ExJSONPath.ParsingError{message: message}} ->
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
