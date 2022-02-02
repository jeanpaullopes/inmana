defmodule Inmana.Supriment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :description, :expiration_date, :responsible, :restaurant]}
  schema "supriments" do
    field :description, :string
    field :expiration_date, :date
    field :responsible, :string
    belongs_to :restaurant, Inmana.Restaurant

    timestamps()
  end

  @doc false
  def changeset(supriment \\ %__MODULE__{}, attrs) do
    supriment
    |> cast(attrs, [:description, :expiration_date, :responsible])
    |> validate_required([:description, :expiration_date, :responsible])
  end
end
