defmodule Inmana.Restaurant.DAO do
  alias Inmana.Restaurant
  alias Inmana.Repo

  def get_restaurant_by_id(id) do
    Repo.get!(Restaurant, id)
  end

  def create_restaurant(params) do
    params
    |> Restaurant.changeset()
  end

  def insert_restaurant(params) do
    create_restaurant(params)
    |> Repo.insert()
  end

  def get_all() do
    Repo.all(Restaurant)
  end

  def update_restaurant(id, params) do
    get_restaurant_by_id(id)
    |> Restaurant.changeset(params)
    |> Repo.update()
  end
end
