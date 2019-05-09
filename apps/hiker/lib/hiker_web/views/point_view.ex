defmodule HikerWeb.PointView do
  use HikerWeb, :view
  alias HikerWeb.PointView

  def render("index.json", %{points: points}) do
    %{data: render_many(points, PointView, "point.json")}
  end

  def render("show.json", %{point: point}) do
    %{data: render_one(point, PointView, "point.json")}
  end

  def render("point.json", %{point: point}) do
    %{
      id: point.id,
      name: point.name,
      info: point.info,
      long: point.long,
      lat: point.lat,
      active: point.active,
      type: point.type
    }
  end
end
