defmodule OndeTem.Router.Auth do
  use Maru.Router

  alias OndeTem.Models.User
  alias OndeTem.Repo

  desc "Authentication of user"
  params do
    requires :email, type: String
  end
  post "/auth" do
    user = Repo.get_by(User, email: String.downcase params[:email])
    case user do
      nil ->
        conn |> json(%{error: true})
      model ->
        conn |> json(%{id: model.id, description: model.description, code: model.code, inserted_at: model.inserted_at})
    end
  end

end
