defmodule AdminWeb.AuthView do
  use AdminWeb, :view

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end

  def render("error_msg.json", %{msg: msg}) do
    %{error: msg}
  end
end
