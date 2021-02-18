defmodule Crypto do

  @hash_fields [:data, :timestamp, :prev_hash]

  def hash(%{} = block) do
    block
    |> Map.take(@hash_fields)
    |> Poison.encode!
    |> sha256
  end

  def put_hash(%{} = block) do
    %{ block | hash: hash(block) }
  end

  defp sha256(binary) do
    :crypto.hash(:sha256, binary) |> Base.encode16
  end

end
