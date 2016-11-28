defmodule OndeTem.API do
  use Maru.Router
  use Application

  mount OndeTem.Router.Homepage

  rescue_from :all do
    conn
      |> put_status(500)
      |> text("Sever Error")
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
