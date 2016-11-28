defmodule OndeTem.Router.Locale do
  use Maru.Router

  version "v1" do
    get "/" do
      conn
      |> json(%{hello: :word})
    end
  end
end
