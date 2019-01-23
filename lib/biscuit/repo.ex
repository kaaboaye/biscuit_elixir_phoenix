defmodule Biscuit.Repo do
  use Ecto.Repo,
    otp_app: :biscuit,
    adapter: Ecto.Adapters.Postgres
end
