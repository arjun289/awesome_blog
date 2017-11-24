defmodule AwesomeBlog.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :user_id, references(:users)
      add :title, :string
      add :content, :text
      timestamps()
    end
  end
end
