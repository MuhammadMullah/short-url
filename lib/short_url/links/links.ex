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

  @spec get_link({:id, binary}) :: {:error, :not_found} | {:ok, Link.t()}
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
  def get_by_original_url(original_url), do: Repo.get_by(Link, original_url: original_url)


  @doc """
  Creates a link.

  ## Examples
      iex> create_link(%{field: value})
      {:ok, %Link{}}
      iex> create_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """

  @spec create_link(map) :: {:error, atom | Ecto.Changeset.t()} | {:ok, Link.t()}
  def create_link(%{"original_url" => original_url} = attrs \\ %{}) do
    case get_by_original_url(original_url) do
      nil ->
        %Link{}
        |> Link.changeset(attrs)
        |> Repo.insert()
      %Link{} = link ->
        {:ok, link}
    end
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking link changes.
  ## Examples
      iex> change_link(link)
      %Ecto.Changeset{source: %Link{}}
  """
  def change_link(%Link{} = link) do
    Link.changeset(link, %{})
  end


  @doc """
  Gets a single link by their identifier

  ## Examples
      iex> get_by_url_identifier("SvS_I3sD")
      %Link{}
  """
  def get_by_url_identifier(identifier), do: Repo.get_by(Link, identifier: identifier)



  @doc """
    Delete all links that are older than one month
  """
  def delete_links_older_than_one_month() do
    from(l in Link, where: l.created_at < ago(30, "day")) |> Repo.delete_all()
  end
end
