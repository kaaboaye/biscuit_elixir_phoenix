defmodule Biscuit.Teas.Tea do
  use Ecto.Schema
  import Ecto.Changeset

  alias Biscuit.Brewings.Brewing

  @field_source_mapper fn
    :inserted_at -> :created_at
    x -> x
  end

  schema "tea" do
    field :name, :string
    has_many :brewings, Brewing

    timestamps()
  end

  @doc false
  def changeset(tea, attrs) do
    tea
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
