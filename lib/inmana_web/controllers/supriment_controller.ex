defmodule InmanaWeb.SuprimentController do
  use InmanaWeb, :controller
  alias Inmana.Supriment

  def index(conn, _params) do
    all = Inmana.Supriment |> Inmana.Repo.all() |> Inmana.Repo.preload(:restaurant)

    json(conn, all)
  end

  def show(conn, params) do
    supriment =
      Inmana.Supriment |> Inmana.Repo.get!(params["id"]) |> Inmana.Repo.preload(:restaurant)

    render(conn, "create.json", supriment: supriment)
  end

  def create(conn, params) do
    restaurant = Inmana.Repo.get!(Inmana.Restaurant, params["restaurant"]["id"])

    ret =
      Inmana.Supriment.changeset(params)
      |> Ecto.Changeset.put_assoc(:restaurant, restaurant)
      |> Inmana.Repo.insert()

    case ret do
      {:ok, supr} ->
        {
          # a = %{"id" => rest.id, "name" => rest.name, "email" => rest.email}
          # json(conn, rest)

          render(conn, "create.json", supriment: supr)
        }

      {:error, supr} ->
        {supr}
        # do something with changeset
    end
  end

  def update(conn, params) do
    ret =
      Inmana.Supriment
      |> Inmana.Repo.get(params["id"])
      |> Inmana.Supriment.changeset(params)
      |> Inmana.Repo.update()

    case ret do
      {:ok, supr} ->
        {
          # a = %{"id" => rest.id, "name" => rest.name, "email" => rest.email}
          # json(conn, rest)
          render(conn, "create.json", supriment: supr)
        }

        #  {:error, rest} ->{ rest}
        #    # do something with changeset
    end
  end
end
