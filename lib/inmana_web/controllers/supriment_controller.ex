defmodule InmanaWeb.SuprimentController do
  use InmanaWeb, :controller
  alias Inmana.Supriment
  alias Inmana.Supriment.SuprimentServices

  def index(conn, _params) do
    json(conn, SuprimentServices.get_index())
  end

  def show(conn, params) do
    id = params["id"]
    render(conn, "create.json", supriment: SuprimentServices.get_supriment(id))
  end

  def create(conn, params) do
    render(conn, "create.json", supriment: SuprimentServices.create_supriment(params))
  end

  def update(conn, params) do
    id = params["id"]
    render(conn, "create.json", supriment: SuprimentServices.update_supriment(id, params))
  end

  def showSuprimentsRestaurant(conn, params) do
    id = params["id"]
    json(conn, SuprimentServices.get_index_restaurant(id))
  end
end
