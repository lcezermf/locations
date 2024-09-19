defmodule LocationsWeb.MapLive.Index do
  use LocationsWeb, :live_view

  alias Locations

  def mount(_, _, socket) do
    socket =
      socket
      |> assign(:food_trucks, Locations.list_food_trucks())
      |> assign(:selected_food_truck, nil)

    {:ok, socket}
  end

  def handle_event("load-food-trucks", _, socket) do
    # :reply "notify" the actor who triggers the event

    {:reply, %{food_trucks: Locations.list_food_trucks()}, socket}
  end

  def handle_event("select_food_truck", %{"id" => id}, socket) do
    food_truck = Enum.find(socket.assigns.food_trucks, &(&1.id == String.to_integer(id)))

    socket =
      socket
      |> assign(:selected_food_truck, food_truck)
      |> push_event("highlight_marker", food_truck)

    {:noreply, socket}
  end
end
