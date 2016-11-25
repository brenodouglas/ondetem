defmodule OndeTem.Repo.Migrations.Product do
  use Ecto.Migration

  def up do
    create table :product do
      add :name, :string
      add :price, :float
      add :comment, :text
      add :locale_id, references(:locale)
    end
  end

  def down do
    drop table :product
  end
end
