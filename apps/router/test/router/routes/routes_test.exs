defmodule Router.RoutesTest do
  use Router.DataCase

  alias Router.Routes

  describe "routes" do
    alias Router.Routes.Route

    @valid_attrs %{is_active: true, name: "some name"}
    @update_attrs %{is_active: false, name: "some updated name"}
    @invalid_attrs %{is_active: nil, name: nil}

    def route_fixture(attrs \\ %{}) do
      {:ok, route} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Routes.create_route()

      route
    end

    test "list_routes/0 returns all routes" do
      route = route_fixture()
      assert Routes.list_routes() == [route]
    end

    test "get_route!/1 returns the route with given id" do
      route = route_fixture()
      assert Routes.get_route!(route.id) == route
    end

    test "create_route/1 with valid data creates a route" do
      assert {:ok, %Route{} = route} = Routes.create_route(@valid_attrs)
      assert route.is_active == true
      assert route.name == "some name"
    end

    test "create_route/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Routes.create_route(@invalid_attrs)
    end

    test "update_route/2 with valid data updates the route" do
      route = route_fixture()
      assert {:ok, %Route{} = route} = Routes.update_route(route, @update_attrs)
      assert route.is_active == false
      assert route.name == "some updated name"
    end

    test "update_route/2 with invalid data returns error changeset" do
      route = route_fixture()
      assert {:error, %Ecto.Changeset{}} = Routes.update_route(route, @invalid_attrs)
      assert route == Routes.get_route!(route.id)
    end

    test "delete_route/1 deletes the route" do
      route = route_fixture()
      assert {:ok, %Route{}} = Routes.delete_route(route)
      assert_raise Ecto.NoResultsError, fn -> Routes.get_route!(route.id) end
    end

    test "change_route/1 returns a route changeset" do
      route = route_fixture()
      assert %Ecto.Changeset{} = Routes.change_route(route)
    end
  end
end
