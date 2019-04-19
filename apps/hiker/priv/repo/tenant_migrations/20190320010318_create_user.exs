defmodule Router.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :uuid, :string
      add :email, :string
      add :active, :boolean, default: true
      timestamps()
    end
    create unique_index(:users, [:email])
    create unique_index(:users, [:uuid])
  end
end
