defmodule ShortUrl.Links do
  @moduledoc """
    Links Context
  """

  import Ecto.Query, warn: false

  alias ShortUrl.Repo
  alias ShortUrl.Links.Link

  @doc """
  Returns the list of links.

  ## Examples
      iex> list_links()
      [%Link{}, ...]


  """
  def list_links do
    Repo.all(Link)
  end

  @doc """
  Gets a single link when given an Id will return an error
  tuple if the given link does not exist
  """

  @spec get_link(String.t()) :: {:ok, Link.t()} | {:error, String.t()}
  def get_link(id), do: Repo.get!(Link, id)
end
