defmodule RouterWeb.Router do
  use RouterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RouterWeb do
    pipe_through :api
  end
end
