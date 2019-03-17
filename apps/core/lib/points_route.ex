defmodule PointRoute do
   @moduledoc """
    Liga pontos a uma rota.
  """
  use Ecto.Schema

  schema "point_route" do
    belongs_to :route, Route
    belongs_to :point, Point
  end

end
