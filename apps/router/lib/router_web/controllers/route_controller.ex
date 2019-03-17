defmodule RouterWeb.RouteController do
  use RouterWeb, :controller

  action_fallback RouterWeb.FallbackController

  def index(conn, _params) do
    routes = Routes.list_routes()
    render(conn, "index.json", routes: routes)
  end

  def create(conn, %{"route" => route_params}) do
    with {:ok, %Route{} = route} <- Routes.create_route(route_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.route_path(conn, :show, route))
      |> render("show.json", route: route)
    end
  end

  def show(conn, %{"id" => id}) do
    route = Routes.get_route!(id)
    render(conn, "show.json", route: route)
  end

  def update(conn, %{"id" => id, "route" => route_params}) do
    route = Routes.get_route!(id)

    with {:ok, %Route{} = route} <- Routes.update_route(route, route_params) do
      render(conn, "show.json", route: route)
    end
  end

  def delete(conn, %{"id" => id}) do
    route = Routes.get_route!(id)

    with {:ok, %Route{}} <- Routes.delete_route(route) do
      send_resp(conn, :no_content, "")
    end
  end
end
