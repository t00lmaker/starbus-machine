defmodule Point do
  @moduledoc """
      Representação de um ponto no mapa.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "points" do
    field :lat,  :string, default: "0.0"
    field :long, :string, default: "0.0"
    field :name, :string
    timestamps()
  end

  @doc false
  def changeset(point, attrs) do
    point
    |> cast(attrs, [:lat, :long, :name])
    |> validate_required([:lat, :long])
  end

end
