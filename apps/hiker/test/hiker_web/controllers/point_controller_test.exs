defmodule HikerWeb.PointControllerTest do
  use HikerWeb.ConnCase

  alias Hiker.Router

  @client "client_test"

  @create_attrs %{
    lat: "123.12",
    long: "321.21",
    name: "some name",
    info: "some info",
    type: "point",
    active: true,
  }
  @update_attrs %{
    lat: "123.12",
    long: "321.21",
    name: "some updated name",
    info: "some updated info",
    type: "point",
    active: true
  }

  @invalid_attrs %{lat: nil, long: nil, type: nil}

  def fixture(:point) do
    {:ok, point} = Router.create_point(@create_attrs, @client)
    point
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all points", %{conn: conn} do
      conn = get(conn, Routes.point_path(conn, :index), local: @client)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create point" do
    test "renders point when data is valid", %{conn: conn} do
      conn = post(conn, Routes.point_path(conn, :create), point: @create_attrs, local: @client)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.point_path(conn, :show, id), local: @client)

      assert %{
               "id" => id,
               "info" => "some info",
               "active" => true,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.point_path(conn, :create), point: @invalid_attrs, local: @client)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update point" do
    setup [:create_point]

    test "renders point when data is valid", %{conn: conn, point: %Point{id: id} = point} do
      conn = put(conn, Routes.point_path(conn, :update, point), point: @update_attrs, local: @client)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.point_path(conn, :show, id), local: @client)

      assert %{
               "id" => id,
               "info" => "some updated info",
               "active" => true,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, point: point} do
      conn = put(conn, Routes.point_path(conn, :update, point), point: @invalid_attrs, local: @client)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete point" do
    setup [:create_point]

    test "attr active should be false", %{conn: conn, point: point} do
      conn = delete(conn, Routes.point_path(conn, :delete, point, local: @client))
      assert response(conn, 204)
      
      conn = get(conn, Routes.point_path(conn, :show, point, local: @client))

      assert %{
        "id" => id,
        "lat" => "123.12",
        "long" => "321.21",
        "name" => "some name",
        "info" => "some info",
        "type" => "point",
        "active" => false,
      } = json_response(conn, 200)["data"]
    end
  end

  defp create_point(_) do
    point = fixture(:point)
    {:ok, point: point}
  end
end
