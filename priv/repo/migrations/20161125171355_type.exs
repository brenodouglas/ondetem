defmodule OndeTem.Repo.Migrations.Type do
  use Ecto.Migration

  def up do
    create table(:type) do
      add :description, :string
      add :code, :string, unique: true
    end
  end

  def down do
    drop table :type
  end
end
