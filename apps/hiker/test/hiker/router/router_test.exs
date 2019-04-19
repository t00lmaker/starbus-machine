defmodule Hiker.RouterTest do
  use Hiker.DataCase

  alias Hiker.Router

  describe "routes" do
    alias Hiker.Router.Route

    @valid_attrs %{info: "some info", is_active: true, name: "some name"}
    @update_attrs %{info: "some updated info", is_active: false, name: "some updated name"}
    @invalid_attrs %{info: nil, is_active: nil, name: nil}

    def route_fixture(attrs \\ %{}) do
      {:ok, route} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Router.create_route()

      route
    end

    test "list_routes/0 returns all routes" do
      route = route_fixture()
      assert Router.list_routes() == [route]
    end

    test "get_route!/1 returns the route with given id" do
      route = route_fixture()
      assert Router.get_route!(route.id) == route
    end

    test "create_route/1 with valid data creates a route" do
      assert {:ok, %Route{} = route} = Router.create_route(@valid_attrs)
      assert route.info == "some info"
      assert route.is_active == true
      assert route.name == "some name"
    end

    test "create_route/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Router.create_route(@invalid_attrs)
    end

    test "update_route/2 with valid data updates the route" do
      route = route_fixture()
      assert {:ok, %Route{} = route} = Router.update_route(route, @update_attrs)
      assert route.info == "some updated info"
      assert route.is_active == false
      assert route.name == "some updated name"
    end

    test "update_route/2 with invalid data returns error changeset" do
      route = route_fixture()
      assert {:error, %Ecto.Changeset{}} = Router.update_route(route, @invalid_attrs)
      assert route == Router.get_route!(route.id)
    end

    test "delete_route/1 deletes the route" do
      route = route_fixture()
      assert {:ok, %Route{}} = Router.delete_route(route)
      assert_raise Ecto.NoResultsError, fn -> Router.get_route!(route.id) end
    end

    test "change_route/1 returns a route changeset" do
      route = route_fixture()
      assert %Ecto.Changeset{} = Router.change_route(route)
    end
  end

  describe "points" do
    alias Hiker.Router.Point

    @valid_attrs %{info: "some info", is_active: true, name: "some name"}
    @update_attrs %{info: "some updated info", is_active: false, name: "some updated name"}
    @invalid_attrs %{info: nil, is_active: nil, name: nil}

    def point_fixture(attrs \\ %{}) do
      {:ok, point} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Router.create_point()

      point
    end

    test "list_points/0 returns all points" do
      point = point_fixture()
      assert Router.list_points() == [point]
    end

    test "get_point!/1 returns the point with given id" do
      point = point_fixture()
      assert Router.get_point!(point.id) == point
    end

    test "create_point/1 with valid data creates a point" do
      assert {:ok, %Point{} = point} = Router.create_point(@valid_attrs)
      assert point.info == "some info"
      assert point.is_active == true
      assert point.name == "some name"
    end

    test "create_point/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Router.create_point(@invalid_attrs)
    end

    test "update_point/2 with valid data updates the point" do
      point = point_fixture()
      assert {:ok, %Point{} = point} = Router.update_point(point, @update_attrs)
      assert point.info == "some updated info"
      assert point.is_active == false
      assert point.name == "some updated name"
    end

    test "update_point/2 with invalid data returns error changeset" do
      point = point_fixture()
      assert {:error, %Ecto.Changeset{}} = Router.update_point(point, @invalid_attrs)
      assert point == Router.get_point!(point.id)
    end

    test "delete_point/1 deletes the point" do
      point = point_fixture()
      assert {:ok, %Point{}} = Router.delete_point(point)
      assert_raise Ecto.NoResultsError, fn -> Router.get_point!(point.id) end
    end

    test "change_point/1 returns a point changeset" do
      point = point_fixture()
      assert %Ecto.Changeset{} = Router.change_point(point)
    end
  end
end
