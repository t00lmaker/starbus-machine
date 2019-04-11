defmodule Admin.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
    Schema de clients, que representa uma cidade 
    o regiao, cada cliente é um tennaty  nsa aplicações com
    o mesmo nome
  """

  schema "clients" do
    field :active, :boolean, default: false
    field :description, :string
    field :name, :string
    field :url_logo, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :description, :active, :url_logo])
    |> validate_required([:name, :description, :active, :url_logo])
  end
end
