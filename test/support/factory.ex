defmodule ShortUrl.Factory do
  @moduledoc false

  # with Ecto
  use ExMachina.Ecto, repo: ShortUrl.Repo

  alias ShortUrl.Links.Link

  def link_factory do
    %Link{
      original_url: Faker.Internet.domain_name(),
      generated_url: Faker.String.base64()
    }
  end

  {:ok, _} = Application.ensure_all_started(:ex_machina)
end
