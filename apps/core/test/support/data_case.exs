defmodule DataCase do
  @moduledoc """
    Import and Alias all the necessary modules 
    para all of our schemas cases, moreover
    define help methods for tests.
  """
  def errors_on( changeset ) do
    changeset.errors
  end
end
