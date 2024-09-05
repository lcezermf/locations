defmodule Locations.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :address, :string
    field :description, :string
    field :details, :string
    field :latitude, :float
    field :longitude, :float
    field :owner_name, :string
    field :status, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:address, :owner_name, :description, :details, :latitude, :longitude, :status])
    |> validate_required([
      :address,
      :owner_name,
      :description,
      :details,
      :latitude,
      :longitude,
      :status
    ])
  end
end
