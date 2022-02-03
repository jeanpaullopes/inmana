defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(422)
    |> put_view(InmanaWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end
end
