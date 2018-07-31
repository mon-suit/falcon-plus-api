defmodule FalconPlusApi.Mixfile do
  use Mix.Project

  def project do
    [app: :falcon_plus_api,
     version: "1.0.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package(),
     name: "falcon_plus_api",
     source_url: "https://github.com/mon-suit/falcon-plus-api"
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
      {:poison, "~> 3.0"},
      {:maxwell, "~> 2.2"},
      {:maxwell_compress, "~> 0.1.0"},
    ]
  end

  defp description do
    """
    Api of OpenFalcon-Plus
    """
  end

  defp package do
    [
      maintainers: ["milkwine"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mon-suit/falcon-plus-api"}
    ]
  end
end
