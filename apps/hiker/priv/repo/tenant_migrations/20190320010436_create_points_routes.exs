defmodule Router.Repo.Migrations.CreatePointsRoutes do
  use Ecto.Migration

  def change do
    create table(:points_route, primary_key: false) do
      add :point_id, references(:points)
      add :route_id, references(:routes)
    end

    create unique_index(:points_route, [:point_id, :route_id])
  end
end
