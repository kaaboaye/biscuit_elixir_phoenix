defmodule Jiffy do
  def encode!(obj), do: obj |> prepare() |> :jiffy.encode([:use_nil])
  def encode_to_iodata!(obj), do: encode!(obj)
  def decode!(obj), do: :jiffy.decode(obj, [:return_maps, :use_nil])

  def prepare(obj) when is_list(obj), do: Enum.map(obj, &prepare/1)
  def prepare(%{__struct__: _} = obj), do: String.Chars.to_string(obj)
  def prepare(obj) when is_map(obj), do: Map.new(obj, fn {k, v} -> {k, prepare(v)} end)
  def prepare(obj), do: obj
end
