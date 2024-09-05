defmodule Locations do
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

  defp broadcast({:ok, food_truck} = result) do
    PubSub.broadcast(@pubsub, "new_food_truck", {:new_food_truck, food_truck})

    result
  end

  defp broadcast({:error, _} = err), do: err
end
