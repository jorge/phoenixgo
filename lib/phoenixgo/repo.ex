defmodule Phoenixgo.Repo do
  use Ecto.Repo,
    otp_app: :phoenixgo,
    adapter: Ecto.Adapters.Postgres
end
