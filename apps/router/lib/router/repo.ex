defmodule Router.Repo do
  use Ecto.Repo,
    otp_app: :router,
    adapter: Ecto.Adapters.Postgres
end
