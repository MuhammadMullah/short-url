defmodule ShortUrl.Links.Link do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  # binary key setup
  @primary_key {:id, :binary_id, autogenerate: true}
  @required_fields [:original_url]

  schema "links" do
    field :original_url, :string
    field :identifier, :string

    timestamps(inserted_at: :created_at, updated_at: false)
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:identifier, min: 8, max: 8)
    |> generate_url()
  end

  defp random_string(length) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end

  defp generate_url(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        put_change(changeset, :identifier, random_string(8))
      _ ->
        changeset
    end
  end
end
