defmodule Router.Repo.Migrations.CreatePoints do
  use Ecto.Migration

  def change do
    create table(:points) do
      add :lat, :string
      add :long, :string
      add :name, :string
      add :info, :text
      add :type, :string
      add :active, :boolean, default: false
      timestamps()
    end
  end
end
