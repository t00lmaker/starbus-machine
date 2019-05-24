defmodule Admin.Auth.Pipeline do
  defmodule Browser do
    use Guardian.Plug.Pipeline,
      otp_app: :admin,
      error_handler: Admin.Auth.ErrorHandler.Html,
      module: Admin.Auth.Guardian

    @moduledoc """
      Define plugs para serem utilizados no routes da aplicação.
    """

    plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
    plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
    plug Guardian.Plug.LoadResource, allow_blank: true
  end

  defmodule Api do
    use Guardian.Plug.Pipeline,
      otp_app: :admin,
      error_handler: Admin.Auth.ErrorHandler.Json,
      module: Admin.Auth.Guardian

    @moduledoc """
      Define plugs para serem utilizados no routes da aplicação.
    """

    plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
    plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
    plug Guardian.Plug.LoadResource, allow_blank: true
  end
end
