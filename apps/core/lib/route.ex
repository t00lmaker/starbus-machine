defmodule Route do
  @moduledoc """
    Define uma rota que pode ser salva. 
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "routes" do
    field(:name, :string)
    field(:info, :string)
    field(:active, :boolean)
    belongs_to(:user, User)
    has_many(:points_route, PointRoute)
    has_many(:points, through: [:points_route, :point])
    timestamps()
  end

  @doc false
  def changeset(route, attrs) do
    route
    |> cast(attrs, [:name, :info, :active])
    |> validate_required([:name])
  end
end
