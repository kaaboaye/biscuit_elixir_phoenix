defmodule Biscuit.Repo.Migrations.CreateTea do
  use Ecto.Migration

  def change do
    create table(:tea) do
      add :name, :string

      timestamps()
    end

  end
end
