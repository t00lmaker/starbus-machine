defmodule Point do
  @moduledoc """
      Representação de um ponto no mapa.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "points" do
    field :lat, :string, default: "0.0"
    field :long, :string, default: "0.0"
    field :name, :string
    field :info, :string
    field :type, :string
    field :active, :boolean
    timestamps()
  end

  @doc false
  def changeset(point, attrs) do
    point
    |> cast(attrs, [:lat, :long, :name, :info, :type, :active])
    |> validate_required([:lat, :long, :type])
  end
end
