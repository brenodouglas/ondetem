require IEx;
defmodule OndeTem.API do
  use Maru.Router
  use Application

  @skip_token_verification %{joken_skip: true}

  before do
    plug Plug.Static, at: "/static", from: "static/"
    plug Plug.Logger
    plug Plug.Parsers,
      pass: ["*/*"],
      json_decoder: Poison,
      parsers: [:json, :multipart]
  end

  mount OndeTem.Router.Type
  mount OndeTem.Router.Auth

  rescue_from :all do
    conn
      |> put_status(500)
      |> text("Sever Error")
  end

  def verify_function do
    %Joken.Token{}
    |> Joken.with_sub(1234567890)
    |> Joken.with_signer(Joken.hs256("da39a3ee5e6b4b0d3255bfef95601890afd80709"))
  end

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(OndeTem.Repo,[])
    ]

    opts = [strategy: :one_for_one, name: OndeTem.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
