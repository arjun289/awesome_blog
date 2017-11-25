defmodule AwesomeBlogWeb.SessionController do
  
  use AwesomeBlogWeb, :controller
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
  alias AwesomeBlog.Account
  alias AwesomeBlog.Account.User

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    with %User{} = user <- Account.get_user_by_email(email),
      true <- user && checkpw(password, user.password_hash) do
        conn
        |> login(user)
        |> put_flash(:info, "You are now logged in!")
        |> redirect(to: page_path(conn, :index))
      else
        nil -> dummy_checkpw()
          conn
          |>  put_flash(:error, "Invalid Email, User not present!") |> render("new.html")
        false -> conn |> put_flash(:error, "Invalid password!") |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> logout
    |> put_flash(:info, "You have been signed out!")
    |> redirect(to: page_path(conn, :index))
  end
  
  defp logout(conn) do
    Guardian.Plug.sign_out(conn)
  end

  defp login(conn, user) do
    Guardian.Plug.sign_in(conn, user)
  end
end
