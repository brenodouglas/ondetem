defmodule OndeTem.Models.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "image" do
    field :path, :string
    field :original_name, :string
    field :title, :string
    field :description, :string

    belongs_to :product, OndeTem.Models.Product
    timestamps
  end

  @required_fields ~w(path)
  @optional_fields ~w(original_name title description)

  def changeset(image, params \\ :empty) do
    image
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:path)
  end
end
