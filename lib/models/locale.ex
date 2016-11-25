defmodule OndeTem.Models.Locale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locale" do
    field :name, :string
    field :image, :string
    field :lat, :float
    field :long, :float

    belongs_to :type, OndeTem.Models.Type
    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def changeset(type, params \\ :empty) do
    type
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:code)
  end
end
