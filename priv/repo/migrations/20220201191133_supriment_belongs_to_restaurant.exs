defmodule Inmana.Repo.Migrations.SuprimentBelongsToRestaurant do
  use Ecto.Migration

  def change do
    alter table(:supriments) do
      add :restaurant_id, references(:restaurants)
    end
  end
end
