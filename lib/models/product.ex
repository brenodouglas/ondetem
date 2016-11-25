defmodule OndeTem.Models.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product" do
    field :name, :string
    field :price, :float
    field :comment, :string

    belongs_to :locale, OndeTem.Models.Locale
    timestamps
  end

  @required_fields ~w(name price comment)
  @optional_fields ~w()

  def changeset(product, params \\ :empty) do
    product
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:path)
  end
end
