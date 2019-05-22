defmodule AdminWeb.AuthController do
  use AdminWeb, :controller

  alias Admin.Auth
  alias Admin.Auth.Guardian

  def login(conn, %{"username" => username, "password" => password}) do
    result = Auth.authenticate_user(username, password)
    login_reply(result, conn)
  end

  defp login_reply({:error, _error}, conn) do
    conn |> render("error_msg.json", msg: "Login incorreto.")
  end

  defp login_reply({:ok, user}, conn) do
    {:ok, jwt, _claims} = Guardian.encode_and_sign(user)
    conn |> render("jwt.json", jwt: jwt)
  end

  def logout(conn, _) do
    jwt = Guardian.Plug.current_token(conn)
    Guardian.revoke(jwt)
    send_resp(conn, :no_content, "")
  end

  def secret(conn, _) do
    conn |> render("jwt.json", jwt: "OH YES!")
  end

end
