defmodule User do
  @moduledoc """
    Define um usuario do starbus.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name,  :string
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end


end
