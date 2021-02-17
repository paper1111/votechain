defmodule Block do
  defstruct [:data, :timestamp, :prev_hash, :hash]

  def new(data, prev_hash) do
    %Block{
      data: data,
      prev_hash: prev_hash,
      timestamp: NaiveDateTime.utc_now,
    }
  end

  def genesis do
    %Block{
      data: "GENISIS_BLOCK",
      prev_hash: "GENISIS_HASH",
      timestamp: NaiveDateTime.utc_now,
    }
  end


end
