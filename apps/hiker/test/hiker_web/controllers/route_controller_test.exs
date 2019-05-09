defmodule HikerWeb.RouteControllerTest do
  use HikerWeb.ConnCase

  alias Hiker.Router

  @client "client_test"

  @create_attrs %{
    name: "some name",
    info: "some info",
    active: true
  }
  @update_attrs %{
    name: "some updated name",
    info: "some updated info",
    active: true
  }
  @invalid_attrs %{info: nil, is_active: nil, name: nil}

  def fixture(:route) do
    {:ok, route} = Router.create_route(@create_attrs, @client)
    route
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all routes", %{conn: conn} do
      conn = get(conn, Routes.route_path(conn, :index), local: @client)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create route" do
    test "renders route when data is valid", %{conn: conn} do
      conn = post(conn, Routes.route_path(conn, :create), route: @create_attrs, local: @client)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.route_path(conn, :show, id), local: @client)

      assert %{
               "id" => id,
               "info" => "some info",
               "active" => true,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.route_path(conn, :create), route: @invalid_attrs, local: @client)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update route" do
    setup [:create_route]

    test "renders route when data is valid", %{conn: conn, route: %Route{id: id} = route} do
      conn = put(conn, Routes.route_path(conn, :update, route), route: @update_attrs, local: @client)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.route_path(conn, :show, id), local: @client)

      assert %{
               "id" => id,
               "info" => "some updated info",
               "active" => true,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, route: route} do
      conn = put(conn, Routes.route_path(conn, :update, route), route: @invalid_attrs, local: @client)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete route" do
    setup [:create_route]

    test "deletes chosen route", %{conn: conn, route: route} do
      conn = delete(conn, Routes.route_path(conn, :delete, route), local: @client)
      assert response(conn, 204)

      conn = get(conn, Routes.route_path(conn, :show, route), local: @client)
      assert %{
        "id" => id,
        "info" => "some info",
        "active" => false,
        "name" => "some name"
      } = json_response(conn, 200)["data"]
    end
  end

  defp create_route(_) do
    route = fixture(:route)
    {:ok, route: route}
  end
end
