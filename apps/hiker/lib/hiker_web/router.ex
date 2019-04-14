defmodule HikerWeb.Router do
  use HikerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]

    plug Triplex.ParamPlug, param: :local
  end

  scope "/api", HikerWeb do
    pipe_through :api

    resources "/routes", RouteController, except: [:new, :edit]
  end
end
