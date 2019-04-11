defmodule Admin.Repo.Migrations.CreateClients do

  @moduledoc """
  Migrate  create Clients
  """
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :description, :text
      add :active, :boolean, default: false, null: false
      add :url_logo, :string

      timestamps()
    end
  end
end
