defmodule InmanaWeb.SuprimentView do
  use InmanaWeb, :view


  def render("create.json", %{supriment: supriment}) do
    supriment
  end
end
