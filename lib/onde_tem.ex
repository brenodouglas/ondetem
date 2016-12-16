require IEx;
defmodule OndeTem.API do
  use Maru.Router
  use Application

  before do
    plug Plug.Static, at: "/static", from: "static/"
    plug Plug.Logger
    plug Plug.Parsers,
      pass: ["*/*"],
      json_decoder: Poison,
      parsers: [:json, :multipart]

    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  mount OndeTem.Router.Type
  mount OndeTem.Router.Auth

  rescue_from :all do
    conn
      |> put_status(500)
      |> text("Sever Error")
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> json(%{message: "Authentication required"})
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
