defmodule HikerWeb.PointControllerTest do
  use HikerWeb.ConnCase

  alias Hiker.Router
  alias Hiker.Router.Point

  @create_attrs %{
    info: "some info",
    is_active: true,
    name: "some name"
  }
  @update_attrs %{
    info: "some updated info",
    is_active: false,
    name: "some updated name"
  }
  @invalid_attrs %{info: nil, is_active: nil, name: nil}

  def fixture(:point) do
    {:ok, point} = Router.create_point(@create_attrs)
    point
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all points", %{conn: conn} do
      conn = get(conn, Routes.point_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create point" do
    test "renders point when data is valid", %{conn: conn} do
      conn = post(conn, Routes.point_path(conn, :create), point: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.point_path(conn, :show, id))

      assert %{
               "id" => id,
               "info" => "some info",
               "is_active" => true,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.point_path(conn, :create), point: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update point" do
    setup [:create_point]

    test "renders point when data is valid", %{conn: conn, point: %Point{id: id} = point} do
      conn = put(conn, Routes.point_path(conn, :update, point), point: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.point_path(conn, :show, id))

      assert %{
               "id" => id,
               "info" => "some updated info",
               "is_active" => false,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, point: point} do
      conn = put(conn, Routes.point_path(conn, :update, point), point: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete point" do
    setup [:create_point]

    test "deletes chosen point", %{conn: conn, point: point} do
      conn = delete(conn, Routes.point_path(conn, :delete, point))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.point_path(conn, :show, point))
      end
    end
  end

  defp create_point(_) do
    point = fixture(:point)
    {:ok, point: point}
  end
end
