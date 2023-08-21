defmodule Lvirus.Repo do
  use Ecto.Repo,
    otp_app: :lvirus,
    adapter: Ecto.Adapters.Postgres
end
