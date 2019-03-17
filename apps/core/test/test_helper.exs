
ExUnit.start()

Mix.start()
Mix.shell(Mix.Shell.Process)
Application.put_env(:mix, :colors, enabled: false)

defmodule Core.Helpers do
  @moduledoc """
    Helpers para testes.
  """

  def errors_on(changeset) do
    changeset.errors
  end
end
