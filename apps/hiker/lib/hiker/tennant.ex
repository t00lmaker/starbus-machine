defmodule Hiker.Tennant do
  @moduledoc """
    Gerenia o tennant nessa instancia.
  """

  @doc """
  cria um novo tennant com o triplex.
  Roda as migrations em tennant_migration
  """
  def create(name) do
    Triplex.create(name)
  end
end
