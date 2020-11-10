defmodule ShortUrl.Links.LinksTest do
  @moduledoc false
  use ShortUrl.DataCase

  alias ShortUrl.Links

  describe "links" do
    alias ShortUrl.Links.Link

    test "list_links/0 returns all links" do
      link = insert(:link)
      assert Links.list_links() == [link]
    end

    test "get_link/1 returns the link with given id" do
      link = insert(:link)
      assert Links.get_link(link.id) == {:ok, %Link{} = link}
    end
  end
end
