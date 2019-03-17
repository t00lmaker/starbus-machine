defmodule RouterWeb.RouteControllerTest do
  use RouterWeb.ConnCase

  alias Router.Routes
  alias Router.Routes.Route

  @create_attrs %{
    is_active: true,
    name: "some name"
  }
  @update_attrs %{
    is_active: false,
    name: "some updated name"
  }
  @invalid_attrs %{is_active: nil, name: nil}

  def fixture(:route) do
    {:ok, route} = Routes.create_route(@create_attrs)
    route
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all routes", %{conn: conn} do
      conn = get(conn, Routes.route_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create route" do
    test "renders route when data is valid", %{conn: conn} do
      conn = post(conn, Routes.route_path(conn, :create), route: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.route_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => true,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.route_path(conn, :create), route: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update route" do
    setup [:create_route]

    test "renders route when data is valid", %{conn: conn, route: %Route{id: id} = route} do
      conn = put(conn, Routes.route_path(conn, :update, route), route: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.route_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => false,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, route: route} do
      conn = put(conn, Routes.route_path(conn, :update, route), route: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete route" do
    setup [:create_route]

    test "deletes chosen route", %{conn: conn, route: route} do
      conn = delete(conn, Routes.route_path(conn, :delete, route))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.route_path(conn, :show, route))
      end
    end
  end

  defp create_route(_) do
    route = fixture(:route)
    {:ok, route: route}
  end
end
