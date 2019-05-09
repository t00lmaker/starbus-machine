defmodule HikerWeb.RouteView do
  use HikerWeb, :view
  alias HikerWeb.RouteView

  def render("index.json", %{routes: routes}) do
    %{data: render_many(routes, RouteView, "route.json")}
  end

  def render("show.json", %{route: route}) do
    %{data: render_one(route, RouteView, "route.json")}
  end

  def render("route.json", %{route: route}) do
    %{id: route.id, name: route.name, info: route.info, active: route.active}
  end
end
