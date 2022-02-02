defmodule InmanaWeb.RestaurantController do
  use InmanaWeb, :controller
  alias Inmana.Restaurant

  def index(conn, _params) do
    all = Inmana.Restaurant |> Inmana.Repo.all()
    json(conn,all)
  end
  def show(conn,  params) do
    restaurant = Inmana.Restaurant |> Inmana.Repo.get!(params["id"])
    render(conn, "create.json", restaurant: restaurant)
  end
  def create(conn, params) do

    #changed Restaurant.changeset
    #ret = %Inmana.Restaurant{} |> Inmana.Restaurant.changeset(params) |> Inmana.Repo.insert()
    ret = Inmana.Restaurant.changeset(params) |> Inmana.Repo.insert()

    case ret do

      {:ok, rest} -> {
        #a = %{"id" => rest.id, "name" => rest.name, "email" => rest.email}
        #json(conn, rest)
        render(conn, "create.json", restaurant: rest)
    }
      {:error, rest} ->{ rest}
        # do something with changeset
    end

  end

  def update(conn, params) do
    ret =  Inmana.Restaurant |> Inmana.Repo.get(params["id"]) |> Inmana.Restaurant.changeset(params) |> Inmana.Repo.update()

    case ret do

      {:ok, rest} -> {
        #a = %{"id" => rest.id, "name" => rest.name, "email" => rest.email}
        #json(conn, rest)
        render(conn, "create.json", restaurant: rest)
    }
    #  {:error, rest} ->{ rest}
    #    # do something with changeset
    end
  end
end
