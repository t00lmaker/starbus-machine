defmodule Hiker.Router do
  @moduledoc """
  The Router context.
  """
  import Ecto.Query, warn: false
  alias Hiker.Repo

  @doc """
  Gets a single route.

  Raises if the Route does not exist.

  ## Examples

      iex> get_route!(123)
      %Route{}

  """
  def get_route!(id, client) do
    Repo.get(Route, id, prefix: client)
  end

  @doc """
  Returns the list of routes.

  ## Examples

      iex> list_routes()
      [%Route{}, ...]

  """
  def list_routes(client) do
    Repo.all(Route, prefix: client)
  end

  @doc """
  Creates a route.

  ## Examples

      iex> create_route(%{field: value})
      {:ok, %Route{}}

      iex> create_route(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_route(attrs \\ %{}, client) do
    %Route{}
    |> Route.changeset(attrs)
    |> Repo.insert(prefix: client)
  end

  @doc """
  Updates a route.

  ## Examples

      iex> update_route(route, %{field: new_value})
      {:ok, %Route{}}

      iex> update_route(route, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_route(%Route{} = route, attrs, client) do
    route
    |> Route.changeset(attrs)
    |> Repo.update(prefix: client)
  end

  @doc """
  Deletes a Route.

  ## Examples

      iex> delete_route(route)
      {:ok, %Route{}}

      iex> delete_route(route)
      {:error, %Ecto.Changeset{}}

  """
  def delete_route(%Route{} = route, client) do
    Repo.delete(route, prefix: client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking route changes.

  ## Examples

      iex> change_route(route)
      %Ecto.Changeset{source: %Route{}}

  """
  def change_route(%Route{} = route) do
    Route.changeset(route, %{})
  end

  @doc """
  Returns the list of points.

  ## Examples

      iex> list_points()
      [%Point{}, ...]

  """
  def list_points(client) do
    Repo.all(Point, prefix: client)
  end

  @doc """
  Gets a single point.

  Raises `Ecto.NoResultsError` if the Point does not exist.

  ## Examples

      iex> get_point!(123)
      %Point{}

      iex> get_point!(456)
      ** (Ecto.NoResultsError)

  """
  def get_point!(id, client), do: Repo.get!(Point, id, prefix: client)

  @doc """
  Creates a point.

  ## Examples

      iex> create_point(%{field: value})
      {:ok, %Point{}}

      iex> create_point(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_point(attrs \\ %{}, client) do
    %Point{}
    |> Point.changeset(attrs)
    |> Repo.insert(prefix: client)
  end

  def create_point_route(attrs \\ %{}, route, client) do
    route = route |> Repo.preload([:points])
    point = %Point{} |> Point.changeset(attrs)
    points = route.points ++ [point]

    route = route
              |> Ecto.Changeset.change
              |> Ecto.Changeset.put_assoc(:points, points)
              |> Repo.update!(prefix: client)

    cList.last(route.points)
  end

  @doc """
  Updates a point.

  ## Examples

      iex> update_point(point, %{field: new_value})
      {:ok, %Point{}}

      iex> update_point(point, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_point(%Point{} = point, attrs, client) do
    point
    |> Point.changeset(attrs)
    |> Repo.update(prefix: client)
  end

  @doc """
  Deletes a Point.

  ## Examples

      iex> delete_point(point)
      {:ok, %Point{}}

      iex> delete_point(point)
      {:error, %Ecto.Changeset{}}

  """
  def delete_point(%Point{} = point, client) do
    Repo.delete(point, prefix: client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking point changes.

  ## Examples

      iex> change_point(point)
      %Ecto.Changeset{source: %Point{}}

  """
  def change_point(%Point{} = point) do
    Point.changeset(point, %{})
  end
end
