defmodule HomepageTest do
  use Maru.Test, for: OndeTem.Router.Homepage

  use ExUnit.Case

  test "/ v1" do
    assert %{"hello" => "word"} == get("/", "v1") |> json_response
  end
end
