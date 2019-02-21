defmodule Core.Helpers do
  @moduledoc """
    Helpers para testes.
  """

  def errors_on( changeset ) do
    changeset.errors
  end
end
