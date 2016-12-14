require IEx;
 defmodule OndeTem.Router.Auth do
  use Maru.Router

  alias OndeTem.Models.User
  alias OndeTem.Repo

  desc "Authentication of user"
  params do
    requires :email, type: String
  end
  post "/auth" do
    # user = Repo.get_by(User, email: String.downcase params[:email])
    token = %{user_id: 1}
            |> Joken.token
            |> Joken.with_sub(1234567890)
            |> Joken.with_signer(Joken.hs256("da39a3ee5e6b4b0d3255bfef95601890afd80709"))
            |> Joken.sign
            |> Joken.get_compact

    conn |> json(%{token: token})
    # case user do
    #   nil ->
    #     conn |> json(%{error: true})
    #   model ->
    #     token = %{user_id: 1}
    #             |> Joken.token
    #             |> Joken.with_signer("mysecrete_key")
    #             |> Joken.with_sub(1234567890)
    #             |> Joken.sign
    #             |> Joken.get_compact
    #
    #     conn |> json(%{token: token})
    # end
  end
end
