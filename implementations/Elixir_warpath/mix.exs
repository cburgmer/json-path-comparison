defmodule Jsonpath.MixProject do
  use Mix.Project

  def project do
    [
      app: :jsonpath,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      deps_path: "build/deps",
      build_path: "build/dev",
      escript: [main_module: Jsonpath.CLI]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:warpath, ">= 0.1.0"},
      {:poison, "~> 3.1"}
    ]
  end
end
