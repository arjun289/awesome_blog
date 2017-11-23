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

  def get_user_by_email(email) do
    User
    |> Repo.get_by(email: email)
  end
end
