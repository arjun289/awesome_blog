defmodule AwesomeBlogWeb.UserController do
  use AwesomeBlogWeb, :controller
  alias AwesomeBlog.Account.User
  alias AwesomeBlog.Account

  def show(conn, params) do
    with %User{} = user <- Account.user_detail(params) do
      render(conn, "show.html", user: user)
    end
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    
  end
end