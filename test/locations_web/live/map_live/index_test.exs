defmodule LocationsWeb.MapLive.IndexTest do
  use LocationsWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Locations
  alias Locations.FoodTruck
  alias Locations.Repo

  test "must load all food trucks", %{conn: conn} do
    create_food_truck()
    create_food_truck()
    create_food_truck()

    {:ok, view, _html} = live(conn, ~p"/maps")

    view
    |> element("#map")
    |> render_hook("load-food-trucks", [])

    assert has_element?(view, "#map")
  end

  defp create_food_truck do
    i = System.unique_integer([:positive])

    %{
      address: "Address #{i}",
      description: "description #{1}",
      details: "details #{1}",
      owner_name: "owner #{1}",
      latitude: 100.0,
      longitude: 200.00,
      status: Enum.shuffle(["active", "inactive"]) |> Enum.shuffle() |> hd()
    }
    |> FoodTruck.changeset()
    |> Repo.insert()
  end
end
