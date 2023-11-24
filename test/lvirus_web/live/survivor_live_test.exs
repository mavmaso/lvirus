defmodule LvirusWeb.SurvivorLiveTest do
  use LvirusWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "create" do
    test "returns ok when the form is valid", %{conn: conn} do
      params = %{
        name: "John",
        age: 20,
        gender: "M"
        # latitude: 1,
        # longitude: 2,
      }

      {:ok, view, _html} = live(conn, ~p"/survivors")

      assert render(view) =~ "New Survivor"
      assert view |> form("#survivor-form", params) |> render_submit()
      assert render(view) =~ "#{params.name}"
      assert render(view) =~ "#{params.age}"
      assert render(view) =~ "#{params.gender}"
    end
  end
end
