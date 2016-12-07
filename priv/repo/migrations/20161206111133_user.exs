defmodule OndeTem.Repo.Migrations.User do
  use Ecto.Migration

  def up do
    create table :user do
      add :username, :string
      add :email, :string
      add :password, :string

      timestamps
    end
  end

  def down do
    drop table :user
  end
end
