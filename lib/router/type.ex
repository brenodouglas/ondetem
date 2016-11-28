defmodule OndeTem.Router.Type do
  use Maru.Router
  import Ecto.Query, only: [from: 2]

  alias OndeTem.Models.Type, as: TypeModel
  alias OndeTem.Repo

  version "v1" do
    namespace "type" do

      desc "Retrieve a type of locales"
      get "/" do
        query = from t in TypeModel, select: t.id
        conn
        |> json(Repo.all(query))
      end

      desc "Retrieve a type by id"
      params do
        requires :id, type: Integer
      end
      get ":id" do
        query = from t in TypeModel, select: t.id, where: t.id == ^params[:id]
        conn
        |> json(Repo.one(query))
      end
    end
  end

end
