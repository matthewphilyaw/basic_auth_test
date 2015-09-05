defmodule FooApi.Router do
  use FooApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Blaguth
    plug FooApi.Plugs.BasicAuth
  end

  scope "/api", FooApi do
    pipe_through :api
    resources "/bars", BarController
  end

  scope "/", FooApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
end
