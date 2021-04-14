defmodule Keeper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Keeper.Worker.start_link(arg)
      # {Keeper.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: KeeperWeb.Router, options: [port: 8080]},
      Keeper.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Keeper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
