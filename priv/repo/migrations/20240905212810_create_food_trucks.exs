defmodule Locations.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :address, :string
      add :owner_name, :string
      add :description, :string
      add :details, :string
      add :latitude, :float
      add :longitude, :float
      add :status, :string

      timestamps(type: :utc_datetime)
    end
  end
end
