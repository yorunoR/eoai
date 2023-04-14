defmodule EoaiTest do
  use ExUnit.Case
  doctest Eoai

  test "is ok" do
    assert Eoai.run() == :ok
  end
end
