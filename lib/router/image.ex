defmodule OndeTem.Router.Image do
  use Maru.Router

  version "v1" do
    get "/" do
      conn
      |> json(%{hello: :word})
    end
  end
end
