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
end
