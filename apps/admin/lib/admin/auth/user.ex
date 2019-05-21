defmodule Admin.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Comeonin.Bcrypt

  schema "users" do
    field :password, :string
    field :username, :string
    field :uuid, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> validate_length(:username, min: 3, max: 10)
    |> validate_length(:password, min: 6, max: 10)
    |> unique_constraint(:username)
    |> put_pass_hash()
    |> put_hashuser()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end
  defp put_pass_hash(changeset), do: changeset

  defp put_hashuser(changeset) do
    put_change(changeset, :uuid, SecureRandom.uuid)
  end

end
