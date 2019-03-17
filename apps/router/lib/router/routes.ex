defmodule Router.Routes do
  @moduledoc """
  The Routes context.
  """

  import Ecto.Query, warn: false
  alias Router.Repo

  @doc """
  Returns the list of routes.

  ## Examples

      iex> list_routes()
      [%Route{}, ...]

  """
  def list_routes do
    raise "TODO"
  end

  @doc """
  Gets a single route.

  Raises if the Route does not exist.

  ## Examples

      iex> get_route!(123)
      %Route{}

  """
  def get_route!(id), do: raise "TODO"

  @doc """
  Creates a route.

  ## Examples

      iex> create_route(%{field: value})
      {:ok, %Route{}}

      iex> create_route(%{field: bad_value})
      {:error, ...}

  """
  def create_route(attrs \\ %{}) do
    {:ok, %Route{}}
  end

  @doc """
  Updates a route.

  ## Examples

      iex> update_route(route, %{field: new_value})
      {:ok, %Route{}}

      iex> update_route(route, %{field: bad_value})
      {:error, ...}

  """
  def update_route(%Route{} = route, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Route.

  ## Examples

      iex> delete_route(route)
      {:ok, %Route{}}

      iex> delete_route(route)
      {:error, ...}

  """
  def delete_route(%Route{} = route) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking route changes.

  ## Examples

      iex> change_route(route)
      %Todo{...}

  """
  def change_route(%Route{} = route) do
    raise "TODO"
  end
end
