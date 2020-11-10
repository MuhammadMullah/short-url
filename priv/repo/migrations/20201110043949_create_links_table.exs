defmodule ShortUrl.Repo.Migrations.CreateLinksTable do
  use Ecto.Migration

  def change do
    create table(:links, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :original_url, :string
      add :identifier, :string

      timestamps(inserted_at: :created_at, updated_at: false)
    end

    create unique_index(:links, [:original_url])
  end
end
