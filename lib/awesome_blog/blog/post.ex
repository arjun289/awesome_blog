defmodule AwesomeBlog.Blog.Post do
  use AwesomeBlog.Data
  alias AwesomeBlog.Account.User
  alias AwesomeBlog.Blog.Post
  @post_fields [:title, :content]

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
      |> validate_required([:title, :content])
  end
end