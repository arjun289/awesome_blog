defmodule AwesomeBlog.Account do
  use AwesomeBlog.Data
  alias AwesomeBlog.Account.User

  def create_user() do
    
  end

  def user_detail(%{"id" => id}) do
    User
    |> Repo.get(User, id)
  end
end