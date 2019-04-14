defmodule Hiker.Router.Route do
  use Ecto.Schema
  import Ecto.Changeset

  schema "routes" do
    field :info, :string
    field :is_active, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(route, attrs) do
    route
    |> cast(attrs, [:name, :info, :is_active])
    |> validate_required([:name, :info, :is_active])
  end
end
