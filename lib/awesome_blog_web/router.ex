defmodule AwesomeBlogWeb.Router do
  use AwesomeBlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :with_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug AwesomeBlogWeb.Currentuser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AwesomeBlogWeb do
    pipe_through [:browser, :with_session] # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:show, :new, :create, :index]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AwesomeBlogWeb do
  #   pipe_through :api
  # end
end
