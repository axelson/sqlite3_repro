defmodule Sqlite3Repro.MixProject do
  use Mix.Project

  def project do
    [
      app: :sqlite3_repro,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Sqlite3Repro.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, ">= 0.0.0"},
      {:ecto_sql, "~> 3.6"},
      {:ecto_sqlite3, "~> 0.16"},
    ]
  end
end
