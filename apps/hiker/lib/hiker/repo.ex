defmodule Hiker.Repo do
  use Ecto.Repo,
    otp_app: :hiker,
    adapter: Ecto.Adapters.Postgres
end
