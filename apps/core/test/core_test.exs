defmodule CoreTest do
  @moduledoc """
    Test para core app.
  """

  use ExUnit.Case
  doctest Core

  test "greets the world" do
    assert Core.hello() == :world
  end
end
