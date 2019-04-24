defmodule Router.Repo.Migrations.CreatePoints do
  use Ecto.Migration

  def change do
    create table(:points) do
      add :lat, :string
      add :long, :string
      add :name, :string
      add :type, :string
      add :info, :text
      add :active, :boolean, default: false
      timestamps()
    end
  end
end
