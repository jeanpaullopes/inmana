defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset
 @derive {Jason.Encoder, only: [:id, :name, :email]}
  schema "restaurants" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  #def changeset(restaurant, attrs) do
  # use \\ %__MODULE__{} to a default value if missed
    def changeset(restaurant \\ %__MODULE__{}, attrs) do
    restaurant
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
  
end
