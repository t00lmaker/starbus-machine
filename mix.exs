defmodule Starbus.MixProject do
  @moduledoc false

  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      aliases: aliases(),
      preferred_cli_env: [coveralls: :test]
    ]
  end


  defp aliases do
    [
      "test.setup": [
        "cmd MIX_ENV=test mix test.setup"
      ],
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:ecto, "~> 3.0"},
      {:excoveralls, "~> 0.10", only: :test, runtime: false},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:inch_ex, only: :docs}
    ]
  end
end
