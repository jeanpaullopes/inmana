defmodule InmanaWeb.RestaurantController do
  use InmanaWeb, :controller
  alias Inmana.Restaurant.RestaurantServices

  def index(conn, _params) do
    json(conn, RestaurantServices.get_index)
  end

  def show(conn,  params) do
    id = params["id"]
    render(conn, "create.json", restaurant: RestaurantServices.get_restaurant(id))
  end


  def create(conn, params) do
    render(conn, "create.json", restaurant: RestaurantServices.create_restaurant(params))
  end

  def update(conn, params) do
    id = params["id"]
    render(conn, "create.json", restaurant: RestaurantServices.update_restaurant(id, params))
  end
end
