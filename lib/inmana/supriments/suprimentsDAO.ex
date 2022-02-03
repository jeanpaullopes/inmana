defmodule Inmana.Supriment.DAO do
  alias Inmana.Supriment
  alias Inmana.Repo
  import Ecto.Query, only: [from: 2]

  def get_supriment_by_id(id) do
    Repo.get!(Supriment, id)
    |> preload()
  end

  def get_supriment_by_restaurant(restaurant_id) do
    query = from s in Supriment, where: s.restaurant_id == ^restaurant_id, select: s

    Repo.all(query)
    |> preload()
  end

  def create_supriment(params) do
    params
    |> Supriment.changeset()
  end

  def insert_supriment(params) do
    restaurant = Inmana.Repo.get!(Inmana.Restaurant, params["restaurant"]["id"])

    create_supriment(params)
    |> Ecto.Changeset.put_assoc(:restaurant, restaurant)
    |> Repo.insert()
  end

  def get_all() do
    Repo.all(Supriment)
    |> preload()
  end

  def preload(payload) do
    Repo.preload(payload, :restaurant)
  end

  def update_supriment(id, params) do
    get_supriment_by_id(id)
    |> Supriment.changeset(params)
    |> Repo.update()
    |> preload()
  end
end
