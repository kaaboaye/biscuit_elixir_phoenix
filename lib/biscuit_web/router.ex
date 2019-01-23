defmodule BiscuitWeb.Router do
  use BiscuitWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug BiscuitWeb.CORSPlug
  end

  scope "/", BiscuitWeb do
    pipe_through :api

    resources "/teas", TeaController, except: [:new, :edit]
    resources "/brewings", BrewingController, except: [:new, :edit]

    options "/*all", CORSController, :get
  end
end
