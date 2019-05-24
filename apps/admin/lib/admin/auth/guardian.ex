defmodule Admin.Auth.Guardian do
  use Guardian, otp_app: :admin

  @moduledoc """
    Esse modulo guarda os callbacks param 
    manipulação de cada atributo do token do Guardian.
    Um callback colocar o usuario no token. 
    O outro recuperar o usuario do token.
  """

  alias Admin.Auth.User
  alias Admin.Repo

  def subject_for_token(user, _claims) do
    sub = to_string(user.uuid)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    uuid = claims["sub"]
    resource = Repo.get_by(User, uuid: uuid)
    {:ok, resource}
  end
end
