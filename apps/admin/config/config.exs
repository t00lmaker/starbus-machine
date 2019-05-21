# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :admin,
  ecto_repos: [Admin.Repo]

# Configures the endpoint
config :admin, AdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VAMMpZjFspBOsYt7XJ31x8YVXu8Z6CaX46ZeLspQ+JNCogZuhU3uaqe1sDCWr9Kt",
  render_errors: [view: AdminWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Admin.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Configure multenacy 
config :triplex, repo: Admin.Repo

 # Configuração de autenticação com Guardia e JWT.
config :admin, Admin.Auth.Guardian,
  issuer: "starbus_admin",
  ttl: {2, :days},
  secret_key: "MZIy7pjsGtkHAnhcnjScFcSemY0l/VP+gmn01pvCCRGBJRxbxRZeKjK2YC80K/ba"
