defmodule AwesomeBlog.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :user_id, references(:users, on_delete: :nothing)
      add :title, :string
      add :content, :text
      timestamps()
    end

    create index(:posts, [:user_id])
  end
end
