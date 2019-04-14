defmodule Router.Repo.Migrations.CreateRoute do
  use Ecto.Migration

  def change do
    create table(:routes) do
      add :name, :string
      add :info, :text
      add :active, :boolean, default: false
      add :user_id, references(:users)

      timestamps()
    end
  end
end
