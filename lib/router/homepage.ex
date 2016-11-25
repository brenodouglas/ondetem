defmodule OndeTem.Router.Homepage do
  use Maru.Router

  version "v1" do
    get "/home" do
      conn
      |> json(%{hello: :word})
    end
  end
end
