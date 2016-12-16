defmodule OndeTem.Router.Type do
  use Maru.Router
  import Ecto.Query, only: [from: 2]

  alias OndeTem.Models.Type, as: TypeModel
  alias OndeTem.Repo

  version "v1" do

    pipeline do
      plug Guardian.Plug.VerifyHeader, realm: "Bearer"
      plug Guardian.Plug.LoadResource
    end
    namespace "type" do
      desc "Retrieve a type of locales"
      get "/" do
        query = from t in TypeModel, select: %{id: t.id,
                                              description: t.description,
                                              code: t.code,
                                              updated_at: t.updated_at,
                                              created_at: t.inserted_at
                                             }
        conn
        |> json(Repo.all(query))
      end

      desc "Retrieve a type by id"
      params do
        requires :id, type: Integer
      end
      get ":id" do
        query = from t in TypeModel, select: %{id: t.id,
                                              description: t.description,
                                              code: t.code,
                                              updated_at: t.updated_at,
                                              created_at: t.inserted_at
                                             }, where: t.id == ^params[:id]
        conn
        |> json(Repo.one(query))
      end

      desc "Create a type of locale"
      params do
        requires :description, type: String
        requires :code, type: String
      end
      post "/" do
        changeset = TypeModel.changeset(%TypeModel{}, params)
        case Repo.insert(changeset) do
          {:ok, model} ->
            conn |> json(%{id: model.id, description: model.description, code: model.code, inserted_at: model.inserted_at})
          {:error} ->
            conn |> json(%{error: true})
        end
      end

      desc "Delete a type of locale"
      params do
        requires :id, type: Integer
      end
      delete ":id" do
        type = Repo.get!(TypeModel, params[:id])
        case Repo.delete type do
          {:ok, model} ->
            conn |> json(%{id: model.id, description: model.description, code: model.code, inserted_at: model.inserted_at})
          {:error} ->
              conn |> json(%{error: true})
        end
      end

      desc "Update a type of locale"
      params do
        requires :id, type: Integer
      end
      put ":id" do
        type = Repo.get!(TypeModel, params[:id])
        type = Ecto.Changeset.change type, params

        case Repo.update type do
          {:ok, model} ->
            conn |> json(%{id: model.id, description: model.description, code: model.code, inserted_at: model.inserted_at})
          {:error} ->
              conn |> json(%{error: true})
        end
      end
    end
  end

end
