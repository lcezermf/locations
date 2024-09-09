defmodule LocationsWeb.MapLive.Index do
  use LocationsWeb, :live_view

  alias Locations

  def mount(_, _, socket) do
    food_truck = Locations.list_food_trucks() |> hd()

    {:ok, assign(socket, :food_truck, food_truck)}
  end
end
