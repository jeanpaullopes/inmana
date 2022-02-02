defmodule InmanaWeb.RestaurantController do
  use InmanaWeb, :controller
  alias Inmana.Restaurant

  def index(conn, _params) do
    all = Inmana.Restaurant |> Inmana.Repo.all()
    json(conn,all)
  end
  def show(conn, _params) do
    render(conn, "index.html")
  end
  def create(conn, _params) do

    restaurant = %Inmana.Restaurant{}
    changeset = Inmana.Restaurant.changeset(restaurant, _params)

    case Inmana.Repo.insert(changeset) do
      {:ok, rest} -> render(conn, rest)

      {:error, rest} ->
        # do something with changeset
    end



  end

end
