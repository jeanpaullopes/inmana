defmodule Inmana.Supriment.RestaurantServices do
  alias Inmana.Restaurant
  alias Inmana.Restaurant.DAO

  def get_index() do
    DAO.get_all()
  end

  def get_restaurant(id) do
    DAO.get_restaurant_by_id(id)
  end

  def create_restaurant(params) do
    {:ok, restaurant} = DAO.insert_restaurant(params)
    restaurant
  end

  def update_restaurant(id, params) do
    {:ok, restaurant} = DAO.update_restaurant(id, params)
    restaurant
  end
end
