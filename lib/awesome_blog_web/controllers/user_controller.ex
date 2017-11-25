defmodule AwesomeBlogWeb.UserController do
  use AwesomeBlogWeb, :controller
  alias AwesomeBlog.Account.User
  alias AwesomeBlog.Account

  # def show(conn, params) do
  #   with %User{} = user <- Account.user_detail(params) do
  #     render(conn, "show.html", user: user)
  #   end
  # end

  # def new(conn, _params) do
  #   changeset = User.changeset(%User{})
  #   render(conn, "new.html", changeset: changeset)
  # end

  # def create(conn, params) do
  #   with {:ok, %User{} = user} <- Account.create_user(params) do
  #     conn
  #     |> put_flash(:info, "#{user.name} is created!")
  #     |> redirect(to: user_path(conn, :show, user))
  #   else
  #     {:error, changeset} -> render(conn, "new.html", changeset: changeset)
  #   end
  # end

  def index(conn, _params) do
    users = Account.get_users()
    render(conn, "index.html", users: users)
  end
end