defmodule Biscuit.Brewings.Brewing do
  use Ecto.Schema
  import Ecto.Changeset

  alias Biscuit.Teas.Tea

  @field_source_mapper fn
    :inserted_at -> :created_at
    x -> x
  end

  schema "brewings" do
    belongs_to :tea, Tea
    field :amount, :integer
    field :taste, :string
    field :timespan, :integer
    field :water_temp, :integer

    timestamps()
  end

  @doc false
  def changeset(brewing, attrs) do
    brewing
    |> cast(attrs, [:tea_id, :amount, :timespan, :water_temp, :taste])
    |> validate_required([:tea_id, :amount, :timespan, :water_temp, :taste])
  end
end
