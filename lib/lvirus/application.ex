defmodule Lvirus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LvirusWeb.Telemetry,
      # Start the Ecto repository
      Lvirus.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lvirus.PubSub},
      # Start Finch
      {Finch, name: Lvirus.Finch},
      # Start the Endpoint (http/https)
      LvirusWeb.Endpoint
      # Start a worker by calling: Lvirus.Worker.start_link(arg)
      # {Lvirus.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lvirus.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LvirusWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
