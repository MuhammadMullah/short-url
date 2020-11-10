defmodule ShortUrlWeb.LinkController do
  @moduledoc false
  use ShortUrlWeb, :controller

  alias ShortUrl.Links
  alias ShortUrl.Links.Link
  alias ShortUrlWeb.Endpoint


  def index(conn, _) do
    links = Links.list_links()
    render(conn, "index.html", links: links)
  end

  @doc """
  Displays a form to add a link
  """
  def new(conn, _params) do
    changeset = Links.change_link(%Link{})
    render(conn, "new.html", changeset: changeset)
  end


  @doc """
    Create a new url
  """
  def create(conn, %{"link" => link_params}) do
    case Links.create_link(link_params) do
      {:ok, %Link{identifier: identifier}} ->
        conn
        |> put_flash(:info, "#{Endpoint.url()}/#{identifier}")
        |> redirect(to: Routes.link_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def url_identifier(conn, %{"url_identifier" => identifier}) do
    case Links.get_by_url_identifier(identifier) do
      nil ->
        conn
      %Link{original_url: original_url} ->
        conn
        |> Plug.Conn.resp(:found, "")
        |> Plug.Conn.put_resp_header("location", original_url)
    end
  end
end
