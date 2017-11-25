defmodule AwesomeBlog.Blog.User do
  use AwesomeBlog.Data
  alias Comeonin.Bcrypt
  alias AwesomeBlog.Blog.Post

  schema "users" do
    field :email, :string
    field :name, :string
    has_many :posts, Post
    timestamps()
  end

  @fields ~w(email password name)a

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
