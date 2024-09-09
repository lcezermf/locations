# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Locations.Repo.insert!(%Locations.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Locations.Repo
alias Locations.FoodTruck

get_status = fn ->
  Enum.shuffle(["active", "inactive"]) |> Enum.shuffle() |> hd()
end

for i <- 1..50 do
  %{
    address: "Address #{i}",
    description: "description #{1}",
    details: "details #{1}",
    owner_name: "owner #{1}",
    latitude: 100.0,
    longitude: 200.00,
    status: get_status.()
  }
  |> FoodTruck.changeset()
  |> Repo.insert()
end
