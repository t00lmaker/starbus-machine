defmodule Vehicle do
  @moduledoc """
    Define um veículo no starbus.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "vehicles" do
    field :identify, :string
    field :plate, :string
    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:identify, :plate])
    |> validate_required([:identify, :plate])
  end
end
