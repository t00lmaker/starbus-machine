defmodule Admin.Auth.ErrorHandler do
  import Plug.Conn

  defmodule Json do
    @moduledoc """
      Gerencia os erros de Auth da api.
    """
    def auth_error(conn, {_type, _reason}, _opts) do
      conn
      |> put_resp_content_type("text/json")
      |> send_resp(:unauthorized, "Não autorizado.")
    end
  end

  defmodule Html do
    @moduledoc """
      Gerencia os erros de Auth do sistema.
    """
    def auth_error(conn, {type, _reason}, _opts) do
      body = to_string(type)

      conn
      |> put_resp_content_type("text/plain")
      |> send_resp(:unauthorized, body)
    end
  end
end
