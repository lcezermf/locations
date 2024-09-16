defmodule LocationsWeb.MapLive.Index do
  use LocationsWeb, :live_view

  alias Locations

  def mount(_, _, socket) do
    {:ok, assign(socket, :food_trucks, Locations.list_food_trucks())}
  end

  def handle_event("load-food-trucks", _, socket) do
    # :reply "notify" the actor who triggers the event

    {:reply, %{food_trucks: Locations.list_food_trucks()}, socket}
  end
end
