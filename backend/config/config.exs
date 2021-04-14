import Config

config :keeper,
  ecto_repos: [Keeper.Repo]

config :keeper, Keeper.Repo, database: "priv/db/database.db"
