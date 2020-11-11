defmodule ShortUrlWeb.LinkControllerTest do
  @moduledoc false
  use ShortUrlWeb.ConnCase


  describe "index" do
    test "list all links", %{conn: conn} do
      conn = get(conn, Routes.link_path(conn, :index))
      assert html_response(conn, 200)
    end
  end
end
