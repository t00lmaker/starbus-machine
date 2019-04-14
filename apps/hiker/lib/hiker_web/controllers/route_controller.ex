defmodule HikerWeb.RouteController do
  use HikerWeb, :controller

  alias Hiker.Router

  action_fallback HikerWeb.FallbackController

  def index(conn, _params) do
    routes = Router.list_routes()
    render(conn, "index.json", routes: routes)
  end

  def create(conn, %{"route" => route_params}) do
    client = conn.assigns[:current_tenant]
    with {:ok, %Route{} = route} <- Router.create_route(route_params, client) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.route_path(conn, :show, route))
      |> render("show.json", route: route)
    end
  end

  def show(conn, %{"id" => id}) do
    client = conn.assigns[:current_tenant]
    route = Router.get_route!(id, client)
    render(conn, "show.json", route: route)
  end

  def update(conn, %{"id" => id, "route" => route_params}) do
    client = conn.assigns[:current_tenant]

    route = Router.get_route!(id, client)

    with {:ok, %Route{} = route} <- Router.update_route(route, route_params, client) do
      render(conn, "show.json", route: route)
    end
  end

  def delete(conn, %{"id" => id}) do

    client = conn.assigns[:current_tenant]

    route = Router.get_route!(id, client)

    with {:ok, %Route{}} <- Router.delete_route(route, client) do
      send_resp(conn, :no_content, "")
    end
  end
end
