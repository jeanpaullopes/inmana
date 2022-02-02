defmodule Inmana.Repo.Migrations.CreateSupriments do
  use Ecto.Migration

  def change do
    create table(:supriments) do
      add :description, :string
      add :expiration_date, :date
      add :responsible, :string

      timestamps()
    end
  end
end
