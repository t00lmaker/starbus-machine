defmodule HikerWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use HikerWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(HikerWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(HikerWeb.ChangesetView)
    |> render("error.json", changeset)
  end
end
