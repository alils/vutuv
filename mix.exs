defmodule Vutuv.Mixfile do
  use Mix.Project

  def project do
    [app: :vutuv,
     version: "1.5.2",
     elixir: "~> 1.8.1",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Vutuv, []},
     applications: [:phoenix,
                    :phoenix_pubsub,
                    :phoenix_html,
                    :cowboy,
                    :logger,
                    :gettext,
                    :phoenix_ecto,
                    :ex_machina,
                    :phoenix_html_simplified_helpers,
                    :bamboo,
                    :bamboo_smtp,
                    :mariaex,
                    :httpoison,
                    :slugger,
                    :timex_ecto,
                    :word_smith,
                    :arc,
                    :arc_ecto,
                    :quantum,
                    :number]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:ecto, "~> 2.0.1", override: true},
     {:bamboo, "~> 1.2"},
     {:bamboo_smtp, "~> 1.6"},
     {:phoenix, "~> 1.2.0"},
     {:phoenix_ecto, "~> 3.0.0-rc"},
     {:phoenix_html, "~> 2.8"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:phoenix_html_simplified_helpers, "~> 2.1"},
     {:gettext, "~> 0.12.1"},
     {:cowboy, "~> 1.0"},
     {:arc, "~> 0.11"},
     {:arc_ecto, "~> 0.11.1"},
     {:ex_machina, "~> 1.0"},
     {:mariaex, ">= 0.0.0"},
     {:word_smith, "~> 0.1.0"},
     {:slugger, "~> 0.1.0"},
     {:httpoison, "~> 1.5"},
     {:distillery, "~> 1.1.0"},
     {:quantum, "~> 2.3"},
     {:number, "~> 0.5.1"},
     {:poison, "~> 2.0"},
     {:plug, "~> 1.3"}
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
