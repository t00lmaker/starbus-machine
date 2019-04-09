use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :admin, AdminWeb.Endpoint,
  secret_key_base: "fxzbXmIfoNTNCkqmLuH2tHgwfI+kQstAxqGD8idXEQeF4+NCuoRyZzaWccqZA/le"

# Configure your database
config :admin, Admin.Repo,
  username: "postgres",
  password: "postgres",
  database: "admin_prod",
  pool_size: 15
