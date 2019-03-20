defmodule Router.Client do
  @moduledoc """
    Gerencia os clientes da aplicação é gerenciado 
      os tenants de armazenamento de dados.
  """

  def create!(name) do
    Triplex.create(name)
  end

end
