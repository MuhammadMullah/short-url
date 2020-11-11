defmodule ShortUrl.DeleteLinks do
  @moduledoc false
  alias ShortUrl.Links
  require Logger

  def delete_links do
    Logger.info("Deleting links")
    {count, _} = Links.delete_links_older_than_one_month()
    Logger.info("Removed #{count} old links")
  end
end
