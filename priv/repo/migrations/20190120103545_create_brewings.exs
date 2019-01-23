defmodule Biscuit.Repo.Migrations.CreateBrewings do
  use Ecto.Migration

  def change do
    create table(:brewings) do
      add :amount, :integer
      add :timespan, :integer
      add :water_temp, :integer
      add :taste, :text
      add :tea_id, references(:tea, on_delete: :nothing)

      timestamps()
    end

    create index(:brewings, [:tea_id])
  end
end
