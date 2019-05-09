defmodule HikerWeb.PointController do
  use HikerWeb, :controller

  alias Hiker.Router

  action_fallback HikerWeb.FallbackController

  def index(conn, %{"route_id" => route_id}, client) do
    route = Router.get_route!(route_id, client)
    points = Router.list_points_in(route)
    render(conn, "index.json", points: points)
  end

  def index(conn, _params, client) do
    points = Router.list_points(client)
    render(conn, "index.json", points: points)
  end

  def create(conn, %{"route_id" => route_id, "point" => point_params}, client) do
    route = Router.get_route!(route_id, client)
    point = Router.create_point_route(point_params, route, client)

    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.point_path(conn, :show, point))
    |> render("show.json", point: point)
  end

  def create(conn, %{"point" => point_params}, client) do
    with {:ok, %Point{} = point} <- Router.create_point(point_params, client) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.point_path(conn, :show, point))
      |> render("show.json", point: point)
    end
  end

  def show(conn, %{"id" => id}, client) do
    point = Router.get_point!(id, client)
    render(conn, "show.json", point: point)
  end

  def update(conn, %{"id" => id, "point" => point_params}, client) do
    point = Router.get_point!(id, client)

    with {:ok, %Point{} = point} <- Router.update_point(point, point_params, client) do
      render(conn, "show.json", point: point)
    end
  end

  def delete(conn, %{"id" => id}, client) do
    point = Router.get_point!(id, client)

    with {:ok, %Point{}} <- Router.delete_point(point, client) do
      send_resp(conn, :no_content, "")
    end
  end

  def action(conn, _) do
    client = conn.assigns[:current_tenant]
    args = [conn, conn.params, client]
    apply(__MODULE__, action_name(conn), args)
  end
end
