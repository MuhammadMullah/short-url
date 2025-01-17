defmodule ShortUrlWeb.Router do
  use ShortUrlWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShortUrlWeb do
    pipe_through :browser

    get "/", LinkController, :new
    post "/links/new", LinkController, :create
    get "/links", LinkController, :index
    get "/:url_identifier", LinkController, :url_identifier
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShortUrlWeb do
  #   pipe_through :api
  # end
end
