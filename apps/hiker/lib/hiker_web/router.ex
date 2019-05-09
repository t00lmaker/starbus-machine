defmodule HikerWeb.Router do
  use HikerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]

    plug Triplex.ParamPlug, param: :local
  end

  scope "/api", HikerWeb do
    pipe_through :api

    resources "/points", PointController, except: [:new, :edit]

    resources "/routes", RouteController, except: [:new, :edit] do
      resources "/points", PointController, only: [:create, :index]
    end
  end
end
