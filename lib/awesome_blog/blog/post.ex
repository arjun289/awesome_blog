defmodule AwesomeBlog.Blog.Post do
  use AwesomeBlog.Data
  alias AwesomeBlog.Account.User
  @post_fields [:title, :content, user_id]

  schema "posts" do
    field :title :string
    field :content, :text
    belongs_to :user, User
    timestamps()  
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
      |> cast(attrs, @post_fields)
      |> validate_required([:user_id, :title])
  end
end