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
  def get_link(id) do
    case Repo.get!(Link, id) do
      nil -> {:error, :not_found}
      link -> {:ok, link}
    end
  end


  @doc """
  Gets a single link by their original url
  ## Examples
      iex> get_by_original_url(google.com)
      %Link{}
  """
  def get_by_original_url(original_url), do: Repo.get_by!(Link, original_url: original_url)
end
