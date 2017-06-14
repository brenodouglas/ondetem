defmodule OndeTem.Router.Product do
  use Maru.Router

  version "v1" do
    get "/product" do
      conn
      |> json(%{hello: :word})
    end
  end
end
