require IEx;
defmodule OndeTem.Router.Auth do
  use Maru.Router

  alias OndeTem.Models.User
  # alias OndeTem.Repo

  desc "Authentication of user"
  params do
    requires :email, type: String
  end
  post "/auth" do
    # user = Repo.get_by(User, email: String.downcase params[:email])
    new_conn = Guardian.Plug.api_sign_in(conn, %User{id: 1, email: params[:email]})
    jwt = Guardian.Plug.current_token(new_conn)

    case Guardian.Plug.claims(new_conn) do
      {:ok, claims} ->
          new_conn |> json(%{token: jwt, expiration: Map.get(claims, "exp")})
      {:error, _} =
          new_conn |> put_status(500) |> json(%{error: true})
    end
  end
end
