defmodule Blockchain do

  def new do
    [ Crypto.put_hash(Block.genesis) ]
  end


  def insert(blockchain, data) when is_list(blockchain) do
    %Block{hash: prev} = hd(blockchain)

    block =
      data
      |> Block.new(prev)
      |> Crypto.put_hash

    [ block | blockchain ]
  end

  def valid?(blockchain) when is_list(blockchain) do
    zero = Enum.reduce_while(blockchain, nil, fn prev, current ->
      cond do
        current == nil ->
          {:cont, prev}

        Block.valid?(current, prev) ->
          {:cont, prev}

        true ->
          {:halt, false}
      end
    end)

    if zero, do: Block.valid?(zero), else: false
  end
end
