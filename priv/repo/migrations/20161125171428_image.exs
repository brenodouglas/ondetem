defmodule OndeTem.Repo.Migrations.Image do
  use Ecto.Migration

  def up do
    create table :image do
      add :path, :string
      add :original_name, :string, null: true
      add :title, :string, null: true
      add :description, :text, null: true
      add :product_id, references(:product)
    end
  end

  def down do
    drop table :image
  end
end
