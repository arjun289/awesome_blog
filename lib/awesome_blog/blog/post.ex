defmodule AwesomeBlog.Blog.Post do
  use AwesomeBlog.Data
  alias AwesomeBlog.Blog.User
  alias AwesomeBlog.Blog.Post
  @post_fields [:title, :content, :user_id]

  schema "posts" do
    field :title, :string
    field :content, :string
    belongs_to :user, User
    timestamps()  
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
      |> cast(attrs, @post_fields)
      |> validate_required([:title, :content, :user_id])
  end
end