defmodule VotechainTest do
  use ExUnit.Case
  doctest Votechain

  test "greets the world" do
    assert Votechain.hello() == :world
  end
end
