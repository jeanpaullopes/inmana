defmodule Inmana.Restaurants do
  alias Inmana.Restaurant
  alias Inmana.Repo

  def create_restaurant(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
  end
end
