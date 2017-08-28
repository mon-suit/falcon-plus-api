defmodule FalconPlusApi.Mixfile do
  use Mix.Project

  def project do
    [app: :falcon_plus_api,
     version: "0.2.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package(),
     name: "falcon_plus_api",
     source_url: "https://github.com/sawater/falcon-plus-api"
    ]
  end

  def application do
    [
      mod: {FalconPlusApi, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.11.0"},
      {:poison, "~> 2.0"},
      {:timex, "~> 3.1"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    """
    Api of OpenFalcon-Plus
    """
  end

  defp package do
    [
      maintainers: ["赵思宇"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/sawater/falcon-plus-api"}
    ]
  end
end
