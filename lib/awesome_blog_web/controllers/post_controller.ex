defmodule AwesomeBlogWeb.PostController do
  use AwesomeBlogWeb, :controller
  alias AwesomeBlog.Blog
  alias AwesomeBlog.Blog.Post
  alias Guardian.Plug

  def index(conn, _params) do
    with posts <- Blog.list_posts do
    conn |> render("index.html", posts: posts)  
    end
  end


  def new(conn, _params) do
    current_user = Plug.current_resource(conn)
    changeset = Blog.change_post(%Post{})
    
    render(conn, "new.html", changeset: changeset, current_user: current_user)  
  end

  def create(conn, %{"post" => post_params}) do
    current_user = Plug.current_resource(conn)
    post_params = post_params |> Map.put("user_id", current_user.id)
    case Blog.create_post(post_params) do
      {:ok, post} -> 
        conn 
          |> put_flash(:info, "Post created successfully")
          |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} -> 
        render(conn, "new.html", changeset: changeset)
    end  
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    changeset = Blog.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset) 
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Blog.get_post!(id)

    case Blog.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    {:ok, _post} = Blog.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: post_path(conn, :index)) 
  end
end
