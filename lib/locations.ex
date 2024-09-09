defmodule Locations do
  import Ecto.Query

  alias Phoenix.PubSub
  alias Locations.FoodTruck
  alias Locations.Repo

  @pubsub Locations.PubSub

  def create_food_truck(params) do
    params
    |> FoodTruck.changeset()
    |> Repo.insert()
    |> broadcast()
  end

  def list_food_trucks do
    FoodTruck
    |> order_by([ft], asc: ft.id)
    |> Repo.all()
  end

  defp broadcast({:ok, food_truck} = result) do
    PubSub.broadcast(@pubsub, "new_food_truck", {:new_food_truck, food_truck})

    result
  end

  defp broadcast({:error, _} = err), do: err
end
