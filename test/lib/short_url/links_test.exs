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

    test "get_by_original_url/1 returns a link with its original_url" do
      link = insert(:link)
      assert Links.get_by_original_url(link.original_url) == link
    end

    test "create_link/1 with valid data creates a link" do
      link = insert(:link)
      assert link.original_url == link.original_url
      assert String.length(link.identifier) == 8
    end
  end
end
