defmodule LocationsWeb.MapLive.Index do
  use LocationsWeb, :live_view

  alias Locations

  def mount(_, _, socket) do
    food_trucks = Locations.list_food_trucks()

    {:ok, assign(socket, :food_trucks, food_trucks)}
  end
end
