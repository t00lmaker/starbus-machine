defmodule Router.Repo.Migrations.CreatePointsRoutes do
  use Ecto.Migration

  def change do
    create table(:points_routes, primary_key: false) do
      add :point_id, references(:points)
      add :route_id, references(:routes)
    end
  end
end
