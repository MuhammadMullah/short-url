defmodule ShortUrl.Links.LinksTest do
  @moduledoc false
  use ShortUrl.DataCase

  alias ShortUrl.Links

  describe "links" do
    alias ShortUrl.Links.Link

    @valid_attrs %{original_url: "facebook.com", generated_url: "VxH1eBkI"}

    test "list_links/0 returns all links" do
      link = insert(:link)
      assert Links.list_links() == [link]
    end

    test "get_link/1 returns the link with given id" do
      link = insert(:link)
      assert Links.get_link(link.id) == {:ok, %Link{} = link}
    end

    test "create_link/1 with valid data creates a link" do
      assert {:ok, %Link{} = link} = Links.create_link(@valid_attrs)
      assert link.original_url == "facebook.com"
      assert String.length(link.generated_url) == 8
    end
  end
end
