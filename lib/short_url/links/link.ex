defmodule ShortUrl.Links.Link do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  # binary key setup
  @primary_key {:id, :binary_id, autogenerate: true}
  @required_fields [:original_url, :generated_url]

  schema "links" do
    field :original_url, :string
    field :generated_url, :string

    timestamps(inserted_at: :created_at, updated_at: false)
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
