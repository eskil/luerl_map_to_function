defmodule LuerlMapToFunction.MixProject do
  use Mix.Project

  def project do
    [
      app: :luerl_map_to_function,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [
        main_module: LuerlMapToFunction,
        comment: "Sample escript to test map to function",
      ],
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
      {:luerl, git: "https://github.com/rvirding/luerl.git"}
    ]
  end
end
