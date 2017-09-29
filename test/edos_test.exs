defmodule EdosTest do
  use ExUnit.Case
  doctest Edos

  test "greets the world" do
    assert Edos.hello() == :world
  end
end
