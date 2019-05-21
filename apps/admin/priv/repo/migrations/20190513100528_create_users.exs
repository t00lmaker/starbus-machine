defmodule Admin.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, 
      add :password, :string
      add :uuid, :string

      timestamps()
    end
    
    create unique_index(:change, [:username, :uuid])

  end
end
