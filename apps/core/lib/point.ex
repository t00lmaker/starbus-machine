defmodule Point do
  @moduledoc """
      Representação de um ponto no mapa.
  """

  defstruct lat: 0.0, long: 0.0, name: nil
  
  import Ecto.Changeset

  @types %{lat: :decimal, long: :decimal, name: :string}

  @doc false
  def changeset(point, attrs) do
    {point, @types}
    |> cast(attrs, [:lat, :long, :name])
    |> validate_required([:lat, :long])
  end

end
