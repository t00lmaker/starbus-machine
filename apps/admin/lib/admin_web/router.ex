defmodule AdminWeb.Router do
  use AdminWeb, :router

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

  pipeline :browser_auth do
    plug Admin.Auth.Pipeline.Browser
  end

  pipeline :api_auth do
    plug Admin.Auth.Pipeline.Api
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", AdminWeb do
    pipe_through [:browser, :browser_auth]

    get "/", PageController, :index
    post "/", PageController, :login
  end

  scope "/", AdminWeb do
    pipe_through [:browser, :browser_auth, :ensure_auth]

    get "/secret", PageController, :secret
    post "/logout", PageController, :logout
    resources "/clients", ClientController
  end

  scope "/api", AdminWeb do
    pipe_through [:api, :browser_auth]

    post "/login", AuthController, :login
    post "/logout", AuthController, :logout
  end

  scope "/api", AdminWeb do
    pipe_through [:api, :browser_auth, :ensure_auth]

    get "/secret", AuthController, :secret
  end

end
