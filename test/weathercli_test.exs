defmodule WeathercliTest do
  use ExUnit.Case
  doctest Weathercli

  test "greets the world" do
    assert Weathercli.hello() == :world
  end
end
