defmodule Votechain.MixProject do
  use Mix.Project

  def project do
    [
      app: :votechain,
      version: "0.1.0",
      elixir: "~> 1.11",
      escript: escript(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:poison, "~> 3.1"}
    ]
  end

  defp escript do
    [main_module: Votechain.CLI]
  end
end
