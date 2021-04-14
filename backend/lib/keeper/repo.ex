defmodule Keeper.Repo do
  use Ecto.Repo,
    otp_app: :keeper,
    adapter: Ecto.Adapters.SQLite3
end
