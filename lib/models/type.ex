defmodule OndeTem.Models.Type do
  use Ecto.Schema
  import Ecto.Changeset

  schema "type" do
    field :description, :string
    field :code, :string

    timestamps
  end

  @required_fields ~w(description code)
  @optional_fields ~w()

  def changeset(type, params \\ :empty) do
    type
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:code)
  end
end
