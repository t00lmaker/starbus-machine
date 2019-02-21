defmodule PointTest do
  @moduledoc """
    Test para core app.
  """
  #use DataCase
  use ExUnit.Case
  import Core.Helpers

  doctest Point

  test "should be create for two position (lat, log)." do
    point = Point.changeset(%Point{}, %{lat: 1, long: 2})
    assert point.valid?
  end

  test "should fail if lat is nil" do
    point = Point.changeset(%Point{}, %{lat: nil, long: 2})
    refute point.valid?
    assert [lat: {"can't be blank", [validation: :required]}] = errors_on(point)
  end

  test "should fail if long is nil" do
    point = Point.changeset(%Point{}, %{lat: 1, long: nil})
    refute point.valid?
    assert [long: {"can't be blank", [validation: :required]}] = errors_on(point)
  end

end
