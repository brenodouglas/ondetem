defmodule HomepageTest do
  use Maru.Test, for: API

  use ExUnit.Case

  test "/ v1" do
    assert %{"hello" => "world"} = get("/", "v2") |> json_response
  end
end
