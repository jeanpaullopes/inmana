defmodule InmanaWeb.RestaurantView do
  use InmanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    restaurant
  end
end
