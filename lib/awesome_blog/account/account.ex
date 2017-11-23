defmodule AwesomeBlog.Account do
  use AwesomeBlog.Data
  alias AwesomeBlog.Account.User

  def create_user(%{"user" => params}) do
    changeset = User.registration_changeset(%User{}, params)
    Repo.insert(changeset)
  end

  def user_detail(%{"id" => id}) do
    User
    |> Repo.get(id)
  end
end