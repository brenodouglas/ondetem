defmodule OndeTem.Mixfile do
  use Mix.Project

  def project do
    [app: :onde_tem,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:maru, :logger, :ecto, :postgrex],
    mod: {OndeTem.API, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:maru, "~> 0.10"},
    {:postgrex, ">= 0.0.0"},
    {:ecto, "~> 2.0.0"},
    {:comeonin, "~> 1.0"},
    {:guardian, "~> 0.13.0"},
    {:cors_plug, "~> 1.2"},]
  end
end
