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

%{
  address: "Home Design",
  description: "Home Design",
  details: "Home Design #{1}",
  owner_name: "owner",
  latitude: -27.5837356,
  longitude: -48.505113,
  status: get_status.()
}
|> FoodTruck.changeset()
|> Repo.insert()

%{
  address: "Dom floripa",
  description: "Dom floripa",
  details: "Dom floripa",
  owner_name: "owner",
  latitude: -27.590994,
  longitude: -48.5141058,
  status: get_status.()
}
|> FoodTruck.changeset()
|> Repo.insert()

%{
  address: "Keko",
  description: "Keko",
  details: "Keko",
  owner_name: "owner",
  latitude: -27.5957852,
  longitude: -48.552787,
  status: get_status.()
}
|> FoodTruck.changeset()
|> Repo.insert()
