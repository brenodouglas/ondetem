defmodule OndeTem.Repo.Migrations.Locale do
  use Ecto.Migration

  def up do
    create table :locale do
      add :name, :string, unique: false
      add :image, :string
      add :lat, :float
      add :long, :float
      add :type_id, references(:type)
    end
  end

  def down do
    drop table :locale
  end
end
